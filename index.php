<?php
require_once 'database.php';

$rooms = getAllRooms();

require_once 'layout/header.php';
?>

<section class="page-header home-header container">
    <img src="images/home-header-bg.jpg" class="img-responsive" alt="Gamma Hotel">
</section>

<section class="container home-content">
    <h1>Bienvenue à l'hotel Gamma</h1>

    <form class="form-search">
        <div class="form-group">
            <label for="search-category">Catégorie</label>
            <!-- TODO: Afficher dynamiquement la liste des catégories. -->
            <select name="category_id" id="search-category">
              <?php
              getAllCategory();

              foreach ($categorys->getName() as $name)
                echo "<option>".$name."</option>";
              ?>
            </select>
        </div>
        <div class="form-group">
            <label for="search-price-from">Prix min</label>
            <input type="number" id="search-price-from" min="0" value="0">
        </div>
        <div class="form-group">
            <label for="search-price-to">Prix max</label>
            <input type="number" id="search-price-to" min="0" value="200">
        </div>
        <button type="submit" class="button button-primary">
            <i class="fa fa-search"></i>
            Rechercher
        </button>
    </form>

    <h2>Découvrez nos chambres</h2>
    <div class="grid grid-rooms">

      <?php foreach ($rooms as $room) : ?>
        <article>
          <header>
            <img src="uploads/<?= $room->getPicture(); ?>" class="img-responsive" alt="<?= $room->getName(); ?>">
          </header>
          <footer>
            <h3><?= strtoupper($room->getName()); ?></h3>
            <p>Catégorie: <?= $room->getCategory()->getName(); ?></p>
            <!-- TODO: Afficher le nom de la catégorie associée à la chambre. -->
            <ul class="room-features">
              <li><i class="fa fa-bed"></i> <?= $room->getNbBeds(); ?></li>
              <li><i class="fa fa-user"></i> <?= $room->getNbPersons(); ?></li>
              <li><i class="fa fa-expand"></i> <?= $room->getSize(); ?>m<sup>2</sup></li>
              <li><i class="fa fa-euro"></i> <?= $room->getPrice(); ?></li>
            </ul>
            <a href="room.php?id=<?= $room->getId(); ?>" class="button button-primary">
              <i class="fa fa-eye"></i>
              Voir plus
            </a>
          </footer>
        </article>
      <?php endforeach; ?>

    </div>
</section>

<?php require_once 'layout/footer.php'; ?>