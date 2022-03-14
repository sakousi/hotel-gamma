<?php

require_once 'parameters.php';
require_once 'class/Room.php';
require_once 'class/Category.php';
require_once 'class/Amenity.php';

try{
    $connection = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME,  DB_USER , DB_PASS, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES => false
    ]);
} catch (PDOException $exception){
    echo "Erreur de connection a la base de données";
    die;
}

/**
 * Récupérer la liste de l'ensemble des chambres
 * @return Room[]
 */
function getAllRooms() {
    global $connection;

    $query = "
        SELECT
            room.id,
            room.name,
            room.picture,
            room.description,
            room.nb_beds AS nbBeds,
            room.nb_persons AS nbPersons,
            room.size,
            room.price,
            room.category_id,
            category.name AS category_name
        FROM room
        INNER JOIN category ON room.category_id = category.id;
    ";

    $stmt = $connection->prepare($query);
    $stmt->execute();

    // Récupérer les rooms et les mettre dans un tableau d'objets de type Room
    /** @var Room[] $rooms */
    $rooms = $stmt->fetchAll(PDO::FETCH_CLASS, Room::class);

    // Associer chacune des chambres (rooms) à leurs associations
    foreach ($rooms as $room) {
        $category = new Category();
        $category->setId($room->category_id);
        $category->setName($room->category_name);
        $room->setCategory($category);
    }

    return $rooms;
}

/**
 * Récupérer les données liées à une chambre à partir de son id
 * @return Room
 */
function getOneRoom(int $id) {
    global $connection;

    $query = "
        SELECT
            room.id,
            room.name,
            room.picture,
            room.description,
            room.nb_beds AS nbBeds,
            room.nb_persons AS nbPersons,
            room.size,
            room.price,
            room.category_id,
            category.name AS category_name
        FROM room
        INNER JOIN category ON room.category_id = category.id
        WHERE room.id = :id;
    ";

    $stmt = $connection->prepare($query);
    $stmt->bindValue(':id', $id);
    $stmt->execute();

    /** @var Room $room */
    $room = $stmt->fetchObject(Room::class);

    // Remplir les données de la catégorie associée à la chambre
    $category = new Category();
    $category->setId($room->category_id);
    $category->setName($room->category_name);
    $room->setCategory($category);

    // Remplir les données des équipements associés à la chambre
    $room->setAmenities(getRoomAmenities($room->getId()));

    return $room;
}

/**
 * Récupérer la liste des équipements d'une chambre
 * @param int $roomId
 * @return Amenity[]
 */
function getRoomAmenities(int $room_id) {
    global $connection;

    $query = "
        SELECT
           amenity.id,
           amenity.name
        FROM amenity
        INNER JOIN room_has_amenity ON amenity.id = room_has_amenity.amenity_id
        WHERE room_has_amenity.room_id = :room_id;
    ";

    $stmt = $connection->prepare($query);
    $stmt->bindValue(':room_id', $room_id);
    $stmt->execute();

    // Récupérer les équipements et les mettre dans un tableau d'objets de type Amenity
    /** @var Amenity[] $amenities */
    $amenities = $stmt->fetchAll(PDO::FETCH_CLASS, Amenity::class);

    return $amenities;
}