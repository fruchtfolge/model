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
set halfMonths / jan1,jan2,feb1,feb2,MRZ1,MRZ2,apr1,apr2,mai1,mai2,jun1,jun2,jul1,jul2,aug1,aug2,sep1,sep2,okt1,okt2,nov1,nov2,dez1,dez2 /;

set years / 2001*2019 /;
set curYear(years) / 2019 /;
set soilTypes /
'Tonschluffe (tu)'
/;

set plots /
 '2019-01-10T08:46:51.962Z'
 '2019-01-10T08:46:59.894Z'
/;

set curPlots(plots) /
 '2019-01-10T08:46:51.962Z'
 '2019-01-10T08:46:59.894Z'
/;

parameter p_plotData(curPlots,plotAttr) /
 '2019-01-10T08:46:51.962Z'.size 6.75
 '2019-01-10T08:46:51.962Z'.distance 0.36
 '2019-01-10T08:46:51.962Z'.quality 70.5
 '2019-01-10T08:46:59.894Z'.size 3.82
 '2019-01-10T08:46:59.894Z'.distance 0.73
 '2019-01-10T08:46:59.894Z'.quality 70.5
/;

set plots_soilTypes(curPlots,soilTypes) /
 '2019-01-10T08:46:51.962Z'.'Tonschluffe (tu)'
 '2019-01-10T08:46:59.894Z'.'Tonschluffe (tu)'
/;

set plots_rootCropCap(curPlots) /
 '2019-01-10T08:46:51.962Z' 'YES'
 '2019-01-10T08:46:59.894Z' 'YES'
/;

set crops /
 ''
 'Mais - Silomais'
 'Winterweizen - Brotweizen'
/;

set curCrops(crops) /
 ''
 'Mais - Silomais'
 'Winterweizen - Brotweizen'
/;

set cropGroup /
 ''
 'Mais'
 'Winterweizen'
/;

set crops_cropGroup(curCrops,cropGroup) /
 ''.''
 'Mais - Silomais'.'Mais'
 'Winterweizen - Brotweizen'.'Winterweizen'
/;

parameter p_cropData(curCrops,cropAttr) /
 'Mais - Silomais'.rotBreak 0
 'Mais - Silomais'.maxShare 100
 'Mais - Silomais'.minSoilQuality 20
 'Mais - Silomais'.efaFactor 0
 'Winterweizen - Brotweizen'.rotBreak 2
 'Winterweizen - Brotweizen'.maxShare 50
 'Winterweizen - Brotweizen'.minSoilQuality 20
 'Winterweizen - Brotweizen'.efaFactor 0
/;

parameter p_croppingFactor(curCrops,curCrops) /
 'Mais - Silomais'.'Mais - Silomais' 8
 'Mais - Silomais'.'Winterweizen - Brotweizen' 8
 'Winterweizen - Brotweizen'.'Mais - Silomais' 10
 'Winterweizen - Brotweizen'.'Winterweizen - Brotweizen' 4
/;

