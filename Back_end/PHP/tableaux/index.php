<?php

require_once 'src.php';
$a = 15;

$a = 46;

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <main class="main">

        <table class="table">
            <thead>
                <tr>
                    <th>MOIS</th>
                    <th>Nombre de jours</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($Mois as $mois => $jours) : ?>

                    <tr>
                        <td><?= $mois ?></td>
                        <td><?= $jours ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <table class="table">
            <thead>
                <tr>
                    <th>Capitales</th>
                    <th>Pays</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($capitales as $capitale => $country) : ?>

                    <tr>
                        <td><?= $capitale ?></td>
                        <td><?= $country ?></td>
                    </tr>
                <?php endforeach; ?>
                <tr>
                    <td><strong>nombre de pays <?= $nb ?></strong> </td>
                </tr>

            </tbody>
        </table>
        <table class="table">
            <thead>

                <?php foreach ($departements as $index => $regions) : ?>
                    <th> <?= $index ?></th>
            </thead>
            <tbody>
                <tr>
                    <?php foreach ($regions  as $region =>  $num_region) : ?>

                        <td><?= $region . " " . "(" . $num_region . ")" ?></td>

                    <?php endforeach; ?>
                </tr>

            <?php endforeach; ?>
            </tbody>
        </table>
    </main>
</body>

</html>