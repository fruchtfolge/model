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
 '206f726b-4544-431f-a61b-1caa13ff9799'
 'a2353795-c68a-41d0-9bf2-0339203a8389'
 'ed165a70-ed74-4ee5-996b-465013059a3a'
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'
 'ca960201-a2cb-4bab-87af-6bec5cc105af'
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'
 '4628f493-e7be-45bd-8ac1-874515d27b8b'
 'c31583b7-f152-4426-97be-198010500822'
/;

set curPlots(plots) /
 '206f726b-4544-431f-a61b-1caa13ff9799'
 'a2353795-c68a-41d0-9bf2-0339203a8389'
 'ed165a70-ed74-4ee5-996b-465013059a3a'
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'
 'ca960201-a2cb-4bab-87af-6bec5cc105af'
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'
 '4628f493-e7be-45bd-8ac1-874515d27b8b'
 'c31583b7-f152-4426-97be-198010500822'
/;

parameter p_plotData(curPlots,plotAttr) /
 '206f726b-4544-431f-a61b-1caa13ff9799'.size 3.45
 '206f726b-4544-431f-a61b-1caa13ff9799'.distance 1.11
 '206f726b-4544-431f-a61b-1caa13ff9799'.quality 70.5
 'a2353795-c68a-41d0-9bf2-0339203a8389'.size 2.03
 'a2353795-c68a-41d0-9bf2-0339203a8389'.distance 0.67
 'a2353795-c68a-41d0-9bf2-0339203a8389'.quality 70.5
 'ed165a70-ed74-4ee5-996b-465013059a3a'.size 3
 'ed165a70-ed74-4ee5-996b-465013059a3a'.distance 0.62
 'ed165a70-ed74-4ee5-996b-465013059a3a'.quality 70.5
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'.size 13.93
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'.distance 3.04
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'.quality 73.5
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.size 5.53
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.distance 0.23
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.quality 70.5
 'ca960201-a2cb-4bab-87af-6bec5cc105af'.size 2.52
 'ca960201-a2cb-4bab-87af-6bec5cc105af'.distance 0.29
 'ca960201-a2cb-4bab-87af-6bec5cc105af'.quality 73.5
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.size 2.93
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.distance 0.45
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.quality 70.5
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.size 5.25
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.distance 0.48
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.quality 70.5
 'c31583b7-f152-4426-97be-198010500822'.size 0.77
 'c31583b7-f152-4426-97be-198010500822'.distance 0.25
 'c31583b7-f152-4426-97be-198010500822'.quality 70.5
/;

set plots_soilTypes(curPlots,soilTypes) /
 '206f726b-4544-431f-a61b-1caa13ff9799'.'Tonschluffe (tu)'
 'a2353795-c68a-41d0-9bf2-0339203a8389'.'Tonschluffe (tu)'
 'ed165a70-ed74-4ee5-996b-465013059a3a'.'Tonschluffe (tu)'
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'.'Tonschluffe (tu)'
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.'Tonschluffe (tu)'
 'ca960201-a2cb-4bab-87af-6bec5cc105af'.'Tonschluffe (tu)'
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.'Tonschluffe (tu)'
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.'Tonschluffe (tu)'
 'c31583b7-f152-4426-97be-198010500822'.'Tonschluffe (tu)'
/;

set plots_rootCropCap(curPlots) /
 '206f726b-4544-431f-a61b-1caa13ff9799' 'YES'
 'a2353795-c68a-41d0-9bf2-0339203a8389' 'YES'
 'ed165a70-ed74-4ee5-996b-465013059a3a' 'YES'
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8' 'YES'
 '0e49a71a-52fe-4a55-9148-17fb0a36f423' 'YES'
 'ca960201-a2cb-4bab-87af-6bec5cc105af' 'YES'
 'b46a81dd-6b8c-43e2-af4e-363313644fe0' 'YES'
 '4628f493-e7be-45bd-8ac1-874515d27b8b' 'YES'
 'c31583b7-f152-4426-97be-198010500822' 'YES'
/;

set plots_permPast(curPlots) /

/;

set crops /
 ''
 'Mais - Silomais'
 'Wintergerste'
 'Winterraps'
 'Winterweizen'
/;

set curCrops(crops) /
 ''
 'Mais - Silomais'
 'Wintergerste'
 'Winterraps'
 'Winterweizen'
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
 'Wintergerste'.'Wintergerste'
 'Winterraps'.'Winterraps'
 'Winterweizen'.'Winterweizen'