parameter p_grossMarginData(crops,years,grossMarginAttr) /
 'Mais - Silomais'.2001.yield 48.69
 'Mais - Silomais'.2001.price 19
 'Mais - Silomais'.2001.directCosts 381
 'Mais - Silomais'.2001.variableCosts 634.88
 'Mais - Silomais'.2001.fixCosts 718.98
 'Mais - Silomais'.2002.yield 49.43
 'Mais - Silomais'.2002.price 19
 'Mais - Silomais'.2002.directCosts 366
 'Mais - Silomais'.2002.variableCosts 634.88
 'Mais - Silomais'.2002.fixCosts 718.98
 'Mais - Silomais'.2003.yield 44.68
 'Mais - Silomais'.2003.price 21
 'Mais - Silomais'.2003.directCosts 361.99
 'Mais - Silomais'.2003.variableCosts 634.88
 'Mais - Silomais'.2003.fixCosts 718.98
 'Mais - Silomais'.2004.yield 39.01
 'Mais - Silomais'.2004.price 42
 'Mais - Silomais'.2004.directCosts 343
 'Mais - Silomais'.2004.variableCosts 634.88
 'Mais - Silomais'.2004.fixCosts 718.98
 'Mais - Silomais'.2005.yield 45.21
 'Mais - Silomais'.2005.price 21
 'Mais - Silomais'.2005.directCosts 366
 'Mais - Silomais'.2005.variableCosts 634.88
 'Mais - Silomais'.2005.fixCosts 718.98
 'Mais - Silomais'.2006.yield 48.84
 'Mais - Silomais'.2006.price 28
 'Mais - Silomais'.2006.directCosts 395.99
 'Mais - Silomais'.2006.variableCosts 634.88
 'Mais - Silomais'.2006.fixCosts 718.98
 'Mais - Silomais'.2007.yield 45.18
 'Mais - Silomais'.2007.price 31
 'Mais - Silomais'.2007.directCosts 416
 'Mais - Silomais'.2007.variableCosts 634.88
 'Mais - Silomais'.2007.fixCosts 718.98
 'Mais - Silomais'.2008.yield 46.22
 'Mais - Silomais'.2008.price 31
 'Mais - Silomais'.2008.directCosts 442
 'Mais - Silomais'.2008.variableCosts 634.88
 'Mais - Silomais'.2008.fixCosts 718.98
 'Mais - Silomais'.2009.yield 51.07
 'Mais - Silomais'.2009.price 28
 'Mais - Silomais'.2009.directCosts 583
 'Mais - Silomais'.2009.variableCosts 634.88
 'Mais - Silomais'.2009.fixCosts 718.98
 'Mais - Silomais'.2010.yield 46.61
 'Mais - Silomais'.2010.price 28
 'Mais - Silomais'.2010.directCosts 478
 'Mais - Silomais'.2010.variableCosts 634.88
 'Mais - Silomais'.2010.fixCosts 718.98
 'Mais - Silomais'.2011.yield 40.32
 'Mais - Silomais'.2011.price 28
 'Mais - Silomais'.2011.directCosts 472.01
 'Mais - Silomais'.2011.variableCosts 634.88
 'Mais - Silomais'.2011.fixCosts 718.98
 'Mais - Silomais'.2012.yield 48.69
 'Mais - Silomais'.2012.price 28
 'Mais - Silomais'.2012.directCosts 561.01
 'Mais - Silomais'.2012.variableCosts 634.88
 'Mais - Silomais'.2012.fixCosts 718.98
 'Mais - Silomais'.2013.yield 47.4
 'Mais - Silomais'.2013.price 28
 'Mais - Silomais'.2013.directCosts 554.99
 'Mais - Silomais'.2013.variableCosts 634.88
 'Mais - Silomais'.2013.fixCosts 718.98
 'Mais - Silomais'.2014.yield 47.4
 'Mais - Silomais'.2014.price 28
 'Mais - Silomais'.2014.directCosts 550.99
 'Mais - Silomais'.2014.variableCosts 634.88
 'Mais - Silomais'.2014.fixCosts 718.98
 'Mais - Silomais'.2015.yield 48.56
 'Mais - Silomais'.2015.price 28
 'Mais - Silomais'.2015.directCosts 591.99
 'Mais - Silomais'.2015.variableCosts 634.88
 'Mais - Silomais'.2015.fixCosts 718.98
 'Mais - Silomais'.2016.yield 47.37
 'Mais - Silomais'.2016.price 28
 'Mais - Silomais'.2016.directCosts 560
 'Mais - Silomais'.2016.variableCosts 634.88
 'Mais - Silomais'.2016.fixCosts 718.98
 'Mais - Silomais'.2017.yield 49.21
 'Mais - Silomais'.2017.price 28
 'Mais - Silomais'.2017.directCosts 553.99
 'Mais - Silomais'.2017.variableCosts 634.88
 'Mais - Silomais'.2017.fixCosts 718.98
 'Mais - Silomais'.2018.yield 44
 'Mais - Silomais'.2018.price 41
 'Mais - Silomais'.2018.directCosts 590.77
 'Mais - Silomais'.2018.variableCosts 634.88
 'Mais - Silomais'.2018.fixCosts 718.98
 'Mais - Silomais'.2019.yield 44
 'Mais - Silomais'.2019.price 41
 'Mais - Silomais'.2019.directCosts 590.77
 'Mais - Silomais'.2019.variableCosts 634.88
 'Mais - Silomais'.2019.fixCosts 718.98
 'Winterweizen - Brotweizen'.2001.yield 7.91
 'Winterweizen - Brotweizen'.2001.price 109.8
 'Winterweizen - Brotweizen'.2001.directCosts 330.98
 'Winterweizen - Brotweizen'.2001.variableCosts 206.16
 'Winterweizen - Brotweizen'.2001.fixCosts 505.48
 'Winterweizen - Brotweizen'.2002.yield 8.87
 'Winterweizen - Brotweizen'.2002.price 106.5
 'Winterweizen - Brotweizen'.2002.directCosts 349.01
 'Winterweizen - Brotweizen'.2002.variableCosts 206.16
 'Winterweizen - Brotweizen'.2002.fixCosts 505.48
 'Winterweizen - Brotweizen'.2003.yield 7.44
 'Winterweizen - Brotweizen'.2003.price 97.1
 'Winterweizen - Brotweizen'.2003.directCosts 337
 'Winterweizen - Brotweizen'.2003.variableCosts 206.16
 'Winterweizen - Brotweizen'.2003.fixCosts 505.48
 'Winterweizen - Brotweizen'.2004.yield 7.74
 'Winterweizen - Brotweizen'.2004.price 127.3
 'Winterweizen - Brotweizen'.2004.directCosts 347.99
 'Winterweizen - Brotweizen'.2004.variableCosts 206.16
 'Winterweizen - Brotweizen'.2004.fixCosts 505.48
 'Winterweizen - Brotweizen'.2005.yield 8.35
 'Winterweizen - Brotweizen'.2005.price 93
 'Winterweizen - Brotweizen'.2005.directCosts 345
 'Winterweizen - Brotweizen'.2005.variableCosts 206.16
 'Winterweizen - Brotweizen'.2005.fixCosts 505.48
 'Winterweizen - Brotweizen'.2006.yield 8.4
 'Winterweizen - Brotweizen'.2006.price 95.2
 'Winterweizen - Brotweizen'.2006.directCosts 361.01
 'Winterweizen - Brotweizen'.2006.variableCosts 206.16
 'Winterweizen - Brotweizen'.2006.fixCosts 505.48
 'Winterweizen - Brotweizen'.2007.yield 7.65
 'Winterweizen - Brotweizen'.2007.price 128
 'Winterweizen - Brotweizen'.2007.directCosts 372.99
 'Winterweizen - Brotweizen'.2007.variableCosts 206.16
 'Winterweizen - Brotweizen'.2007.fixCosts 505.48
 'Winterweizen - Brotweizen'.2008.yield 7.07
 'Winterweizen - Brotweizen'.2008.price 214.1
 'Winterweizen - Brotweizen'.2008.directCosts 387.01
 'Winterweizen - Brotweizen'.2008.variableCosts 206.16
 'Winterweizen - Brotweizen'.2008.fixCosts 505.48
 'Winterweizen - Brotweizen'.2009.yield 8.87
 'Winterweizen - Brotweizen'.2009.price 147
 'Winterweizen - Brotweizen'.2009.directCosts 539.99
 'Winterweizen - Brotweizen'.2009.variableCosts 206.16
 'Winterweizen - Brotweizen'.2009.fixCosts 505.48
 'Winterweizen - Brotweizen'.2010.yield 8.42
 'Winterweizen - Brotweizen'.2010.price 107.5
 'Winterweizen - Brotweizen'.2010.directCosts 447
 'Winterweizen - Brotweizen'.2010.variableCosts 206.16
 'Winterweizen - Brotweizen'.2010.fixCosts 505.48
 'Winterweizen - Brotweizen'.2011.yield 7.87
 'Winterweizen - Brotweizen'.2011.price 194.2
 'Winterweizen - Brotweizen'.2011.directCosts 478
 'Winterweizen - Brotweizen'.2011.variableCosts 206.16
 'Winterweizen - Brotweizen'.2011.fixCosts 505.48
 'Winterweizen - Brotweizen'.2012.yield 8.25
 'Winterweizen - Brotweizen'.2012.price 186.8
 'Winterweizen - Brotweizen'.2012.directCosts 541.01
 'Winterweizen - Brotweizen'.2012.variableCosts 206.16
 'Winterweizen - Brotweizen'.2012.fixCosts 505.48
 'Winterweizen - Brotweizen'.2013.yield 7.74
 'Winterweizen - Brotweizen'.2013.price 227.6
 'Winterweizen - Brotweizen'.2013.directCosts 513.01
 'Winterweizen - Brotweizen'.2013.variableCosts 206.16
 'Winterweizen - Brotweizen'.2013.fixCosts 505.48
 'Winterweizen - Brotweizen'.2014.yield 7.74
 'Winterweizen - Brotweizen'.2014.price 171.3
 'Winterweizen - Brotweizen'.2014.directCosts 490
 'Winterweizen - Brotweizen'.2014.variableCosts 206.16
 'Winterweizen - Brotweizen'.2014.fixCosts 505.48
 'Winterweizen - Brotweizen'.2015.yield 9.02
 'Winterweizen - Brotweizen'.2015.price 152
 'Winterweizen - Brotweizen'.2015.directCosts 506
 'Winterweizen - Brotweizen'.2015.variableCosts 206.16
 'Winterweizen - Brotweizen'.2015.fixCosts 505.48
 'Winterweizen - Brotweizen'.2016.yield 8.69
 'Winterweizen - Brotweizen'.2016.price 143.1
 'Winterweizen - Brotweizen'.2016.directCosts 489
 'Winterweizen - Brotweizen'.2016.variableCosts 206.16
 'Winterweizen - Brotweizen'.2016.fixCosts 505.48
 'Winterweizen - Brotweizen'.2017.yield 8.31
 'Winterweizen - Brotweizen'.2017.price 143.7
 'Winterweizen - Brotweizen'.2017.directCosts 428
 'Winterweizen - Brotweizen'.2017.variableCosts 206.16
 'Winterweizen - Brotweizen'.2017.fixCosts 505.48
 'Winterweizen - Brotweizen'.2018.yield 7.89
 'Winterweizen - Brotweizen'.2018.price 151
 'Winterweizen - Brotweizen'.2018.directCosts 531.84
 'Winterweizen - Brotweizen'.2018.variableCosts 206.16
 'Winterweizen - Brotweizen'.2018.fixCosts 505.48
 'Winterweizen - Brotweizen'.2019.yield 7.89
 'Winterweizen - Brotweizen'.2019.price 151
 'Winterweizen - Brotweizen'.2019.directCosts 531.84
 'Winterweizen - Brotweizen'.2019.variableCosts 206.16
 'Winterweizen - Brotweizen'.2019.fixCosts 505.48
