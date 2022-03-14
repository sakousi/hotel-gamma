<?php
require_once 'database.php';

$room_id = $_GET['id'];
$room = getOneRoom($room_id);

require_once 'layout/header.php';
?>

<section class="page-header room-header container">
    <img src="uploads/<?= $room->getPicture(); ?>" class="img-responsive" alt="Gamma Hotel">
</section>

<section class="container room-content">
    <article class="room-description">
        <div class="room-description-images">
            <img src="uploads/<?= $room->getPicture(); ?>" class="img-responsive" alt="<?= $room->getName(); ?>">
            <!-- TODO: Afficher la liste des images secondaires associées à une chambre -->
            <img src="uploads/room2-1.jpeg" class="img-responsive" alt="Appartement standard">
            <img src="uploads/room2-2.jpeg" class="img-responsive" alt="Appartement standard">
        </div>
        <div class="room-description-content">
            <h1><?= $room->getName(); ?></h1>
            <ul class="room-features">
              <li><i class="fa fa-bed"></i> <?= $room->getNbBeds(); ?></li>
              <li><i class="fa fa-user"></i> <?= $room->getNbPersons(); ?></li>
              <li><i class="fa fa-expand"></i> <?= $room->getSize(); ?>m<sup>2</sup></li>
              <li><i class="fa fa-euro"></i> <?= $room->getPrice(); ?></li>
            </ul>
            <p><?= $room->getDescription(); ?></p>
            <!-- TODO: Afficher la liste des équipements associés à la chambre affichée. -->
        </div>
    </article>
</section>

<?php require_once 'layout/footer.php'; ?>