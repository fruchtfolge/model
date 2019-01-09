* -------------------------------
* Fruchtfolge Model - Include file
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2019
* -------------------------------

* Static data
set grossMarginAttr / price,yield,directCosts,variableCosts,fixCosts,grossMargin,revenue,distanceCosts,croppingFactor,yieldCap /;
set plotAttr / size,distance,quality /;
set cropAttr / rotBreak,maxShare,minSoilQuality,efaFactor/;
set symbol / lt,gt /;
set halfMonths / jan1,jan2,feb1,feb2,mar1,mar2,apr1,apr2,may1,may2,jun1,jun2,jul1,jul2,aug1,aug2,sep1,sep2,oct1,oct2,nov1,nov2,dez1,dez2 /;

set years / 2001*2019 /;
set curYear(years) / 2019 /;
set soilTypes /
'Tonschluffe (tu)'
/;

set plots /
 '2019-01-08T15:19:29.867Z'
/;

set curPlots(plots) /
 '2019-01-08T15:19:29.867Z'
/;

parameter p_plotData(curPlots,plotAttr) /
 '2019-01-08T15:19:29.867Z'.size 5.03
 '2019-01-08T15:19:29.867Z'.distance 0.4
 '2019-01-08T15:19:29.867Z'.quality 70.5
/;

set plots_soilTypes(curPlots,soilTypes) /
 '2019-01-08T15:19:29.867Z'.'Tonschluffe (tu)'
/;

set plots_rootCropCap(curPlots) /
 '2019-01-08T15:19:29.867Z' 'YES'
/;

set crops /
 ''
 'Ackergras - Anwelksilage'
/;

set curCrops(crops) /
 ''
 'Ackergras - Anwelksilage'
/;

set cropGroup /
 ''
 'Gräser'
/;

set crops_cropGroup(curCrops,cropGroup) /
 ''.''
 'Ackergras - Anwelksilage'.'Gräser'
/;

parameter p_cropData(curCrops,cropAttr) /
 'Ackergras - Anwelksilage'.rotBreak 0
 'Ackergras - Anwelksilage'.maxShare 100
 'Ackergras - Anwelksilage'.minSoilQuality 0
 'Ackergras - Anwelksilage'.efaFactor 0
/;

parameter p_croppingFactor(curCrops,curCrops) /
 'Ackergras - Anwelksilage'.'Ackergras - Anwelksilage' 4
/;

