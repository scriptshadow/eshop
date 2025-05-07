<!-- LOGO DU PROJET -->
<p align="center">
  <h3 align="center">Application E-Commerce Flutter avec TDD et Clean Architecture - EShop</h3>
</p>

Bienvenue dans le dépôt GitHub de l'application Flutter-TDD-Clean-Architecture-E-Commerce-App ! Ce projet illustre les bonnes pratiques modernes de développement d'applications mobiles, exploitant la puissance de Flutter, le Développement Piloté par les Tests (TDD), l'Architecture Propre et le package BLoC (Business Logic Component). Développée avec la dernière version de Flutter 3, cette application E-Commerce exemplifie les meilleures pratiques pour créer des applications Flutter évolutives, maintenables et efficaces.

## Fonctionnalités Clés :

* **Développement Piloté par les Tests (TDD)** : Ce projet met l'accent sur l'importance d'écrire les tests avant le code. Cela garantit une logique d'application rigoureusement testée, améliorant la fiabilité et la maintenabilité.
* **Architecture Propre** : L'application suit une architecture modulaire et propre, séparant les responsabilités en différentes couches : Présentation, Domaine et Données. Cette architecture favorise la réutilisation du code et facilite les futures adaptations.
* **Gestion d'État avec BLoC** : L'application utilise le pattern BLoC pour la gestion d'état. BLoC gère le flux de données et la logique métier de manière réactive, améliorant les performances globales.
* **Fonctionnalités E-Commerce** : L'application présente diverses fonctionnalités E-Commerce telles que la navigation produits, la recherche, le panier et les achats. Les utilisateurs peuvent explorer les produits, les ajouter au panier et finaliser les transactions facilement.

<!-- FONCTIONNALITÉS -->
---
| Fonctionnalité | Cas d'utilisation                                                                                                                                                                                                 |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Produit        | Cas d'utilisation Obtenir un Produit                                                                                                                                                                              |
| Catégorie      | Cas d'utilisation Obtenir les Catégories (Cache)<br/>Cas d'utilisation Obtenir les Catégories (Distant)<br/>Cas d'utilisation Filtrer les Catégories                                                              |
| Panier         | Cas d'utilisation Obtenir le Panier (Cache)<br/>Cas d'utilisation Obtenir le Panier (Distant)<br/>Cas d'utilisation Ajouter un Article au Panier<br/>Cas d'utilisation Synchroniser le Panier                    |
| Utilisateur    | Cas d'utilisation Obtenir l'Utilisateur (Cache)<br/>Cas d'utilisation Connexion<br/>Cas d'utilisation Inscription<br/>Cas d'utilisation Déconnexion                                                               |
| Livraison      | Cas d'utilisation Obtenir les Infos de Livraison (Cache)<br/>Cas d'utilisation Obtenir les Infos de Livraison (Distant)<br/>Cas d'utilisation Ajouter une Info de Livraison<br/>Cas d'utilisation Modifier une Info de Livraison<br/>Cas d'utilisation Sélectionner une Info de Livraison<br/>Cas d'utilisation Obtenir l'Info de Livraison Sélectionnée |
| Commande       | Cas d'utilisation Obtenir les Commandes<br/>Cas d'utilisation Ajouter une Commande                                                                                                                               |

---

## Exemple de Démonstration

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <img src="https://res.cloudinary.com/dhyttttax/image/upload/v1695741758/RepoAssets/home-loading_r39lc6.gif" width="200"/>
            </td>            
            <td style="text-align: center">
                <img src="https://res.cloudinary.com/dhyttttax/image/upload/v1695743869/RepoAssets/home-navigation-min_q1cou5.gif" width="200"/>
            </td>
            <td style="text-align: center">
                <img src="https://res.cloudinary.com/dhyttttax/image/upload/v1695744798/RepoAssets/product-details-order_j0lvw5.gif" width="200" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <img src="https://res.cloudinary.com/dhyttttax/image/upload/v1695745493/RepoAssets/user-delivery-infomarion_zr1eyv.gif" width="200"/>
            </td>
            <td style="text-align: center">
                <img src="https://res.cloudinary.com/dhyttttax/image/upload/v1695746530/RepoAssets/user-auth-screens_k3h6fw.gif" width="200"/>
            </td>
            <td style="text-align: center">
                <img src="https://res.cloudinary.com/dhyttttax/image/upload/v1695747060/RepoAssets/user-sign-in-loading_qjqmt0.gif" width="200"/>
            </td>
        </tr>
    </table>
</div>

## Options de Backend
### Node json-server (API Mock)
* Code Source - https://github.com/scriptshadow/mock-api
* Live - https://mock-api-dz59.onrender.com/


## Contributions :

Nous accueillons les contributions de la communauté Flutter pour améliorer ce projet. Que vous souhaitiez ajouter des fonctionnalités, corriger des bugs ou améliorer la documentation, votre participation est appréciée. Consultez les instructions pour contribuer dans le dépôt pour plus de détails.

<!-- POUR COMMENCER -->
## Pour Commencer

Pour démarrer avec ce projet, suivez les instructions du README pour configurer votre environnement et exécuter l'application localement. Explorez également l'architecture, les tests et la documentation pour comprendre comment construire des applications Flutter robustes.

Nous espérons que cette application E-Commerce Flutter avec TDD et Clean Architecture servira de ressource précieuse pour les développeurs souhaitant apprendre ces concepts. Bon codage !

### Installation

1. Clonez le dépôt
   ```sh
   git clone https://github.com/scriptshadow/eshop.git
      ```
2. Installez les paquets
   ```sh
   flutter pub get
   ```
3. Lancez l'application
   ```sh
   flutter run lib/main.dart
   ```
4. Exécutez les tests
   ```sh
   flutter test
   ```
Pour de l'aide sur Flutter, consultez la
[documentation](https://flutter.io/).

<!-- LICENSE -->
## License
Distribué sous licence MIT.