/;

parameter p_cropData(curCrops,cropAttr) /
'Mais - Silomais'.rotBreak 1
'Mais - Silomais'.maxShare 50
'Mais - Silomais'.minSoilQuality 20
'Mais - Silomais'.efaFactor 0
'Wintergerste'.rotBreak 2
'Wintergerste'.maxShare 33.33
'Wintergerste'.minSoilQuality 20
'Wintergerste'.efaFactor 0
'Winterraps'.rotBreak 4
'Winterraps'.maxShare 20
'Winterraps'.minSoilQuality 20
'Winterraps'.efaFactor 0
'Winterweizen'.rotBreak 2
'Winterweizen'.maxShare 33.33
'Winterweizen'.minSoilQuality 20
'Winterweizen'.efaFactor 0
/;

set crops_rootCrop(curCrops) /

/;

set crops_catchCrop(curCrops) /
 'Wintergerste' YES
 'Winterraps' YES
 'Winterweizen' YES
/;

set crops_summer(curCrops) /
 'Mais - Silomais' YES
/;

parameter p_croppingFactor(curCrops,curCrops) /
 'Mais - Silomais'.'Mais - Silomais' 8
 'Mais - Silomais'.'Wintergerste' 6
 'Mais - Silomais'.'Winterraps' 4
 'Mais - Silomais'.'Winterweizen' 8
 'Wintergerste'.'Mais - Silomais' 10
 'Wintergerste'.'Wintergerste' 4
 'Wintergerste'.'Winterraps' 10
 'Wintergerste'.'Winterweizen' 4
 'Winterraps'.'Mais - Silomais' 10
 'Winterraps'.'Wintergerste' 8
 'Winterraps'.'Winterraps' 4
 'Winterraps'.'Winterweizen' 10
 'Winterweizen'.'Mais - Silomais' 10
 'Winterweizen'.'Wintergerste' 6
 'Winterweizen'.'Winterraps' 10
 'Winterweizen'.'Winterweizen' 4
/;

set plots_years_crops(plots,years,crops) /

/;


set plots_years_cropGroup(plots,years,cropGroup) /
 '206f726b-4544-431f-a61b-1caa13ff9799'.2019.'' 'YES'
 '206f726b-4544-431f-a61b-1caa13ff9799'.2018.'Winterweizen' 'YES'
 'a2353795-c68a-41d0-9bf2-0339203a8389'.2018.'Winterraps' 'YES'
 'a2353795-c68a-41d0-9bf2-0339203a8389'.2019.'' 'YES'
 'ed165a70-ed74-4ee5-996b-465013059a3a'.2018.'Winterweizen' 'YES'
 'ed165a70-ed74-4ee5-996b-465013059a3a'.2017.'Wintergerste' 'YES'
 'ed165a70-ed74-4ee5-996b-465013059a3a'.2019.'' 'YES'
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'.2019.'' 'YES'
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'.2018.'Winterraps' 'YES'
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.2019.'' 'YES'
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.2017.'Winterweizen' 'YES'
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.2018.'Gattung: Zea (Mais)' 'YES'
 'ca960201-a2cb-4bab-87af-6bec5cc105af'.2017.'Winterraps' 'YES'
 'ca960201-a2cb-4bab-87af-6bec5cc105af'.2018.'Winterweizen' 'YES'
 'ca960201-a2cb-4bab-87af-6bec5cc105af'.2019.'' 'YES'
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.2018.'Winterraps' 'YES'
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.2017.'Gattung: Zea (Mais)' 'YES'
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.2019.'' 'YES'
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.2018.'Gattung: Zea (Mais)' 'YES'
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.2019.'' 'YES'
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.2017.'Gattung: Zea (Mais)' 'YES'
 'c31583b7-f152-4426-97be-198010500822'.2018.'Wintergerste' 'YES'
 'c31583b7-f152-4426-97be-198010500822'.2019.'' 'YES'
 'c31583b7-f152-4426-97be-198010500822'.2017.'Wintergerste' 'YES'
/;

