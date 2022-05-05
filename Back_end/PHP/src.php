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
function filter_func($pays){
    return $pays[0] != "B";
}
$filtered_arr = array_filter($capitales , 'filter_func', ARRAY_FILTER_USE_KEY );

$capitales = $filtered_arr;

$nb = count($capitales);

$departements = array(
    "Hauts-de-france" => array("Aisne", "Nord", "Oise", "Pas-de-Calais", "Somme"),
    "Bretagne" => array("Côtes d'Armor", "Finistère", "Ille-et-Vilaine", "Morbihan"),
    "Grand-Est" => array("Ardennes", "Aube", "Marne", "Haute-Marne", "Meurthe-et-Moselle", "Meuse", "Moselle", "Bas-Rhin", "Haut-Rhin", "Vosges"),
    "Normandie" => array("Calvados", "Eure", "Manche", "Orne", "Seine-Maritime")
);