/;

parameter p_laborReq(crops,halfMonths) /
 'Mais - Silomais'.MRZ2 1.24
 'Mais - Silomais'.APR1 3.07
 'Mais - Silomais'.APR2 1.07
 'Mais - Silomais'.MAI1 0.43
 'Mais - Silomais'.MAI2 0.37
 'Mais - Silomais'.SEP2 4.2
 'Mais - Silomais'.OKT1 1.27
 'Mais - Silomais'.OKT2 1.88
 'Winterweizen - Brotweizen'.FEB1 0.5
 'Winterweizen - Brotweizen'.FEB2 0.31
 'Winterweizen - Brotweizen'.MRZ2 0.12
 'Winterweizen - Brotweizen'.APR1 0.47
 'Winterweizen - Brotweizen'.APR2 0.27
 'Winterweizen - Brotweizen'.MAI1 0.12
 'Winterweizen - Brotweizen'.JUN1 0.44
 'Winterweizen - Brotweizen'.AUG1 2.4
 'Winterweizen - Brotweizen'.AUG2 1
 'Winterweizen - Brotweizen'.SEP1 0.29
 'Winterweizen - Brotweizen'.SEP2 2.8
 'Winterweizen - Brotweizen'.OKT1 0.57
 'Winterweizen - Brotweizen'.OKT2 1.24
/;

set constraints /
 'Mais - Silomais'
/;

parameter p_constraint(constraints,curCrops,curCrops) /
 'Mais - Silomais'.'Mais - Silomais'."" 30
/;

set constraints_lt(constraints,symbol) /
 'Mais - Silomais'.lt YES
/;
