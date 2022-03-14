# Gamma Hotel

Gamma Hôtel est un hotel situé à Lorient et proposant à ses clients de nombreux logements de différents types (chambre, duplex...).

Un site internet est déjà existant et vous devez reprendre le projet pour ajouter de nouvelles fonctionnalités.

## Installation
Créez la base de données en exécutant le fichier .sql sur votre serveur de base de données (MySQL ou MariaDB) ou bien en ouvrant le fichier hotel-gamma.mwb et en faisant Database > Forward Engineer.

Ensuite, vous devez créer un fichier "parameters.php" à la racine du projet (pour cela, vous pouvez créer une copie du fichier parameters-sample.php).

Ajoutez ensuite dans ce fichier le code suivant ⚠ en modifiant son contenu️⚠ pour que les informations correspondent à votre serveur de base de données :
```php
<?php

define('DB_HOST', '127.0.0.1');
define('DB_NAME', 'hotel_gamma');
define('DB_USER', 'root');
define('DB_PASS', 'root');
```

## TODO:

1. **Afficher dynamiquement l'année en cours dans le pied de page (1 pt).**
Actuellement, l'année du copyright est affichée en dur dans le code HTML, cela signifie que dans 1 an, l'année affichée ne sera plus à jour. Utilisez le langage PHP pour afficher dynamiquement l'année en cours pour corriger ce problème.
2. **Trier la liste des chambres sur la page d'accueil (3 pts).**
Pour le moment, la liste des chambres affichées sur la page d'accueil est triée par identifiant. Modifiez le code source pour afficher la liste triée par prix des chambres (de la moins chère à la plus chère).
3. **Afficher la catégorie des chambres sur la page d'accueil (3 pts).**
Sur la page d'accueil, la liste des chambres est affichées. Cependant, le nom de la catégorie associée à chaque chambre n'est pas affiché. Ajouter cette information en dessous du nom de chaque chambre.
4. **Toujours afficher le nom des chambres en majuscules (3 pts).**
Sur l'ensemble des pages du site, afficher le nom des chambres en majuscules. Cette modification doit être réalisée en PHP et doit "forcer" les développeurs à afficher les noms en majuscules.
5. **Afficher dynamiquement la liste des catégories (5 pts).**
Sur la page d'accueil, un formulaire permet d'effectuer une recherche. Une liste déroulante permet de sélectionner la catégorie du logement que l'internaute souhaite rechercher. Cependant, cette liste n'utilise pas le langage PHP et affiche une liste statique de catégories. Vous devez donc utiliser le langage PHP et SQL pour rechercher en base de données la liste de l'ensemble des catégories triées alphabétiquement et les afficher dans cette liste (utiliser de préférence la classe Category pour stocker les données retournées par la base de données).
6. **Afficher la liste des équipements associés à une chambre (3 pts).**
Afficher sur la page de détail d'une chambre (room.php) la liste des équipements associés à la chambre affichée. Vous êtes libre de choisir le format d'affichage des données (liste à puces par exemple).
7. **Afficher la liste des images secondaires associées à une chambre (2 pts).**
Sur la page de détail d'une chambre (room.php), la liste des images secondaires n'est pas dynamique. Utilisez le langage PHP pour afficher les images correspondant à la chambre affichée.

## Fichiers à rendre
- Fichier zip contenant l'ensemble du code source du site internet.
