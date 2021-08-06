
* -------------------------------
* Fruchtfolge Model - Compatible include file
*
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2021
* -------------------------------
$onempty
$offdigit

* Base simulation year
set curYear(years) / 2021 /;

* Set including the names of the plots (1-n)
* - Make sure that the names are GAMS compatible (no umlauts, spaces)
set curPlots /
  plot0
/;

* Parameter including the plots attributes, currently only size (ha)
parameter p_plotData(curPlots,plotAttr) /
  plot0.size 6.7466
  plot0.distance 2.34
  plot0.quality 92
/;

* Set containing the names of the crops that may be cultivated
* - Make sure that the names are GAMS compatible (no umlauts, spaces)
* - A list of all crops can be found here: https://github.com/fruchtfolge/client/blob/master/assets/js/crops.js
set curCrops /
* 115 = Weizen
  "115"
* 603 = Zuckerrüben  
  "603"
/;

parameter p_cropPrice /
  "115"  15.9
  "603"   3.16
/;