parameter p_grossMarginData(crops,years,grossMarginAttr) /
 'Ackergras - Anwelksilage'.2001.yield 41.6
 'Ackergras - Anwelksilage'.2001.price 56.79
 'Ackergras - Anwelksilage'.2001.directCosts 265.88
 'Ackergras - Anwelksilage'.2001.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2001.fixCosts 778.26
 'Ackergras - Anwelksilage'.2002.yield 41.6
 'Ackergras - Anwelksilage'.2002.price 56.79
 'Ackergras - Anwelksilage'.2002.directCosts 265.88
 'Ackergras - Anwelksilage'.2002.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2002.fixCosts 778.26
 'Ackergras - Anwelksilage'.2003.yield 41.6
 'Ackergras - Anwelksilage'.2003.price 56.79
 'Ackergras - Anwelksilage'.2003.directCosts 265.88
 'Ackergras - Anwelksilage'.2003.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2003.fixCosts 778.26
 'Ackergras - Anwelksilage'.2004.yield 41.6
 'Ackergras - Anwelksilage'.2004.price 56.79
 'Ackergras - Anwelksilage'.2004.directCosts 265.88
 'Ackergras - Anwelksilage'.2004.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2004.fixCosts 778.26
 'Ackergras - Anwelksilage'.2005.yield 41.6
 'Ackergras - Anwelksilage'.2005.price 56.79
 'Ackergras - Anwelksilage'.2005.directCosts 265.88
 'Ackergras - Anwelksilage'.2005.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2005.fixCosts 778.26
 'Ackergras - Anwelksilage'.2006.yield 41.6
 'Ackergras - Anwelksilage'.2006.price 56.79
 'Ackergras - Anwelksilage'.2006.directCosts 265.88
 'Ackergras - Anwelksilage'.2006.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2006.fixCosts 778.26
 'Ackergras - Anwelksilage'.2007.yield 41.6
 'Ackergras - Anwelksilage'.2007.price 56.79
 'Ackergras - Anwelksilage'.2007.directCosts 265.88
 'Ackergras - Anwelksilage'.2007.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2007.fixCosts 778.26
 'Ackergras - Anwelksilage'.2008.yield 41.6
 'Ackergras - Anwelksilage'.2008.price 56.79
 'Ackergras - Anwelksilage'.2008.directCosts 265.88
 'Ackergras - Anwelksilage'.2008.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2008.fixCosts 778.26
 'Ackergras - Anwelksilage'.2009.yield 41.6
 'Ackergras - Anwelksilage'.2009.price 56.79
 'Ackergras - Anwelksilage'.2009.directCosts 265.88
 'Ackergras - Anwelksilage'.2009.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2009.fixCosts 778.26
 'Ackergras - Anwelksilage'.2010.yield 41.6
 'Ackergras - Anwelksilage'.2010.price 56.79
 'Ackergras - Anwelksilage'.2010.directCosts 265.88
 'Ackergras - Anwelksilage'.2010.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2010.fixCosts 778.26
 'Ackergras - Anwelksilage'.2011.yield 41.6
 'Ackergras - Anwelksilage'.2011.price 56.79
 'Ackergras - Anwelksilage'.2011.directCosts 265.88
 'Ackergras - Anwelksilage'.2011.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2011.fixCosts 778.26
 'Ackergras - Anwelksilage'.2012.yield 41.6
 'Ackergras - Anwelksilage'.2012.price 56.79
 'Ackergras - Anwelksilage'.2012.directCosts 265.88
 'Ackergras - Anwelksilage'.2012.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2012.fixCosts 778.26
 'Ackergras - Anwelksilage'.2013.yield 41.6
 'Ackergras - Anwelksilage'.2013.price 56.79
 'Ackergras - Anwelksilage'.2013.directCosts 265.88
 'Ackergras - Anwelksilage'.2013.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2013.fixCosts 778.26
 'Ackergras - Anwelksilage'.2014.yield 41.6
 'Ackergras - Anwelksilage'.2014.price 56.79
 'Ackergras - Anwelksilage'.2014.directCosts 265.88
 'Ackergras - Anwelksilage'.2014.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2014.fixCosts 778.26
 'Ackergras - Anwelksilage'.2015.yield 41.6
 'Ackergras - Anwelksilage'.2015.price 56.79
 'Ackergras - Anwelksilage'.2015.directCosts 265.88
 'Ackergras - Anwelksilage'.2015.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2015.fixCosts 778.26
 'Ackergras - Anwelksilage'.2016.yield 41.6
 'Ackergras - Anwelksilage'.2016.price 56.79
 'Ackergras - Anwelksilage'.2016.directCosts 265.88
 'Ackergras - Anwelksilage'.2016.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2016.fixCosts 778.26
 'Ackergras - Anwelksilage'.2017.yield 41.6
 'Ackergras - Anwelksilage'.2017.price 56.79
 'Ackergras - Anwelksilage'.2017.directCosts 265.88
 'Ackergras - Anwelksilage'.2017.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2017.fixCosts 778.26
 'Ackergras - Anwelksilage'.2018.yield 41.6
 'Ackergras - Anwelksilage'.2018.price 56.79
 'Ackergras - Anwelksilage'.2018.directCosts 265.88
 'Ackergras - Anwelksilage'.2018.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2018.fixCosts 778.26
 'Ackergras - Anwelksilage'.2019.yield 41.6
 'Ackergras - Anwelksilage'.2019.price 56.79
 'Ackergras - Anwelksilage'.2019.directCosts 265.88
 'Ackergras - Anwelksilage'.2019.variableCosts 1252.13
 'Ackergras - Anwelksilage'.2019.fixCosts 778.26
/;

parameter p_laborReq(crops,halfMonths) /
 'Ackergras - Anwelksilage'.JAN2 0.25
 'Ackergras - Anwelksilage'.FEB1 1.24
 'Ackergras - Anwelksilage'.JUN2 3.38
 'Ackergras - Anwelksilage'.JUL2 2.75
 'Ackergras - Anwelksilage'.AUG2 5.06
 'Ackergras - Anwelksilage'.SEP2 3
/;
