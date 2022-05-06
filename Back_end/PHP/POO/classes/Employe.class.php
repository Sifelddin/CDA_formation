<?php

class Employe
{
    private $nom;
    private $prenom;
    private $dateEmbauche;
    private $post;
    private $salaire;
    private $service;

    function __construct(string $nom, string $prenom, string $dateEmbauche, string $post, float $salaire, string $service)
    {
        $regx = '/^(\d{1,2})([-|\\|\/|_])(\d{1,2})([-|\\|_|\/])(\d{4})$/';
        $this->nom = $nom;
        $this->prenom = $prenom;
        preg_match($regx, $dateEmbauche) != false ?    $this->dateEmbauche = $dateEmbauche : throw new Exception("la form de la date doit etre selo ces form : 01/05/2022 | 01-05-2022 | 01\\05\\2022 | 01_05_2022");
        $this->post = $post;
        $this->salaire = $salaire;
        $this->service = $service;
    }

    public function getYearsJob()
    {
        $dateEmbauche = date_create_from_format("d-m-Y", $this->dateEmbauche);
        echo $dateEmbauche;
        $dateToday = date_create_from_format("d-m-Y", date('d-m-Y'));
        // date_diff($dateToday, $dateEmbauche);
    }
}
