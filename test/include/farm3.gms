* -------------------------------
* Fruchtfolge Model - Include file
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2019
* -------------------------------

* Static data
set grossMarginAttr / price,yield,directCosts,variableCosts,fixCosts,grossMargin,revenue,distanceCosts,croppingFactor,yieldCap /;
set plotAttr / size,distance,quality /;
set cropAttr / rotBreak, maxShare, minSoilQuality, efaFactor, catchCropAfter, season/;
set symbol / lt,gt /;

set months /jan,feb,mrz,apr,mai,jun,jul,aug,sep,okt,nov,dez/;
set halfMonths / jan1,jan2,feb1,feb2,MRZ1,MRZ2,apr1,apr2,mai1,mai2,jun1,jun2,jul1,jul2,aug1,aug2,sep1,sep2,okt1,okt2,nov1,nov2,dez1,dez2 /;
set months_halfMonths(months,halfMonths) /
 jan.jan1 YES
 jan.jan2 YES
 feb.feb1 YES
 feb.feb2 YES
 mrz.MRZ1 YES
 mrz.MRZ2 YES
 apr.apr1 YES
 apr.apr2 YES
 mai.mai1 YES
 mai.mai2 YES
 jun.jun1 YES
 jun.jun2 YES
 jul.jul1 YES
 jul.jul2 YES
 aug.aug1 YES
 aug.aug2 YES
 sep.sep1 YES
 sep.sep2 YES
 okt.okt1 YES
 okt.okt2 YES
 nov.nov1 YES
 nov.nov2 YES
 dez.dez1 YES
 dez.dez2 YES
/;

set years / 2001*2030 /;
$onempty
set curYear(years) / 2019 /;
set soilTypes /
'Tonschluffe (tu)'
/;

set plots /
 '25dffac4-41ad-4d46-9a92-03cd8097597c'
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'
/;

set curPlots(plots) /
 '25dffac4-41ad-4d46-9a92-03cd8097597c'
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'
/;

parameter p_plotData(curPlots,plotAttr) /
 '25dffac4-41ad-4d46-9a92-03cd8097597c'.size 6.37
 '25dffac4-41ad-4d46-9a92-03cd8097597c'.distance 0.24
 '25dffac4-41ad-4d46-9a92-03cd8097597c'.quality 70.5
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.size 2.93
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.distance 0.45
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.quality 70.5
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.size 4.93
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.distance 0.48
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.quality 70.5
/;

set plots_soilTypes(curPlots,soilTypes) /
 '25dffac4-41ad-4d46-9a92-03cd8097597c'.'Tonschluffe (tu)'
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.'Tonschluffe (tu)'
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.'Tonschluffe (tu)'
/;

set plots_rootCropCap(curPlots) /
 '25dffac4-41ad-4d46-9a92-03cd8097597c' 'YES'
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd' 'YES'
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17' 'YES'
/;

set plots_permPast(curPlots) /

/;

set crops /
 ''
 'Mais - Silomais'
 'Wintergerste - Futtergerste'
 'Winterraps'
 'Winterweizen - Brotweizen'
/;

set curCrops(crops) /
 ''
 'Mais - Silomais'
 'Wintergerste - Futtergerste'
 'Winterraps'
 'Winterweizen - Brotweizen'
/;

set permPastCrops(curCrops) /
 ''
/;

set cropGroup /
 ''
 'Gattung: Zea (Mais)'
 'Wintergerste'
 'Winterraps'
 'Winterweizen'
/;

set crops_cropGroup(curCrops,cropGroup) /
 ''.''
 'Mais - Silomais'.'Gattung: Zea (Mais)'
 'Wintergerste - Futtergerste'.'Wintergerste'
 'Winterraps'.'Winterraps'
 'Winterweizen - Brotweizen'.'Winterweizen'
/;

parameter p_cropData(curCrops,cropAttr) /
'Mais - Silomais'.rotBreak 2
'Mais - Silomais'.maxShare 33.33
'Mais - Silomais'.minSoilQuality 20
'Mais - Silomais'.efaFactor 0
'Wintergerste - Futtergerste'.rotBreak 2
'Wintergerste - Futtergerste'.maxShare 33.33
'Wintergerste - Futtergerste'.minSoilQuality 20
'Wintergerste - Futtergerste'.efaFactor 0
'Winterraps'.rotBreak 4
'Winterraps'.maxShare 20
'Winterraps'.minSoilQuality 20
'Winterraps'.efaFactor 0
'Winterweizen - Brotweizen'.rotBreak 2
'Winterweizen - Brotweizen'.maxShare 33.33
'Winterweizen - Brotweizen'.minSoilQuality 20
'Winterweizen - Brotweizen'.efaFactor 0
/;

