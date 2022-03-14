<?php

class Room
{

    private int $id;
    private string $name;
    private string $picture;
    private string $description;
    private int $nbBeds;
    private int $nbPersons;
    private int $size;
    private float $price;
    private Category $category;
    /** @var Amenity[] */
    private array $amenities;

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId(int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName(string $name): void
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getPicture(): string
    {
        return $this->picture;
    }

    /**
     * @param string $picture
     */
    public function setPicture(string $picture): void
    {
        $this->picture = $picture;
    }

    /**
     * @return string
     */
    public function getDescription(): string
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    /**
     * @return int
     */
    public function getNbBeds(): int
    {
        return $this->nbBeds;
    }

    /**
     * @param int $nbBeds
     */
    public function setNbBeds(int $nbBeds): void
    {
        $this->nbBeds = $nbBeds;
    }

    /**
     * @return int
     */
    public function getNbPersons(): int
    {
        return $this->nbPersons;
    }

    /**
     * @param int $nbPersons
     */
    public function setNbPersons(int $nbPersons): void
    {
        $this->nbPersons = $nbPersons;
    }

    /**
     * @return int
     */
    public function getSize(): int
    {
        return $this->size;
    }

    /**
     * @param int $size
     */
    public function setSize(int $size): void
    {
        $this->size = $size;
    }

    /**
     * @return float
     */
    public function getPrice(): float
    {
        return $this->price;
    }

    /**
     * @param float $price
     */
    public function setPrice(float $price): void
    {
        $this->price = $price;
    }

    /**
     * @return Category
     */
    public function getCategory(): Category
    {
        return $this->category;
    }

    /**
     * @param Category $category
     */
    public function setCategory(Category $category): void
    {
        $this->category = $category;
    }

    /**
     * @return Amenity[]
     */
    public function getAmenities(): array
    {
        return $this->amenities;
    }

    /**
     * @param Amenity[] $amenities
     */
    public function setAmenities(array $amenities): void
    {
        $this->amenities = $amenities;
    }

    public function addAmenity(Amenity $amenity): void
    {
        $this->amenities[] = $amenity;
    }

}