parameter p_grossMarginData(curPlots,curCrops) /
 '206f726b-4544-431f-a61b-1caa13ff9799'.'Mais - Silomais' 2900
 '206f726b-4544-431f-a61b-1caa13ff9799'.'Wintergerste' 417
 '206f726b-4544-431f-a61b-1caa13ff9799'.'Winterraps' 2094
 'a2353795-c68a-41d0-9bf2-0339203a8389'.'Mais - Silomais' 1719
 'a2353795-c68a-41d0-9bf2-0339203a8389'.'Wintergerste' 600
 'a2353795-c68a-41d0-9bf2-0339203a8389'.'Winterweizen' 1195
 'ed165a70-ed74-4ee5-996b-465013059a3a'.'Mais - Silomais' 2542
 'ed165a70-ed74-4ee5-996b-465013059a3a'.'Wintergerste' 365
 'ed165a70-ed74-4ee5-996b-465013059a3a'.'Winterraps' 1822
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'.'Mais - Silomais' 10463
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'.'Wintergerste' 4283
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8'.'Winterweizen' 8480
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.'Mais - Silomais' 3671
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.'Wintergerste' 677
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.'Winterraps' 353
 '0e49a71a-52fe-4a55-9148-17fb0a36f423'.'Winterweizen' 2593
 'ca960201-a2cb-4bab-87af-6bec5cc105af'.'Mais - Silomais' 2357
 'ca960201-a2cb-4bab-87af-6bec5cc105af'.'Wintergerste' 387
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.'Mais - Silomais' 2490
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.'Wintergerste' 867
 'b46a81dd-6b8c-43e2-af4e-363313644fe0'.'Winterweizen' 1726
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.'Mais - Silomais' 3469
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.'Wintergerste' 640
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.'Winterraps' 335
 '4628f493-e7be-45bd-8ac1-874515d27b8b'.'Winterweizen' 2459
 'c31583b7-f152-4426-97be-198010500822'.'Mais - Silomais' 656
 'c31583b7-f152-4426-97be-198010500822'.'Winterraps' 468
 'c31583b7-f152-4426-97be-198010500822'.'Winterweizen' 37
/;

parameter p_catchCropCosts(curPlots) /
 '206f726b-4544-431f-a61b-1caa13ff9799' 383.01
 'a2353795-c68a-41d0-9bf2-0339203a8389' 227.03
 'ed165a70-ed74-4ee5-996b-465013059a3a' 333.53
 '259ad084-fcf0-44c6-bf7a-2dcbe8716de8' 1456.8
 '0e49a71a-52fe-4a55-9148-17fb0a36f423' 604.87
 'ca960201-a2cb-4bab-87af-6bec5cc105af' 280.73
 'b46a81dd-6b8c-43e2-af4e-363313644fe0' 325.74
 '4628f493-e7be-45bd-8ac1-874515d27b8b' 575.59
 'c31583b7-f152-4426-97be-198010500822' 86.67
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
 'Wintergerste'.FEB1 0.5
 'Wintergerste'.FEB2 0.31
 'Wintergerste'.MRZ2 0.12
 'Wintergerste'.APR1 0.45
 'Wintergerste'.APR2 0.27
 'Wintergerste'.JUL1 2.43
 'Wintergerste'.JUL2 0.85
 'Wintergerste'.AUG1 0.15
 'Wintergerste'.AUG2 0.92
 'Wintergerste'.SEP1 2.15
 'Wintergerste'.SEP2 1.38
 'Wintergerste'.OKT2 0.43
 'Winterraps'.JAN1 0.5
 'Winterraps'.FEB1 0.31
 'Winterraps'.MRZ1 0.31
 'Winterraps'.APR1 0.39
 'Winterraps'.JUL1 0.04
 'Winterraps'.JUL2 5
 'Winterraps'.AUG1 1.35
 'Winterraps'.AUG2 1.35
 'Winterraps'.OKT2 0.27
 'Winterweizen'.FEB1 0.5
 'Winterweizen'.FEB2 0.31
 'Winterweizen'.MRZ2 0.12
 'Winterweizen'.APR1 0.47
 'Winterweizen'.APR2 0.27
 'Winterweizen'.MAI1 0.12
 'Winterweizen'.JUN1 0.44
 'Winterweizen'.AUG1 2.4
 'Winterweizen'.AUG2 1
 'Winterweizen'.SEP1 0.29
 'Winterweizen'.SEP2 2.8
 'Winterweizen'.OKT1 0.57
 'Winterweizen'.OKT2 1.24
/;