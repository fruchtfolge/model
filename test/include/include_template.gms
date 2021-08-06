
* -------------------------------
* Fruchtfolge Model - Compatible include file
*
* This is the include file for the binary approach -
* only one crop may be cultivated on a n individual plot
*
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2020
* -------------------------------
* Static data
$setglobal farmName ExampleFarm
***
* The following data is fix and can be ignored when adapting the include file
***
set plotAttr / size /;
set cropAttr / maxShare /;
set symbol / lt,gt /;
set months /jan,feb,mrz,apr,mai,jun,jul,aug,sep,okt,nov,dez/;
set years / 2001*2050 /;
set manAmounts /0,10,15,20,25,30,40,50,60/;
set nReduction /'0','0.1','0.2','0.3','0.4'/;
set solidAmounts /'0','5','10','12','15','20'/;
set catchCrop /true, false/;
set autumnFert /true, false/;
set man_attr / amount, N, P/;

set data_attr /
jan
feb
mrz
apr
mai
jun
jul
aug
sep
okt
nov
dez
grossMarginHa
efaFactor
autumnFertm3
/;

***
* The following data is REQUIRED for the parameterization of a farm
***


* Amount (tons), N/P content of liquid manure
*   - set to 0 in order to ignore manure handling
parameter p_manure(man_attr) /
  amount 0
  n 0
  p 0
/;
* Amount (tons), N/P content of solid manure
*   - set to 0 in order to ignore solid manure handling
parameter p_solid(man_attr) /
  amount 0
  n 0
  p 0
/;

$onempty
$offdigit

* Base simulation year
set curYear(years) / 2021 /;
* Boolean whether to use DueV 2020 restrictions
* - falls back to DueV 2017 otherwise
$setglobal duev2020 "true"
* Max. manure storage capacity (tons)
scalar manStorage /1500 /;
* Manure export price (EUR/ton) in spring
scalar manPriceSpring /12 /;
* Manure export price (EUR/ton) in autumn
scalar manPriceAutumn /12 /;
* Max. solid manure storage capacity (tons)
scalar solidStorage /0 /;
* Solid manure export price (EUR/ton) in spring
scalar solidPriceSpring /0 /;
* Solid manure export price (EUR/ton) in spring
scalar solidPriceAutumn /0 /;

* Set including the names of the plots (1-n)
* - Make sure that the names are GAMS compatible (no umlauts, spaces)
set curPlots /
  plot0
/;

* Parameter including the plots attributes, currently only size (ha)
parameter p_plotData(curPlots,plotAttr) /
  plot0.size 6.7466
/;

* Set containing the names of the crops that may be cultivated
* - Make sure that the names are GAMS compatible (no umlauts, spaces)
* - A list of all crops can be found here: https://github.com/fruchtfolge/client/blob/master/assets/js/crops.js
set curCrops /
  WinterWheat
/;

* Set containing the botanical crop group of the crops that may be cultivated
* - This is necessary for adhering to the EU Greening obligation
* - Make sure that the names are GAMS compatible (no umlauts, spaces)
* - Pairings of crops/crop groups can be found here: https://github.com/fruchtfolge/client/blob/master/assets/js/crops.js
set cropGroup /
  Wheat 
/;

* A cross-set linking each crop to a crop groups (according to EU Greening)
* - Pairings of crops/crop groups can be found here: https://github.com/fruchtfolge/client/blob/master/assets/js/crops.js
set crops_cropGroup(curCrops,cropGroup) /
  WinterWheat.Wheat
/;

* Max. crop share (ha) for each crop
* - Can be calculated by the following formula:
* - 1 / (rotationalBreakYears + 1) * totalArableLand
* - Values for the crop rotational break (in years) can be found here:
* - https://github.com/fruchtfolge/client/blob/master/assets/js/cropRotValues.js
parameter p_cropData(curCrops,cropAttr) /
  WinterWheat.maxShare 177.211
/;

* Gross-margin related data for each plot and crop combination
* - Time requirements, and gross margins for cultivating a crop on a plot considering 
* - plot size and distance can be calculated using data from Heinrichs et al. (2021)
parameter p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,*) /
plot0.WinterWheat.'0'.'0'.'0'.'false'.'false'.FEB 0.490
plot0.WinterWheat.'0'.'0'.'0'.'false'.'false'.MRZ 0.154
plot0.WinterWheat.'0'.'0'.'0'.'false'.'false'.APR 2.530
plot0.WinterWheat.'0'.'0'.'0'.'false'.'false'.MAI 0.154
plot0.WinterWheat.'0'.'0'.'0'.'false'.'false'.JUN 1.310
plot0.WinterWheat.'0'.'0'.'0'.'false'.'false'.AUG 3.097
plot0.WinterWheat.'0'.'0'.'0'.'false'.'false'.SEP 2.539
plot0.WinterWheat.'0'.'0'.'0'.'false'.'false'.OKT 3.422
plot0.WinterWheat.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 502.515
/;
