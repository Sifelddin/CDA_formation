<?php

require 'classes/Employe.class.php';

$employe1 = new Employe('nom1', 'prenom1', '01-02-2002', 'post1', 2200.20, 'service1', "magasin1", "adresse 1", "05000", "ville1", true);

echo "<pre>";
print_r($employe1);
echo "</pre>";

echo $employe1->disposerChèquesVacances();
//echo $employe1->OrderTransfertBanque();

$employe1->setEnfants([
    "enfant1" => 9,
    "enfant2" => 9,
    "enfant3" => 13,
    "enfant4" => 12,
    "enfant5" => 17,
    "enfant6" => 19
]);

print_r($employe1->attributionChequesNoal());
