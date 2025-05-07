#!/usr/bin/env bash
set -e

# Utilisation : ./release.sh [version] [numéro_de_build]
# Si version non fournie, on l'extrait de pubspec.yaml et on incrémente le patch.

# 1) Détection de la version
if [[ -n "$1" ]]; then
  VERSION="$1"
else
  # Extrait la version sans build number (ex: 1.2.3)
  OLD_VERSION=$(grep '^version:' pubspec.yaml | sed -E 's/version: ([0-9]+\.[0-9]+\.[0-9]+).*/\1/')
  IFS='.' read -r MAJ MIN PATCH <<< "$OLD_VERSION"
  PATCH=$((PATCH+1))
  VERSION="${MAJ}.${MIN}.${PATCH}"
  echo "Version non spécifiée, on passe de $OLD_VERSION à $VERSION"
fi

# 2) Numéro de build (timestamp par défaut ou second arg)
BUILD_NUMBER=${2:-$(date +%s)}

# 3) Préparation de sed pour in-place
tmpfile=$(mktemp)
if sed --version >/dev/null 2>&1; then
  SED_INLINE=(-i)
else
  SED_INLINE=(-i "")
fi

# 4) Vérifier qu’on est sur main
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$BRANCH" != "main" ]]; then
  echo "Erreur : tu dois lancer ce script depuis 'main', pas '$BRANCH'."
  exit 1
fi

# 5) Mise à jour de pubspec.yaml
echo "→ Mise à jour de pubspec.yaml en version ${VERSION}+${BUILD_NUMBER}"
sed "${SED_INLINE[@]}" -E "s/^version:.*/version: ${VERSION}+${BUILD_NUMBER}/" pubspec.yaml

# 6) Mise à jour de CHANGELOG.md
DATE=$(date +"%Y-%m-%d")
ENTETE="## [${VERSION}] - ${DATE}"
if [[ ! -f CHANGELOG.md ]]; then
  echo -e "# Changelog\n\n${ENTETE}\n\n### Ajouté\n- " > CHANGELOG.md
else
  echo "→ Ajout de la section ${VERSION} dans CHANGELOG.md"
  awk -v h="$ENTETE" 'NR==1{print "# Changelog\n" h "\n\n### Ajouté\n- "; next}1' CHANGELOG.md > "$tmpfile"
  mv "$tmpfile" CHANGELOG.md
fi

# 7) Commit et tag
git add pubspec.yaml CHANGELOG.md
git commit -m "chore : bump version ${VERSION}+${BUILD_NUMBER}"
git tag -a "v${VERSION}" -m "Release v${VERSION}"

# 8) Push main + tags
git push origin main
git push origin --tags

# 9) Fusion main → release
echo "→ Fusion de main dans release"
if git rev-parse --verify release >/dev/null 2>&1; then
  git checkout release
  git pull origin release
else
  git checkout -b release
fi
git merge main --no-ff -m "Merge main into release for v${VERSION}"
git push origin release

# 10) Retour sur main
git checkout main

echo "✅ Release ${VERSION} (${BUILD_NUMBER}) prête : main et release sont à jour."
