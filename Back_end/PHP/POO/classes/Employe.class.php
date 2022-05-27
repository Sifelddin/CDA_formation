<?php
require 'Magasin.class.php';
class Employe extends Magasin
{
    private string $nom;
    private string $prenom;
    private string $dateEmbauche;
    private string $post;
    private float $salaire;
    private string $service;
    private array $enfants = [];

    function __construct(string $nom, string $prenom, string $dateEmbauche, string $post, float $salaire, string $service, string $nomMagasin, string $adresse, string $codePost, string $ville, bool $avoirRestaurant)
    {
        $regx = '/^(\d{1,2})([-])(\d{1,2})([-])(\d{4})$/';
        $this->nom = $nom;
        $this->prenom = $prenom;
        preg_match($regx, $dateEmbauche) ? $this->dateEmbauche = $dateEmbauche : throw new Exception("la form de la date doit etre selon cette forme : 01-05-2022 ");
        $this->post = $post;
        $this->salaire = $salaire;
        $this->service = $service;
        $this->nomMagasin = $nomMagasin;
        $this->adresse = $adresse;
        $this->codePost = $codePost;
        $this->ville = $ville;
        $this->avoirRestaurant = $avoirRestaurant;
    }

    public function getJobYears(): string
    {
        $dateE = new DateTime($this->dateEmbauche);
        $now = new DateTime();
        return $dateE->diff($now)->y . " years!";
    }

    protected function primeAnnuel(): float
    {
        $primeSalaireAnnuel = $this->salaire + ($this->salaire * 5 / 100);
        $primeAnciennete = ($this->salaire * 2 / 100) * (int)$this->getJobYears();
        return $primeSalaireAnnuel + $primeAnciennete;
    }
    public function OrderTransfertBanque()
    {
        $today = new DateTime();
        $day = $today->format('d');
        $month = $today->format('m');
        return  $month === '05' && $day === '09' ? "L'order de transfert a été envoyé à la banque avec un montant de : " . $this->primeAnnuel() :  "la prime annuel sera versé le 30/11";
    }
    public function disposerChèquesVacances(): bool
    {
        return  $this->getJobYears() >= 1;
    }

    public function setEnfants(array $enfants): array
    {
        return $this->enfants = $enfants;
    }
    public function getEnfants(): array
    {
        return $this->enfants;
    }

    public function attributionChequesNoal(): array
    {

        $chequesListe = [];

        foreach ($this->enfants as $enfant => $age) {

            if ($age >= 0 && $age <= 10) {
                $chequesListe[] = 20;
            } elseif ($age >= 11 && $age <= 15) {
                $chequesListe[] = 30;
            } elseif ($age >= 16 && $age <= 18) {
                $chequesListe[] = 50;
            }
        }
        return $chequesListe;
    }
}
