<?php
class Magasin
{
    private string $nomMagasin;
    private string $adresse;
    private string $codePost;
    private string $ville;
    private bool $avoirRestaurant;


    public function __construct(string $nomMagasin, string $adresse, string $codePost, string $ville, bool $avoirRestaurant)
    {
        $this->nomMagasin = $nomMagasin;
        $this->adresse = $adresse;
        $this->codePost = $codePost;
        $this->ville = $ville;
        $this->avoirRestaurant = $avoirRestaurant;
    }
}