set crops_rootCrop(curCrops) /

/;

set crops_catchCrop(curCrops) /
 'Wintergerste - Futtergerste' YES
 'Winterraps' YES
 'Winterweizen - Brotweizen' YES
/;

set crops_summer(curCrops) /
 'Mais - Silomais' YES
/;

parameter p_croppingFactor(curCrops,curCrops) /
 'Mais - Silomais'.'Mais - Silomais' 8
 'Mais - Silomais'.'Wintergerste - Futtergerste' 6
 'Mais - Silomais'.'Winterraps' 4
 'Mais - Silomais'.'Winterweizen - Brotweizen' 8
 'Wintergerste - Futtergerste'.'Mais - Silomais' 10
 'Wintergerste - Futtergerste'.'Wintergerste - Futtergerste' 4
 'Wintergerste - Futtergerste'.'Winterraps' 10
 'Wintergerste - Futtergerste'.'Winterweizen - Brotweizen' 4
 'Winterraps'.'Mais - Silomais' 10
 'Winterraps'.'Wintergerste - Futtergerste' 8
 'Winterraps'.'Winterraps' 4
 'Winterraps'.'Winterweizen - Brotweizen' 10
 'Winterweizen - Brotweizen'.'Mais - Silomais' 10
 'Winterweizen - Brotweizen'.'Wintergerste - Futtergerste' 6
 'Winterweizen - Brotweizen'.'Winterraps' 10
 'Winterweizen - Brotweizen'.'Winterweizen - Brotweizen' 4
/;

set plots_years_cropGroup(plots,years,cropGroup) /
 '25dffac4-41ad-4d46-9a92-03cd8097597c'.2019.'' 'YES'
 '25dffac4-41ad-4d46-9a92-03cd8097597c'.2018.'Gattung: Zea (Mais)' 'YES'
 '25dffac4-41ad-4d46-9a92-03cd8097597c'.2017.'Winterraps' 'YES'
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.2017.'Wintergerste' 'YES'
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.2018.'Winterraps' 'YES'
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.2019.'' 'YES'
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.2018.'Winterweizen' 'YES'
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.2019.'' 'YES'
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.2017.'Wintergerste' 'YES'
/;

parameter p_grossMarginData(curPlots,curCrops) /
 '25dffac4-41ad-4d46-9a92-03cd8097597c'.'Wintergerste - Futtergerste' 780
 '25dffac4-41ad-4d46-9a92-03cd8097597c'.'Winterweizen - Brotweizen' 2987
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.'Mais - Silomais' 2490
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.'Wintergerste - Futtergerste' 867
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd'.'Winterweizen - Brotweizen' 1726
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.'Mais - Silomais' 4187
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.'Wintergerste - Futtergerste' 601
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17'.'Winterraps' 2995
/;

parameter p_catchCropCosts(curPlots) /
 '25dffac4-41ad-4d46-9a92-03cd8097597c' 693.19
 'f2dbbdf4-2a17-49df-973d-56936a63e7dd' 325.74
 '52d50b37-59d7-4a6c-a875-8cf5f197ad17' 541.56
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
 'Wintergerste - Futtergerste'.FEB1 0.5
 'Wintergerste - Futtergerste'.FEB2 0.31
 'Wintergerste - Futtergerste'.MRZ2 0.12
 'Wintergerste - Futtergerste'.APR1 0.45
 'Wintergerste - Futtergerste'.APR2 0.27
 'Wintergerste - Futtergerste'.JUL1 2.43
 'Wintergerste - Futtergerste'.JUL2 0.85
 'Wintergerste - Futtergerste'.AUG1 0.15
 'Wintergerste - Futtergerste'.AUG2 0.92
 'Wintergerste - Futtergerste'.SEP1 2.15
 'Wintergerste - Futtergerste'.SEP2 1.38
 'Wintergerste - Futtergerste'.OKT2 0.43
 'Winterraps'.JAN1 0.5
 'Winterraps'.FEB1 0.31
 'Winterraps'.MRZ1 0.31
 'Winterraps'.APR1 0.39
 'Winterraps'.JUL1 0.04
 'Winterraps'.JUL2 5
 'Winterraps'.AUG1 1.35
 'Winterraps'.AUG2 1.35
 'Winterraps'.OKT2 0.27
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
