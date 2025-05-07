#!/usr/bin/env bash
set -e

# Usage: ./release.sh <version> [build_number]
if [ -z "$1" ]; then
  echo "Usage: $0 <version> [build_number]"
  exit 1
fi

VERSION=$1
BUILD_NUMBER=${2:-$(date +%s)}

# Detect sed in-place flag for cross-platform compatibility
tmpfile=$(mktemp)
if sed --version >/dev/null 2>&1; then
  # GNU sed
  SED_INLINE=(-i)
else
  # BSD sed (macOS)
  SED_INLINE=(-i "")
fi

# 1. Bump version in pubspec.yaml
echo "Updating version to ${VERSION}+${BUILD_NUMBER} in pubspec.yaml..."
sed "${SED_INLINE[@]}" -E "s/^version: .*/version: ${VERSION}+${BUILD_NUMBER}/" pubspec.yaml

# 2. Prepend new section in CHANGELOG.md
DATE=$(date +"%Y-%m-%d")
HEADER="## [${VERSION}] - ${DATE}"
if [ ! -f CHANGELOG.md ]; then
  echo -e "# Changelog\n\n${HEADER}\n\n### Added\n- " > CHANGELOG.md
else
  echo "Prepending changelog section..."
  awk -v h="$HEADER" 'NR==1{print "# Changelog\n" h "\n\n### Added\n- "; next}1' CHANGELOG.md > "$tmpfile"
  mv "$tmpfile" CHANGELOG.md
fi

# 3. Commit changes and tag
BRANCH=$(git rev-parse --abbrev-ref HEAD)

git add pubspec.yaml CHANGELOG.md
git commit -m "chore: bump version to ${VERSION}+${BUILD_NUMBER}"
echo "Creating tag v${VERSION}..."
git tag -a "v${VERSION}" -m "Release v${VERSION}"

# 4. Push branch and tag
echo "Pushing to origin ${BRANCH} and tags..."
git push origin "${BRANCH}"
git push origin "v${VERSION}"

echo "Release ${VERSION} created successfully!"
