<?php

require 'classes/Employe.class.php';

$employe1 = new Employe('nom1', 'prenom1', '01/02/2002', 'post1', 2200.20, 'service1');

echo "<pre>";
var_dump($employe1);
echo "</pre>";

$employe1->getYearsJob();
