<?php


class Personnage
{
    private $nom;
    private $prenom;
    private $age;
    private $sexe;

    function __construct($nom, $prenom, $age, $sexe)
    {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->age = $age;
        $this->sexe = $sexe;
    }

    public function setName($nom)
    {
        return $this->nom = $nom;
    }

    public function getName()
    {
        return $this->nom;
    }
}
