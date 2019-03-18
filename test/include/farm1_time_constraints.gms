* -------------------------------
* Fruchtfolge Model - Include file
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2019
* -------------------------------

$include 'test/include/farm1.gms'

parameter p_availLabour(months) /
 jan 800
 feb 800
 mrz 800
 apr 800
 mai 800
 jun 800
 jul 800
 aug 800
 sep 800
 okt 800
 nov 800
 dez 800
/;

parameter p_availFieldWorkDays(months) /
 jan 0
 feb 0
 mrz 3
 apr 17
 mai 21
 jun 21
 jul 22
 aug 22
 sep 23
 okt 19
 nov 9
 dez 0
/;
