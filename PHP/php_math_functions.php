<?php
// initial value
$initial = '555';
// octal to decimal conversion
$a = octdec($initial);
echo $a . "\n";
// degree to radian conversion
$b = deg2rad($a);
echo $b . "\n";
// get cosine
$c = cos($b);
echo $c . "\n";
// round to 3 decimal places
$d = round($c, 3);
echo $d . "\n";
// natural log of variable d
$e = log($d);
echo $e . "\n";
// absolute value of variable e
$f = abs($e);
echo $f . "\n";
// inverse/arc cosine of variable f
$g = acos($f);
echo $g . "\n";
// radian to degree
$h = rad2deg($g);
echo $h . "\n";
// round down
$i = floor($h);
echo $i . "\n";
// subtract i to 47
$j = $i - 47;
echo $j . "\n";
