* -------------------------------
* Fruchtfolge Model - Include file
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2019
* -------------------------------

$include 'test/include/farm1.gms'

parameter p_availLabour(months) /
 jan 400
 feb 400
 mrz 400
 apr 400
 mai 400
 jun 400
 jul 400
 aug 400
 sep 400
 okt 400
 nov 400
 dez 400
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
