<?php

$Mois = [
    "janvier" => 31,
    "février" => 28,
    "mars" => 31,
    "avril" => 30,
    "Mai" => 31,
    "juin" => 30,
    "juillet" => 31,
    "oute" => 30,
    "août" => 31,
    "septembre" => 30,
    "octobre" => 31,
    "novembre" => 30,
    "décembre" => 31,
];

asort($Mois);

$capitales = array(
    "Bucarest" => "Roumanie",
    "Bruxelles" => "Belgique",
    "Oslo" => "Norvège",
    "Ottawa" => "Canada",
    "Paris" => "France",
    "Port-au-Prince" => "Haïti",
    "Port-d'Espagne" => "Trinité-et-Tobago",
    "Prague" => "République tchèque",
    "Rabat" => "Maroc",
    "Riga" => "Lettonie",
    "Rome" => "Italie",
    "San José" => "Costa Rica",
    "Santiago" => "Chili",
    "Sofia" => "Bulgarie",
    "Alger" => "Algérie",
    "Amsterdam" => "Pays-Bas",
    "Andorre-la-Vieille" => "Andorre",
    "Asuncion" => "Paraguay",
    "Athènes" => "Grèce",
    "Bagdad" => "Irak",
    "Bamako" => "Mali",
    "Berlin" => "Allemagne",
    "San José" => "Costa Rica",
    "Santiago" => "Chili",
    "Varsovie" => "Pologne",
    "Budapest" => "Hongrie",
    "Le Caire" => "Egypte",
    "Canberra" => "Australie",
    "Caracas" => "Venezuela",
    "Jakarta" => "Indonésie",
    "Kiev" => "Ukraine",
    "Kigali" => "Rwanda",
    "San José" => "Costa Rica",
    "Santiago" => "Chili",
    "Madrid" => "Espagne",
    "Malé" => "Maldives",
    "Mexico" => "Mexique",
    "San José" => "Costa Rica",
    "Santiago" => "Chili",
    "Minsk" => "Biélorussie",
    "Moscou" => "Russie",
    "Nairobi" => "Kenya",
    "New Delhi" => "Inde",
    "Stockholm" => "Suède",
    "Téhéran" => "Iran",
    "Tokyo" => "Japon",
    "Tunis" => "Tunisie",
    "Copenhague" => "Danemark",
    "Dakar" => "Sénégal",
    "Damas" => "Syrie",
    "Dublin" => "Irlande",
    "Erevan" => "Arménie",
    "La Havane" => "Cuba",
    "Helsinki" => "Finlande",
    "Islamabad" => "Pakistan",
    "Vienne" => "Autriche",
    "Vilnius" => "Lituanie",
    "Zagreb" => "Croatie"
);
// 1 affichage de la liste des capitales  (par ordre alphabétique) suivie du nom du pays.
//ksort($capitales);

//2 affichage la liste des pays (par ordre alphabétique) suivie du nom de la capitale.
$capitales = array_flip($capitales);
ksort($capitales);


// Affichage le nombre de pays dans le tableau.

// suppression des pays commençant par la lettre B
function filter_func($pays)
{
    return $pays[0] != "B";
}
$filtered_arr = array_filter($capitales, 'filter_func', ARRAY_FILTER_USE_KEY);

$capitales = $filtered_arr;

$nb = count($capitales);

$departements = array(
    "Hauts-de-france" => array("Aisne" => 02, "Nord" => 59, "Oise" => 60, "Pas-de-Calais" => 62, "Somme" => 80),
    "Bretagne" => array("Côtes d'Armor" => 22, "Finistère" => 29, "Ille-et-Vilaine" => 35, "Morbihan" => 59),
    "Grand-Est" => array("Ardennes" => 8 , "Aube" => 10, "Marne" => 51, "Haute-Marne" => 52, "Meurthe-et-Moselle" => 54, "Meuse" => 55, "Moselle" => 57, "Bas-Rhin" => 67, "Haut-Rhin" => 68, "Vosges" => 88),
    "Normandie" => array("Calvados" => 14, "Eure" => 27, "Manche" => 50, "Orne" => 61, "Seine-Maritime" => 76)
);

//afficher seulement les regions 
$regions = array_keys($departements);
