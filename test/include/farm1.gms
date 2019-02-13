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
set curYear(years) / 2019 /;
set soilTypes /
'Tonschluffe (tu)'
'Tonlehme (tl)'
/;

set plots /
 '37'
 '372'
 '1002'
 '1007'
 '1005'
 '115'
 '62'
 '201'
 '2'
 '137'
 '1011'
 '1050'
 '112'
 '119'
 '1010'
 '1016'
 '77'
 '1006'
 '121'
 '371'
 '1371'
 '571'
 '130'
 '901'
 '9'
 '39'
 '48'
 '113'
 '574'
 '1015'
 '573'
 '1181'
 '6'
 '462'
 '1004'
 '43'
 '122'
 '123'
 '1019'
 '41'
 '1012'
 '1008'
 '1003'
 '1013'
 '120'
 '1'
 '1018'
 '86'
 '75'
 '88'
 '881'
 '54'
 '56'
 '67'
 '38'
 '114'
 '126'
 '131'
 '127'
 '128'
 '136'
 '125'
 '481'
 '138'
 '118'
 '117'
 '46'
 '461'
 '132'
 '111'
 '95'
 '1014'
 '73'
 '1009'
 '140'
 '135'
 '1252'
 '1171'
 '133'
 '464'
 '134'
 '1251'
 '1131'
 '463'
 '465'
 '116'
 '66'
 '96'
 '55'
 '671'
 '10'
 '69'
 '74'
 '1001'
 '1141'
 '61'
/;

set curPlots(plots) /
 '37'
 '372'
 '1002'
 '1007'
 '1005'
 '115'
 '62'
 '137'
 '1011'
 '1050'
 '119'
 '1016'
 '1006'
 '371'
 '201'
 '2'
 '1371'
 '112'
 '1010'
 '121'
 '130'
 '901'
 '113'
 '1015'
 '1181'
 '462'
 '1019'
 '41'
 '75'
 '86'
 '88'
 '56'
 '67'
 '571'
 '126'
 '131'
 '127'
 '128'
 '125'
 '136'
 '9'
 '39'
 '481'
 '48'
 '138'
 '574'
 '573'
 '118'
 '6'
 '117'
 '46'
 '132'
 '1004'
 '95'
 '43'
 '1014'
 '1012'
 '73'
 '1008'
 '1003'
 '1009'
 '1013'
 '140'
 '120'
 '135'
 '134'
 '133'
 '1'
 '1018'
 '66'
 '96'
 '54'
 '55'
 '671'
 '10'
 '69'
 '38'
 '74'
 '1001'
 '114'
 '1141'
 '61'
/;

parameter p_plotData(curPlots,plotAttr) /
 '37'.size 0.32
 '37'.distance 1
 '37'.quality 70.5
 '372'.size 0.27
 '372'.distance 1
 '372'.quality 70.5
 '1002'.size 1.43
 '1002'.distance 1
 '1002'.quality 73.5
 '1007'.size 5.61
 '1007'.distance 1
 '1007'.quality 76.5
 '1005'.size 3.27
 '1005'.distance 1
 '1005'.quality 76.5
 '115'.size 2.62
 '115'.distance 1
 '115'.quality 73.5
 '62'.size 0.36
 '62'.distance 1
 '62'.quality 70.5
 '137'.size 2.33
 '137'.distance 1
 '137'.quality 76.5
 '1011'.size 1.53
 '1011'.distance 1
 '1011'.quality 70.5
 '1050'.size 3.45
 '1050'.distance 1
 '1050'.quality 70.5
 '119'.size 6.22
 '119'.distance 1
 '119'.quality 70.5
 '1016'.size 1.33
 '1016'.distance 1
 '1016'.quality 0
 '1006'.size 5.71
 '1006'.distance 1
 '1006'.quality 73.5
 '371'.size 0.57
 '371'.distance 1
 '371'.quality 70.5
 '201'.size 3.13
 '201'.distance 1
 '201'.quality 70.5
 '2'.size 9.81
 '2'.distance 1
 '2'.quality 70.5
 '1371'.size 6.08
 '1371'.distance 1
 '1371'.quality 70.5
 '112'.size 1.15
 '112'.distance 1
 '112'.quality 67.5
 '1010'.size 3.13
 '1010'.distance 1
 '1010'.quality 73.5
 '121'.size 7.66
 '121'.distance 1
 '121'.quality 76.5
 '130'.size 2.78
 '130'.distance 1
 '130'.quality 70.5
 '901'.size 5.99
 '901'.distance 1
 '901'.quality 70.5
 '113'.size 3
 '113'.distance 1
 '113'.quality 73.5
 '1015'.size 3.42
 '1015'.distance 1
 '1015'.quality 76.5
 '1181'.size 2.84
 '1181'.distance 1
 '1181'.quality 70.5
 '462'.size 4.25
 '462'.distance 1
 '462'.quality 70.5
 '1019'.size 2.49
 '1019'.distance 1
 '1019'.quality 70.5
 '41'.size 2.92
 '41'.distance 1
 '41'.quality 70.5
 '75'.size 0.79
 '75'.distance 1
 '75'.quality 66
 '86'.size 0.88
 '86'.distance 1
 '86'.quality 69
 '88'.size 2.33
 '88'.distance 1
 '88'.quality 69
 '56'.size 3.69
 '56'.distance 1
 '56'.quality 70.5
 '67'.size 1.98
 '67'.distance 1
 '67'.quality 67.5
 '571'.size 7.5
 '571'.distance 1
 '571'.quality 70.5
 '126'.size 0.84
 '126'.distance 1
 '126'.quality 0
 '131'.size 1.59
 '131'.distance 1
 '131'.quality 70.5
 '127'.size 0.93
 '127'.distance 1
 '127'.quality 73.5
 '128'.size 3.2
 '128'.distance 1
 '128'.quality 70.5
 '125'.size 8.41
 '125'.distance 1
 '125'.quality 67.5
 '136'.size 1.03
 '136'.distance 1
 '136'.quality 64.5
 '9'.size 10.29
 '9'.distance 1
 '9'.quality 70.5
 '39'.size 1.44
 '39'.distance 1
 '39'.quality 70.5
 '481'.size 1.96
 '481'.distance 1
 '481'.quality 70.5
 '48'.size 3.85
 '48'.distance 1
 '48'.quality 76.5
 '138'.size 6.69
 '138'.distance 1
 '138'.quality 70.5
 '574'.size 1.36
 '574'.distance 1
 '574'.quality 70.5
 '573'.size 1.74
 '573'.distance 1
 '573'.quality 70.5
 '118'.size 0.2
 '118'.distance 1
 '118'.quality 70.5
 '6'.size 2.55
 '6'.distance 1
 '6'.quality 73.5
 '117'.size 1.26
 '117'.distance 1
 '117'.quality 70.5
 '46'.size 2.8
 '46'.distance 1
 '46'.quality 70.5
 '132'.size 0.41
 '132'.distance 1
 '132'.quality 67.5
 '1004'.size 1.71
 '1004'.distance 1
 '1004'.quality 76.5
 '95'.size 5.16
 '95'.distance 1
 '95'.quality 70.5
 '43'.size 5.41
 '43'.distance 1
 '43'.quality 70.5
 '1014'.size 2.13
 '1014'.distance 1
 '1014'.quality 70.5
 '1012'.size 5.75
 '1012'.distance 1
 '1012'.quality 70.5
 '73'.size 1.51
 '73'.distance 1
 '73'.quality 64.5
 '1008'.size 4
 '1008'.distance 1
 '1008'.quality 76.5
 '1003'.size 2.6
 '1003'.distance 1
 '1003'.quality 76.5
 '1009'.size 0.83
 '1009'.distance 1
 '1009'.quality 70.5
 '1013'.size 2.74
 '1013'.distance 1
 '1013'.quality 70.5
 '140'.size 1.64
 '140'.distance 1
 '140'.quality 70.5
 '120'.size 1.97
 '120'.distance 1
 '120'.quality 76.5
 '135'.size 0.03
 '135'.distance 1
 '135'.quality 67.5
 '134'.size 0.1
 '134'.distance 1
 '134'.quality 0
 '133'.size 1.56
 '133'.distance 1
 '133'.quality 67.5
 '1'.size 3.93
 '1'.distance 1
 '1'.quality 70.5
 '1018'.size 3.77
 '1018'.distance 1
 '1018'.quality 73.5
 '66'.size 3.66
 '66'.distance 1
 '66'.quality 64.5
 '96'.size 0.56
 '96'.distance 1
 '96'.quality 67.5
 '54'.size 5.06
 '54'.distance 1
 '54'.quality 70.5
 '55'.size 3.74
 '55'.distance 1
 '55'.quality 70.5
 '671'.size 3.59
 '671'.distance 1
 '671'.quality 67.5
 '10'.size 0.7
 '10'.distance 1
 '10'.quality 73.5
 '69'.size 0.94
 '69'.distance 1
 '69'.quality 73.5
 '38'.size 1.26
 '38'.distance 1
 '38'.quality 70.5
 '74'.size 3.15
 '74'.distance 1
 '74'.quality 70.5
 '1001'.size 1.41
 '1001'.distance 1
 '1001'.quality 70.5
 '114'.size 0.59
 '114'.distance 1
 '114'.quality 70.5
 '1141'.size 1.71
 '1141'.distance 1
 '1141'.quality 70.5
 '61'.size 0.26
 '61'.distance 1
 '61'.quality 70.5
/;

set plots_soilTypes(curPlots,soilTypes) /
 '37'.'Tonschluffe (tu)'
 '372'.'Tonschluffe (tu)'
 '1002'.'Tonschluffe (tu)'
 '1007'.'Tonschluffe (tu)'
 '1005'.'Tonschluffe (tu)'
 '115'.'Tonschluffe (tu)'
 '62'.'Tonschluffe (tu)'
 '137'.'Tonschluffe (tu)'
 '1011'.'Tonschluffe (tu)'
 '1050'.'Tonschluffe (tu)'
 '119'.'Tonschluffe (tu)'
 '1016'.'Tonschluffe (tu)'
 '1006'.'Tonschluffe (tu)'
 '371'.'Tonschluffe (tu)'
 '201'.'Tonschluffe (tu)'
 '2'.'Tonschluffe (tu)'
 '1371'.'Tonschluffe (tu)'
 '112'.'Tonschluffe (tu)'
 '1010'.'Tonschluffe (tu)'
 '121'.'Tonschluffe (tu)'
 '130'.'Tonschluffe (tu)'
 '901'.'Tonschluffe (tu)'
 '113'.'Tonschluffe (tu)'
 '1015'.'Tonschluffe (tu)'
 '1181'.'Tonschluffe (tu)'
 '462'.'Tonschluffe (tu)'
 '1019'.'Tonschluffe (tu)'
 '41'.'Tonschluffe (tu)'
 '75'.'Tonlehme (tl)'
 '86'.'Tonlehme (tl)'
 '88'.'Tonlehme (tl)'
 '56'.'Tonschluffe (tu)'
 '67'.'Tonschluffe (tu)'
 '571'.'Tonschluffe (tu)'
 '126'.'Tonschluffe (tu)'
 '131'.'Tonschluffe (tu)'
 '127'.'Tonschluffe (tu)'
 '128'.'Tonschluffe (tu)'
 '125'.'Tonschluffe (tu)'
 '136'.'Tonschluffe (tu)'
 '9'.'Tonschluffe (tu)'
 '39'.'Tonschluffe (tu)'
 '481'.'Tonschluffe (tu)'
 '48'.'Tonschluffe (tu)'
 '138'.'Tonschluffe (tu)'
 '574'.'Tonschluffe (tu)'
 '573'.'Tonschluffe (tu)'
 '118'.'Tonschluffe (tu)'
 '6'.'Tonschluffe (tu)'
 '117'.'Tonschluffe (tu)'
 '46'.'Tonschluffe (tu)'
 '132'.'Tonschluffe (tu)'
 '1004'.'Tonschluffe (tu)'
 '95'.'Tonschluffe (tu)'
 '43'.'Tonschluffe (tu)'
 '1014'.'Tonschluffe (tu)'
 '1012'.'Tonschluffe (tu)'
 '73'.'Tonschluffe (tu)'
 '1008'.'Tonschluffe (tu)'
 '1003'.'Tonschluffe (tu)'
 '1009'.'Tonschluffe (tu)'
 '1013'.'Tonschluffe (tu)'
 '140'.'Tonschluffe (tu)'
 '120'.'Tonschluffe (tu)'
 '135'.'Tonschluffe (tu)'
 '134'.'Tonschluffe (tu)'
 '133'.'Tonschluffe (tu)'
 '1'.'Tonschluffe (tu)'
 '1018'.'Tonschluffe (tu)'
 '66'.'Tonschluffe (tu)'
 '96'.'Tonschluffe (tu)'
 '54'.'Tonschluffe (tu)'
 '55'.'Tonschluffe (tu)'
 '671'.'Tonschluffe (tu)'
 '10'.'Tonschluffe (tu)'
 '69'.'Tonschluffe (tu)'
 '38'.'Tonschluffe (tu)'
 '74'.'Tonschluffe (tu)'
 '1001'.'Tonschluffe (tu)'
 '114'.'Tonschluffe (tu)'
 '1141'.'Tonschluffe (tu)'
 '61'.'Tonschluffe (tu)'
/;

set plots_rootCropCap(curPlots) /
 '37' 'YES'
 '372' 'YES'
 '1002' 'YES'
 '1007' 'YES'
 '1005' 'YES'
 '115' 'YES'
 '62' 'YES'
 '137' 'YES'
 '1011' 'YES'
 '1050' 'YES'
 '119' 'YES'
 '1016' 'YES'
 '1006' 'YES'
 '371' 'YES'
 '201' 'YES'
 '2' 'YES'
 '1371' 'YES'
 '112' 'YES'
 '1010' 'YES'
 '121' 'YES'
 '130' 'YES'
 '901' 'YES'
 '113' 'YES'
 '1015' 'YES'
 '1181' 'YES'
 '462' 'YES'
 '1019' 'YES'
 '41' 'YES'
 '75' 'YES'
 '86' 'YES'
 '88' 'YES'
 '56' 'YES'
 '67' 'YES'
 '571' 'YES'
 '126' 'YES'
 '131' 'YES'
 '127' 'YES'
 '128' 'YES'
 '125' 'YES'
 '136' 'YES'
 '9' 'YES'
 '39' 'YES'
 '481' 'YES'
 '48' 'YES'
 '138' 'YES'
 '574' 'YES'
 '573' 'YES'
 '118' 'YES'
 '6' 'YES'
 '117' 'YES'
 '46' 'YES'
 '132' 'YES'
 '1004' 'YES'
 '95' 'YES'
 '43' 'YES'
 '1014' 'YES'
 '1012' 'YES'
 '73' 'YES'
 '1008' 'YES'
 '1003' 'YES'
 '1009' 'YES'
 '1013' 'YES'
 '140' 'YES'
 '120' 'YES'
 '135' 'YES'
 '134' 'YES'
 '133' 'YES'
 '1' 'YES'
 '1018' 'YES'
 '66' 'YES'
 '96' 'YES'
 '54' 'YES'
 '55' 'YES'
 '671' 'YES'
 '10' 'YES'
 '69' 'YES'
 '38' 'YES'
 '74' 'YES'
 '1001' 'YES'
 '114' 'YES'
 '1141' 'YES'
 '61' 'YES'
/;

set plots_permPast(curPlots) /
 '62' 'YES'
 '132' 'YES'
 '135' 'YES'
 '134' 'YES'
 '133' 'YES'
 '66' 'YES'
 '96' 'YES'
 '10' 'YES'
 '74' 'YES'
 '61' 'YES'
/;

set crops /
 ''
 '220'
 '210'
 '459'
 '602'
 '422'
 '171'
 '634'
 '411'
 '131'
 '115'
 '603'
 '633'
/;

set curCrops(crops) /
 ''
 '220'
 '459'
 '602'
 '422'
 '634'
 '411'
 '115'
 '603'
 '633'
/;

set cropGroup /
 ''
 'Gattung: Vicia (Wicken)'
 'Dauergrünland'
 'Art: Solanum tuberosum (Kartoffel)'
 'Gras oder andere Grünfutterpflanzen'
 'Gattung: Daucus (Möhren)'
 'Gattung: Zea (Mais)'
 'Winterweizen'
 'Gattung: Beta (Rüben)'
 'Gattung: Allium (Lauch)'
/;

set crops_cropGroup(curCrops,cropGroup) /
 ''.''
 '220'.'Gattung: Vicia (Wicken)'
 '459'.'Dauergrünland'
 '602'.'Art: Solanum tuberosum (Kartoffel)'
 '422'.'Gras oder andere Grünfutterpflanzen'
 '634'.'Gattung: Daucus (Möhren)'
 '411'.'Gattung: Zea (Mais)'
 '115'.'Winterweizen'
 '603'.'Gattung: Beta (Rüben)'
 '633'.'Gattung: Allium (Lauch)'
/;

parameter p_cropData(curCrops,cropAttr) /
 '220'.rotBreak 5
 '220'.maxShare 20
 '220'.minSoilQuality 20
 '220'.efaFactor 1
 '459'.rotBreak 0
 '459'.maxShare 100
 '459'.minSoilQuality 0
 '459'.efaFactor 0
 '602'.rotBreak 3
 '602'.maxShare 33.33333333333333
 '602'.minSoilQuality 20
 '602'.efaFactor 0
 '422'.rotBreak 0
 '422'.maxShare 100
 '422'.minSoilQuality 20
 '422'.efaFactor 0
 '634'.rotBreak 4
 '634'.maxShare 25
 '634'.minSoilQuality 20
 '634'.efaFactor 0
 '411'.rotBreak 2
 '411'.maxShare 50
 '411'.minSoilQuality 20
 '411'.efaFactor 0
 '115'.rotBreak 2
 '115'.maxShare 50
 '115'.minSoilQuality 20
 '115'.efaFactor 0
 '603'.rotBreak 4
 '603'.maxShare 25
 '603'.minSoilQuality 20
 '603'.efaFactor 0
 '633'.rotBreak 3
 '633'.maxShare 33.33333333333333
 '633'.minSoilQuality 20
 '633'.efaFactor 0
/;

set crops_rootCrop(curCrops) /
 '602' YES
 '603' YES
/;

parameter p_croppingFactor(curCrops,curCrops) /
 '220'.'220' 2
 '220'.'459' 6
 '220'.'602' 10
 '220'.'422' 2
 '220'.'634' 4
 '220'.'411' 10
 '220'.'115' 10
 '220'.'603' 10
 '220'.'633' 4
 '459'.'220' 2
 '459'.'459' 4
 '459'.'602' 8
 '459'.'422' 2
 '459'.'634' 4
 '459'.'411' 8
 '459'.'115' 10
 '459'.'603' 8
 '459'.'633' 4
 '602'.'220' 8
 '602'.'459' 6
 '602'.'602' 2
 '602'.'422' 4
 '602'.'634' 4
 '602'.'411' 8
 '602'.'115' 10
 '602'.'603' 10
 '602'.'633' 4
 '422'.'220' 4
 '422'.'459' 4
 '422'.'602' 4
 '422'.'422' 10
 '422'.'634' 2
 '422'.'411' 6
 '422'.'115' 6
 '422'.'603' 4
 '422'.'633' 2
 '634'.'220' 4
 '634'.'459' 8
 '634'.'602' 6
 '634'.'422' 6
 '634'.'634' 4
 '634'.'411' 10
 '634'.'115' 8
 '634'.'603' 3
 '634'.'633' 4
 '411'.'220' 10
 '411'.'459' 10
 '411'.'602' 10
 '411'.'422' 8
 '411'.'634' 4
 '411'.'411' 8
 '411'.'115' 8
 '411'.'603' 4
 '411'.'633' 4
 '115'.'220' 10
 '115'.'459' 8
 '115'.'602' 10
 '115'.'422' 6
 '115'.'634' 10
 '115'.'411' 10
 '115'.'115' 4
 '115'.'603' 10
 '115'.'633' 10
 '603'.'220' 6
 '603'.'459' 8
 '603'.'602' 8
 '603'.'422' 2
 '603'.'634' 4
 '603'.'411' 8
 '603'.'115' 8
 '603'.'603' 2
 '603'.'633' 4
 '633'.'220' 4
 '633'.'459' 8
 '633'.'602' 6
 '633'.'422' 6
 '633'.'634' 4
 '633'.'411' 10
 '633'.'115' 8
 '633'.'603' 3
 '633'.'633' 4
/;

set plots_years_crops(plots,years,crops) /
 '37'.2019.'411' 'YES'
 '37'.2017.'603' 'YES'
 '372'.2019.'220' 'YES'
 '37'.2016.'131' 'YES'
 '372'.2018.'220' 'YES'
 '37'.2018.'411' 'YES'
 '1002'.2019.'411' 'YES'
 '1002'.2017.'220' 'YES'
 '1002'.2018.'411' 'YES'
 '1002'.2016.'411' 'YES'
 '1007'.2016.'131' 'YES'
 '1007'.2019.'115' 'YES'
 '1007'.2018.'115' 'YES'
 '1005'.2019.'603' 'YES'
 '1005'.2017.'115' 'YES'
 '1005'.2018.'603' 'YES'
 '115'.2017.'131' 'YES'
 '115'.2018.'411' 'YES'
 '115'.2019.'411' 'YES'
 '62'.2016.'459' 'YES'
 '62'.2019.'459' 'YES'
 '62'.2018.'459' 'YES'
 '62'.2017.'459' 'YES'
 '201'.2017.'220' 'YES'
 '2'.2017.'220' 'YES'
 '2'.2016.'411' 'YES'
 '201'.2016.'411' 'YES'
 '137'.2018.'220' 'YES'
 '137'.2017.'115' 'YES'
 '137'.2019.'220' 'YES'
 '1011'.2016.'131' 'YES'
 '1050'.2018.'115' 'YES'
 '1011'.2018.'411' 'YES'
 '1011'.2019.'411' 'YES'
 '1050'.2019.'115' 'YES'
 '112'.2016.'131' 'YES'
 '112'.2017.'411' 'YES'
 '119'.2017.'115' 'YES'
 '119'.2018.'603' 'YES'
 '119'.2019.'603' 'YES'
 '1010'.2016.'171' 'YES'
 '1016'.2017.'115' 'YES'
 '1016'.2019.'411' 'YES'
 '1016'.2018.'411' 'YES'
 '77'.2017.'115' 'YES'
 '1006'.2016.'603' 'YES'
 '1006'.2019.'115' 'YES'
 '1006'.2018.'115' 'YES'
 '121'.2017.'115' 'YES'
 '371'.2019.'633' 'YES'
 '371'.2018.'633' 'YES'
 '1007'.2017.'602' 'YES'
 '1005'.2016.'602' 'YES'
 '115'.2016.'602' 'YES'
 '201'.2018.'602' 'YES'
 '201'.2019.'602' 'YES'
 '2'.2019.'602' 'YES'
 '2'.2018.'602' 'YES'
 '1371'.2018.'633' 'YES'
 '1371'.2019.'633' 'YES'
 '137'.2016.'602' 'YES'
 '1011'.2017.'602' 'YES'
 '112'.2018.'602' 'YES'
 '112'.2019.'602' 'YES'
 '119'.2016.'602' 'YES'
 '1010'.2019.'602' 'YES'
 '1010'.2018.'602' 'YES'
 '1010'.2017.'633' 'YES'
 '1016'.2016.'602' 'YES'
 '77'.2016.'210' 'YES'
 '1006'.2017.'602' 'YES'
 '121'.2016.'210' 'YES'
 '121'.2018.'602' 'YES'
 '121'.2019.'602' 'YES'
 '571'.2017.'602' 'YES'
 '130'.2019.'633' 'YES'
 '130'.2018.'633' 'YES'
 '901'.2018.'634' 'YES'
 '901'.2019.'634' 'YES'
 '9'.2017.'633' 'YES'
 '39'.2017.'602' 'YES'
 '48'.2016.'602' 'YES'
 '113'.2019.'602' 'YES'
 '113'.2018.'602' 'YES'
 '574'.2016.'602' 'YES'
 '1015'.2018.'602' 'YES'
 '1015'.2019.'602' 'YES'
 '573'.2016.'602' 'YES'
 '1181'.2019.'633' 'YES'
 '1181'.2018.'633' 'YES'
 '6'.2017.'633' 'YES'
 '462'.2019.'602' 'YES'
 '462'.2017.'633' 'YES'
 '462'.2018.'602' 'YES'
 '1004'.2017.'602' 'YES'
 '43'.2017.'602' 'YES'
 '122'.2016.'602' 'YES'
 '123'.2016.'602' 'YES'
 '1019'.2018.'602' 'YES'
 '1019'.2019.'602' 'YES'
 '41'.2019.'602' 'YES'
 '41'.2018.'602' 'YES'
 '1012'.2017.'602' 'YES'
 '1008'.2017.'602' 'YES'
 '1003'.2016.'633' 'YES'
 '1013'.2016.'633' 'YES'
 '120'.2017.'602' 'YES'
 '1'.2017.'602' 'YES'
 '1018'.2017.'602' 'YES'
 '86'.2018.'602' 'YES'
 '75'.2019.'602' 'YES'
 '88'.2016.'633' 'YES'
 '75'.2016.'210' 'YES'
 '86'.2016.'210' 'YES'
 '75'.2018.'602' 'YES'
 '881'.2016.'210' 'YES'
 '86'.2019.'602' 'YES'
 '88'.2019.'602' 'YES'
 '88'.2018.'602' 'YES'
 '54'.2017.'634' 'YES'
 '56'.2018.'634' 'YES'
 '56'.2019.'634' 'YES'
 '67'.2019.'634' 'YES'
 '67'.2018.'634' 'YES'
 '38'.2016.'602' 'YES'
 '114'.2017.'602' 'YES'
 '571'.2018.'115' 'YES'
 '571'.2019.'115' 'YES'
 '126'.2019.'411' 'YES'
 '126'.2018.'411' 'YES'
 '126'.2017.'220' 'YES'
 '130'.2017.'220' 'YES'
 '131'.2019.'411' 'YES'
 '131'.2018.'411' 'YES'
 '131'.2017.'220' 'YES'
 '127'.2019.'411' 'YES'
 '127'.2018.'411' 'YES'
 '127'.2017.'220' 'YES'
 '128'.2019.'603' 'YES'
 '128'.2017.'131' 'YES'
 '128'.2018.'603' 'YES'
 '136'.2016.'171' 'YES'
 '125'.2016.'115' 'YES'
 '125'.2017.'131' 'YES'
 '125'.2019.'411' 'YES'
 '125'.2018.'411' 'YES'
 '136'.2018.'411' 'YES'
 '136'.2019.'411' 'YES'
 '136'.2017.'220' 'YES'
 '571'.2016.'131' 'YES'
 '9'.2016.'171' 'YES'
 '9'.2019.'220' 'YES'
 '9'.2018.'220' 'YES'
 '39'.2019.'115' 'YES'
 '39'.2016.'603' 'YES'
 '39'.2018.'115' 'YES'
 '48'.2017.'115' 'YES'
 '481'.2019.'220' 'YES'
 '48'.2019.'220' 'YES'
 '481'.2016.'171' 'YES'
 '481'.2018.'220' 'YES'
 '48'.2018.'220' 'YES'
 '113'.2017.'603' 'YES'
 '113'.2016.'131' 'YES'
 '138'.2018.'411' 'YES'
 '138'.2019.'411' 'YES'
 '138'.2017.'131' 'YES'
 '574'.2017.'115' 'YES'
 '574'.2018.'411' 'YES'
 '574'.2019.'411' 'YES'
 '1015'.2017.'131' 'YES'
 '1015'.2016.'115' 'YES'
 '573'.2019.'411' 'YES'
 '573'.2017.'220' 'YES'
 '573'.2018.'411' 'YES'
 '118'.2019.'220' 'YES'
 '118'.2017.'603' 'YES'
 '118'.2018.'220' 'YES'
 '118'.2016.'115' 'YES'
 '6'.2018.'220' 'YES'
 '6'.2016.'171' 'YES'
 '6'.2019.'220' 'YES'
 '117'.2017.'411' 'YES'
 '117'.2018.'411' 'YES'
 '46'.2017.'131' 'YES'
 '117'.2019.'411' 'YES'
 '461'.2016.'171' 'YES'
 '461'.2017.'131' 'YES'
 '46'.2019.'411' 'YES'
 '46'.2016.'115' 'YES'
 '46'.2018.'411' 'YES'
 '462'.2016.'131' 'YES'
 '117'.2016.'171' 'YES'
 '132'.2019.'459' 'YES'
 '132'.2016.'459' 'YES'
 '132'.2017.'459' 'YES'
 '132'.2018.'459' 'YES'
 '1004'.2018.'411' 'YES'
 '1004'.2016.'603' 'YES'
 '1004'.2019.'411' 'YES'
 '111'.2016.'115' 'YES'
 '95'.2017.'131' 'YES'
 '95'.2019.'411' 'YES'
 '95'.2018.'411' 'YES'
 '95'.2016.'171' 'YES'
 '43'.2016.'115' 'YES'
 '43'.2018.'115' 'YES'
 '43'.2019.'115' 'YES'
 '122'.2017.'411' 'YES'
 '123'.2017.'411' 'YES'
 '1014'.2017.'411' 'YES'
 '1014'.2018.'411' 'YES'
 '1014'.2019.'411' 'YES'
 '1014'.2016.'115' 'YES'
 '1019'.2017.'603' 'YES'
 '41'.2016.'115' 'YES'
 '41'.2017.'411' 'YES'
 '1012'.2018.'411' 'YES'
 '1012'.2016.'603' 'YES'
 '1012'.2019.'411' 'YES'
 '73'.2019.'115' 'YES'
 '73'.2018.'115' 'YES'
 '73'.2017.'411' 'YES'
 '73'.2016.'131' 'YES'
 '1008'.2016.'603' 'YES'
 '1008'.2018.'115' 'YES'
 '1008'.2019.'115' 'YES'
 '1003'.2018.'603' 'YES'
 '1003'.2017.'411' 'YES'
 '1003'.2019.'603' 'YES'
 '1009'.2017.'411' 'YES'
 '1009'.2016.'603' 'YES'
 '1009'.2019.'411' 'YES'
 '1009'.2018.'411' 'YES'
 '1013'.2018.'603' 'YES'
 '1013'.2019.'603' 'YES'
 '1013'.2017.'411' 'YES'
 '140'.2019.'411' 'YES'
 '140'.2017.'115' 'YES'
 '140'.2018.'411' 'YES'
 '120'.2016.'131' 'YES'
 '120'.2018.'115' 'YES'
 '120'.2019.'115' 'YES'
 '135'.2017.'459' 'YES'
 '131'.2016.'115' 'YES'
 '1252'.2016.'171' 'YES'
 '135'.2019.'459' 'YES'
 '133'.2016.'459' 'YES'
 '134'.2019.'459' 'YES'
 '135'.2018.'459' 'YES'
 '1251'.2016.'171' 'YES'
 '127'.2016.'115' 'YES'
 '135'.2016.'459' 'YES'
 '133'.2017.'459' 'YES'
 '126'.2016.'171' 'YES'
 '134'.2017.'459' 'YES'
 '1131'.2017.'603' 'YES'
 '128'.2016.'171' 'YES'
 '134'.2016.'459' 'YES'
 '463'.2016.'171' 'YES'
 '134'.2018.'459' 'YES'
 '133'.2019.'459' 'YES'
 '133'.2018.'459' 'YES'
 '130'.2016.'115' 'YES'
 '1'.2019.'411' 'YES'
 '1'.2018.'411' 'YES'
 '1'.2016.'603' 'YES'
 '116'.2017.'603' 'YES'
 '116'.2016.'131' 'YES'
 '1018'.2016.'603' 'YES'
 '1018'.2018.'411' 'YES'
 '1018'.2019.'411' 'YES'
 '66'.2016.'459' 'YES'
 '66'.2018.'459' 'YES'
 '66'.2017.'459' 'YES'
 '66'.2019.'459' 'YES'
 '96'.2017.'459' 'YES'
 '96'.2016.'459' 'YES'
 '96'.2018.'459' 'YES'
 '96'.2019.'459' 'YES'
 '86'.2017.'115' 'YES'
 '75'.2017.'115' 'YES'
 '88'.2017.'115' 'YES'
 '54'.2019.'115' 'YES'
 '54'.2018.'115' 'YES'
 '55'.2019.'115' 'YES'
 '55'.2017.'603' 'YES'
 '55'.2018.'115' 'YES'
 '55'.2016.'115' 'YES'
 '56'.2016.'115' 'YES'
 '56'.2017.'411' 'YES'
 '54'.2016.'115' 'YES'
 '671'.2018.'220' 'YES'
 '67'.2017.'411' 'YES'
 '671'.2019.'220' 'YES'
 '67'.2016.'115' 'YES'
 '10'.2017.'459' 'YES'
 '10'.2016.'459' 'YES'
 '10'.2019.'459' 'YES'
 '10'.2018.'459' 'YES'
 '69'.2019.'411' 'YES'
 '69'.2018.'411' 'YES'
 '69'.2017.'411' 'YES'
 '69'.2016.'131' 'YES'
 '38'.2018.'422' 'YES'
 '38'.2019.'422' 'YES'
 '38'.2017.'422' 'YES'
 '74'.2018.'459' 'YES'
 '74'.2017.'459' 'YES'
 '74'.2019.'459' 'YES'
 '74'.2016.'459' 'YES'
 '1001'.2018.'603' 'YES'
 '1001'.2019.'603' 'YES'
 '1001'.2017.'220' 'YES'
 '1001'.2016.'411' 'YES'
 '114'.2019.'220' 'YES'
 '114'.2016.'131' 'YES'
 '1141'.2019.'115' 'YES'
 '1141'.2018.'115' 'YES'
 '114'.2018.'220' 'YES'
 '61'.2017.'459' 'YES'
 '61'.2016.'459' 'YES'
 '61'.2019.'459' 'YES'
 '61'.2018.'459' 'YES'
/;

parameter p_grossMarginData(curPlots,curCrops) /
 '37'.'220' 27
 '37'.'459' 581
 '37'.'602' 1743
 '37'.'422' 291
 '37'.'634' -607
 '37'.'115' 72
 '37'.'633' -358
 '372'.'459' 237
 '372'.'602' 1471
 '372'.'422' -45
 '372'.'634' -512
 '372'.'411' 177
 '372'.'115' 126
 '372'.'603' 284
 '372'.'633' -302
 '1002'.'459' 2731
 '1002'.'602' 8263
 '1002'.'422' 1384
 '1002'.'634' -2545
 '1002'.'115' 379
 '1002'.'603' -336
 '1002'.'633' -1487
 '1007'.'220' 801
 '1007'.'459' 8499
 '1007'.'422' 3641
 '1007'.'634' 17631
 '1007'.'411' 4618
 '1007'.'603' 7012
 '1007'.'633' 12437
 '1005'.'220' -434
 '1005'.'459' 4954
 '1005'.'602' 14352
 '1005'.'422' -436
 '1005'.'634' -5342
 '1005'.'411' 1352
 '1005'.'115' 1025
 '1005'.'633' -3085
 '115'.'220' 291
 '115'.'459' 5003
 '115'.'602' 15138
 '115'.'422' 2536
 '115'.'634' -4663
 '115'.'115' 695
 '115'.'603' -616
 '115'.'633' -2725
 '62'.'220' -152
 '62'.'459' 146
 '62'.'602' 1366
 '62'.'422' -60
 '62'.'634' -683
 '62'.'411' 100
 '62'.'115' 168
 '62'.'603' 220
 '62'.'633' -402
 '137'.'459' 2337
 '137'.'602' 14426
 '137'.'422' -310
 '137'.'634' -3806
 '137'.'411' 1918
 '137'.'115' 1341
 '137'.'603' 2912
 '137'.'633' -2198
 '1011'.'220' 131
 '1011'.'459' 2778
 '1011'.'422' 1394
 '1011'.'634' -2902
 '1011'.'115' 346
 '1011'.'603' -414
 '1011'.'633' -1710
 '1050'.'220' 296
 '1050'.'459' 4644
 '1050'.'602' 18793
 '1050'.'422' 1904
 '1050'.'634' 8575
 '1050'.'411' 2256
 '1050'.'603' 3628
 '1050'.'633' 6148
 '119'.'220' -1042
 '119'.'459' 8372
 '119'.'602' 23598
 '119'.'422' -1031
 '119'.'634' -11796
 '119'.'411' 1730
 '119'.'115' 1406
 '119'.'633' -6952
 '1016'.'220' -728
 '1016'.'459' -708
 '1016'.'602' -3751
 '1016'.'422' -698
 '1016'.'634' -6408
 '1016'.'115' -982
 '1016'.'603' -1532
 '1016'.'633' -4057
 '1006'.'220' 635
 '1006'.'459' 8114
 '1006'.'422' 3398
 '1006'.'634' 15860
 '1006'.'411' 4164
 '1006'.'633' 11279
 '371'.'220' -168
 '371'.'459' 767
 '371'.'602' 1220
 '371'.'422' 315
 '371'.'634' -1081
 '371'.'411' 373
 '371'.'115' 129
 '371'.'603' -280
 '201'.'459' 2743
 '201'.'422' 605
 '201'.'634' -5936
 '201'.'411' 870
 '201'.'115' 1462
 '201'.'603' 3291
 '201'.'633' -3498
 '2'.'459' 8598
 '2'.'422' 1895
 '2'.'634' -18605
 '2'.'411' 2728
 '2'.'115' 4582
 '2'.'603' 10316
 '2'.'633' -10964
 '1371'.'220' -1789
 '1371'.'459' 8184
 '1371'.'602' 13013
 '1371'.'422' 3356
 '1371'.'634' -11531
 '1371'.'411' 3977
 '1371'.'115' 1375
 '1371'.'603' -2983
 '112'.'220' -71
 '112'.'459' 943
 '112'.'422' 189
 '112'.'634' -2315
 '112'.'411' 251
 '112'.'115' 482
 '112'.'603' 1108
 '112'.'633' -1374
 '1010'.'220' -63
 '1010'.'459' 2919
 '1010'.'422' 694
 '1010'.'634' -5570
 '1010'.'411' 1059
 '1010'.'115' 1613
 '1010'.'603' 3567
 '121'.'220' 39
 '121'.'459' 7684
 '121'.'422' 1974
 '121'.'634' -12513
 '121'.'411' 3168
 '121'.'115' 4409
 '121'.'603' 9574
 '121'.'633' -7227
 '130'.'459' 3742
 '130'.'602' 5950
 '130'.'422' 1535
 '130'.'634' -5272
 '130'.'411' 1818
 '130'.'115' 629
 '130'.'603' -1364
 '901'.'220' -1762
 '901'.'459' 8063
 '901'.'602' 12821
 '901'.'422' 3307
 '901'.'411' 3918
 '901'.'115' 1354
 '901'.'603' -2939
 '901'.'633' -6695
 '113'.'220' -61
 '113'.'459' 2798
 '113'.'422' 665
 '113'.'634' -5339
 '113'.'411' 1015
 '113'.'115' 1546
 '113'.'633' -3120
 '1015'.'220' 17
 '1015'.'459' 3431
 '1015'.'422' 881
 '1015'.'634' -5587
 '1015'.'411' 1414
 '1015'.'115' 1968
 '1015'.'603' 4274
 '1015'.'633' -3227
 '1181'.'220' -835
 '1181'.'459' 3823
 '1181'.'602' 6079
 '1181'.'422' 1568
 '1181'.'634' -5386
 '1181'.'411' 1857
 '1181'.'115' 642
 '1181'.'603' -1394
 '462'.'220' -174
 '462'.'459' 3725
 '462'.'422' 821
 '462'.'634' -8060
 '462'.'411' 1182
 '462'.'115' 1985
 '462'.'603' 4469
 '1019'.'220' -102
 '1019'.'459' 2182
 '1019'.'422' 481
 '1019'.'634' -4722
 '1019'.'411' 692
 '1019'.'115' 1163
 '1019'.'633' -2783
 '41'.'220' -119
 '41'.'459' 2559
 '41'.'422' 564
 '41'.'634' -5538
 '41'.'411' 812
 '41'.'115' 1364
 '41'.'603' 3071
 '41'.'633' -3264
 '75'.'220' -56
 '75'.'459' 626
 '75'.'422' 119
 '75'.'634' -1637
 '75'.'411' 148
 '75'.'115' 312
 '75'.'603' 726
 '75'.'633' -974
 '86'.'220' -44
 '86'.'459' 747
 '86'.'422' 157
 '86'.'634' -1720
 '86'.'411' 218
 '86'.'115' 390
 '86'.'603' 887
 '86'.'633' -1017
 '88'.'220' -117
 '88'.'459' 1977
 '88'.'422' 416
 '88'.'634' -4555
 '88'.'411' 578
 '88'.'115' 1032
 '88'.'603' 2347
 '88'.'633' -2693
 '56'.'220' -1086
 '56'.'459' 4967
 '56'.'602' 7898
 '56'.'422' 2037
 '56'.'411' 2413
 '56'.'115' 834
 '56'.'603' -1811
 '56'.'633' -4124
 '67'.'220' -601
 '67'.'459' 2517
 '67'.'602' 3845
 '67'.'422' 1008
 '67'.'411' 1146
 '67'.'115' 370
 '67'.'603' -1024
 '67'.'633' -2366
 '571'.'220' 644
 '571'.'459' 10095
 '571'.'422' 4140
 '571'.'634' 18641
 '571'.'411' 4905
 '571'.'603' 7887
 '571'.'633' 13365
 '126'.'459' -447
 '126'.'602' -2369
 '126'.'422' -441
 '126'.'634' -4047
 '126'.'115' -620
 '126'.'603' -967
 '126'.'633' -2563
 '131'.'459' 2887
 '131'.'602' 8661
 '131'.'422' 1448
 '131'.'634' -3015
 '131'.'115' 359
 '131'.'603' -430
 '131'.'633' -1777
 '127'.'459' 1776
 '127'.'602' 5374
 '127'.'422' 900
 '127'.'634' -1655
 '127'.'115' 247
 '127'.'603' -219
 '127'.'633' -967
 '128'.'220' -536
 '128'.'459' 4307
 '128'.'602' 12140
 '128'.'422' -530
 '128'.'634' -6069
 '128'.'411' 890
 '128'.'115' 724
 '128'.'633' -3576
 '125'.'220' 509
 '125'.'459' 14480
 '125'.'602' 43031
 '125'.'422' 7179
 '125'.'634' -16932
 '125'.'115' 1572
 '125'.'603' -2570
 '125'.'633' -10051
 '136'.'459' 1652
 '136'.'602' 4844
 '136'.'422' 805
 '136'.'634' -2224
 '136'.'115' 143
 '136'.'603' -360
 '136'.'633' -1331
 '9'.'459' 9019
 '9'.'602' 56053
 '9'.'422' -1705
 '9'.'634' -19515
 '9'.'411' 6730
 '9'.'115' 4807
 '9'.'603' 10820
 '39'.'220' 124
 '39'.'459' 1938
 '39'.'422' 795
 '39'.'634' 3579
 '39'.'411' 942
 '39'.'633' 2566
 '481'.'459' 1718
 '481'.'602' 10677
 '481'.'422' -325
 '481'.'634' -3717
 '481'.'411' 1282
 '481'.'115' 916
 '481'.'603' 2061
 '481'.'633' -2191
 '48'.'459' 3862
 '48'.'602' 23837
 '48'.'422' -513
 '48'.'634' -6289
 '48'.'411' 3169
 '48'.'115' 2216
 '48'.'603' 4812
 '48'.'633' -3632
 '138'.'220' 574
 '138'.'459' 12147
 '138'.'602' 36443
 '138'.'422' 6094
 '138'.'634' -12688
 '138'.'115' 1513
 '138'.'603' -1809
 '138'.'633' -7477
 '574'.'220' 117
 '574'.'459' 2469
 '574'.'602' 7408
 '574'.'422' 1239
 '574'.'634' -2579
 '574'.'115' 307
 '574'.'603' -368
 '574'.'633' -1520
 '573'.'459' 3159
 '573'.'602' 9478
 '573'.'422' 1585
 '573'.'634' -3300
 '573'.'115' 393
 '573'.'603' -470
 '573'.'633' -1945
 '118'.'459' 175
 '118'.'602' 1089
 '118'.'422' -33
 '118'.'634' -379
 '118'.'411' 131
 '118'.'115' 93
 '118'.'633' -224
 '6'.'459' 2378
 '6'.'602' 14734
 '6'.'422' -385
 '6'.'634' -4538
 '6'.'411' 1860
 '6'.'115' 1314
 '6'.'603' 2906
 '117'.'220' 108
 '117'.'459' 2288
 '117'.'602' 6864
 '117'.'422' 1148
 '117'.'634' -2390
 '117'.'115' 285
 '117'.'603' -341
 '117'.'633' -1408
 '46'.'220' 240
 '46'.'459' 5084
 '46'.'602' 15252
 '46'.'422' 2550
 '46'.'634' -5310
 '46'.'115' 633
 '46'.'603' -757
 '46'.'633' -3129
 '132'.'220' -174
 '132'.'459' 151
 '132'.'602' 1447
 '132'.'422' -74
 '132'.'634' -825
 '132'.'411' 89
 '132'.'115' 172
 '132'.'603' 222
 '132'.'633' -490
 '1004'.'220' 244
 '1004'.'459' 3466
 '1004'.'422' 1778
 '1004'.'634' -2793
 '1004'.'115' 536
 '1004'.'633' -1613
 '95'.'220' 443
 '95'.'459' 9369
 '95'.'602' 28108
 '95'.'422' 4700
 '95'.'634' -9786
 '95'.'115' 1167
 '95'.'603' -1395
 '95'.'633' -5767
 '43'.'220' 464
 '43'.'459' 7282
 '43'.'422' 2986
 '43'.'634' 13446
 '43'.'411' 3538
 '43'.'603' 5689
 '43'.'633' 9640
 '1014'.'220' 183
 '1014'.'459' 3867
 '1014'.'602' 11603
 '1014'.'422' 1940
 '1014'.'634' -4040
 '1014'.'115' 482
 '1014'.'603' -576
 '1014'.'633' -2381
 '1012'.'220' 494
 '1012'.'459' 10440
 '1012'.'422' 5237
 '1012'.'634' -10905
 '1012'.'115' 1300
 '1012'.'633' -6426
 '73'.'220' 44
 '73'.'459' 1777
 '73'.'602' 7102
 '73'.'422' 687
 '73'.'634' 2760
 '73'.'411' 732
 '73'.'603' 1288
 '73'.'633' 2034
 '1008'.'220' 571
 '1008'.'459' 6060
 '1008'.'422' 2596
 '1008'.'634' 12571
 '1008'.'411' 3293
 '1008'.'633' 8868
 '1003'.'220' -345
 '1003'.'459' 3939
 '1003'.'602' 11412
 '1003'.'422' -346
 '1003'.'634' -4247
 '1003'.'411' 1075
 '1003'.'115' 815
 '1003'.'633' -2453
 '1009'.'220' 71
 '1009'.'459' 1507
 '1009'.'602' 4521
 '1009'.'422' 756
 '1009'.'634' -1574
 '1009'.'115' 188
 '1009'.'633' -928
 '1013'.'220' -459
 '1013'.'459' 3688
 '1013'.'602' 10395
 '1013'.'422' -454
 '1013'.'634' -5196
 '1013'.'411' 762
 '1013'.'115' 620
 '1013'.'633' -3062
 '140'.'220' 141
 '140'.'459' 2978
 '140'.'602' 8934
 '140'.'422' 1494
 '140'.'634' -3110
 '140'.'115' 371
 '140'.'603' -443
 '140'.'633' -1833
 '120'.'220' 281
 '120'.'459' 2985
 '120'.'422' 1278
 '120'.'634' 6191
 '120'.'411' 1622
 '120'.'603' 2462
 '120'.'633' 4367
 '135'.'220' -13
 '135'.'459' 11
 '135'.'602' 106
 '135'.'422' -5
 '135'.'634' -60
 '135'.'411' 7
 '135'.'115' 13
 '135'.'603' 16
 '135'.'633' -36
 '134'.'220' -55
 '134'.'459' -53
 '134'.'602' -282
 '134'.'422' -52
 '134'.'634' -482
 '134'.'411' -123
 '134'.'115' -74
 '134'.'603' -115
 '134'.'633' -305
 '133'.'220' -664
 '133'.'459' 576
 '133'.'602' 5506
 '133'.'422' -281
 '133'.'634' -3141
 '133'.'411' 340
 '133'.'115' 654
 '133'.'603' 843
 '133'.'633' -1864
 '1'.'220' 337
 '1'.'459' 7135
 '1'.'422' 3580
 '1'.'634' -7453
 '1'.'115' 889
 '1'.'633' -4392
 '1018'.'220' 419
 '1018'.'459' 7199
 '1018'.'422' 3650
 '1018'.'634' -6709
 '1018'.'115' 1000
 '1018'.'633' -3921
 '66'.'220' -1581
 '66'.'459' 1179
 '66'.'602' 11707
 '66'.'422' -725
 '66'.'634' -7903
 '66'.'411' 522
 '66'.'115' 1313
 '66'.'603' 1655
 '66'.'633' -4728
 '96'.'220' -238
 '96'.'459' 207
 '96'.'602' 1976
 '96'.'422' -101
 '96'.'634' -1127
 '96'.'411' 122
 '96'.'115' 235
 '96'.'603' 303
 '96'.'633' -669
 '54'.'220' 434
 '54'.'459' 6811
 '54'.'602' 27563
 '54'.'422' 2793
 '54'.'411' 3309
 '54'.'603' 5321
 '54'.'633' 9017
 '55'.'220' 321
 '55'.'459' 5034
 '55'.'602' 20373
 '55'.'422' 2065
 '55'.'634' 9295
 '55'.'411' 2446
 '55'.'633' 6664
 '671'.'459' 2945
 '671'.'602' 18369
 '671'.'422' -647
 '671'.'634' -7228
 '671'.'411' 2078
 '671'.'115' 1504
 '671'.'603' 3459
 '671'.'633' -4291
 '10'.'220' -291
 '10'.'459' 311
 '10'.'602' 2841
 '10'.'422' -106
 '10'.'634' -1246
 '10'.'411' 237
 '10'.'115' 361
 '10'.'603' 477
 '10'.'633' -728
 '69'.'220' 105
 '69'.'459' 1795
 '69'.'602' 5431
 '69'.'422' 910
 '69'.'634' -1673
 '69'.'115' 249
 '69'.'603' -221
 '69'.'633' -978
 '38'.'220' -371
 '38'.'459' 513
 '38'.'602' 613
 '38'.'422' 1600
 '38'.'634' -4230
 '38'.'411' -123
 '38'.'115' -19
 '38'.'603' -341
 '38'.'633' -2626
 '74'.'220' -1326
 '74'.'459' 1282
 '74'.'602' 11951
 '74'.'422' -522
 '74'.'634' -5974
 '74'.'411' 876
 '74'.'115' 1471
 '74'.'603' 1924
 '74'.'633' -3521
 '1001'.'459' 1898
 '1001'.'602' 5349
 '1001'.'422' -234
 '1001'.'634' -2674
 '1001'.'411' 392
 '1001'.'115' 319
 '1001'.'633' -1576
 '114'.'459' 517
 '114'.'422' -98
 '114'.'634' -1119
 '114'.'411' 386
 '114'.'115' 276
 '114'.'603' 620
 '114'.'633' -659
 '1141'.'220' 147
 '1141'.'459' 2302
 '1141'.'602' 9315
 '1141'.'422' 944
 '1141'.'634' 4250
 '1141'.'411' 1118
 '1141'.'603' 1798
 '1141'.'633' 3047
 '61'.'220' -109
 '61'.'459' 106
 '61'.'602' 986
 '61'.'422' -43
 '61'.'634' -493
 '61'.'411' 72
 '61'.'115' 121
 '61'.'603' 159
 '61'.'633' -291
/;

parameter p_laborReq(crops,halfMonths) /
 '220'.MRZ1 1.81
 '220'.MAI2 0.27
 '220'.AUG2 1.9
 '220'.SEP1 1
 '220'.SEP2 0.04
 '220'.OKT1 1.16
 '220'.OKT2 1.88
 '459'.SEP2 0.05
 '602'.MRZ1 1.07
 '602'.MRZ2 0.29
 '602'.APR1 1.42
 '602'.APR2 0.69
 '602'.MAI1 0.38
 '602'.JUN2 0.68
 '602'.JUL1 0.68
 '602'.JUL2 0.34
 '602'.AUG1 0.82
 '602'.AUG2 2.08
 '602'.SEP2 31.44
 '602'.OKT1 0.15
 '602'.NOV1 3.27
 '422'.APR1 0.8
 '422'.JUN1 3.44
 '422'.JUL2 2.95
 '422'.AUG2 2.47
 '422'.SEP1 1
 '422'.OKT1 0.04
 '422'.OKT2 3.67
 '634'.APR1 5.33
 '634'.APR2 4.82
 '634'.MAI1 1.83
 '634'.MAI2 52.04
 '634'.JUN1 53.65
 '634'.JUN2 2.12
 '634'.JUL1 52.62
 '634'.JUL2 1.07
 '634'.AUG1 2.24
 '634'.AUG2 1.44
 '634'.SEP1 51.95
 '634'.OKT1 12.73
 '634'.OKT2 1.08
 '411'.MRZ2 1.24
 '411'.APR1 3.07
 '411'.APR2 1.07
 '411'.MAI1 0.43
 '411'.MAI2 0.37
 '411'.SEP2 4.2
 '411'.OKT1 1.27
 '411'.OKT2 1.88
 '115'.FEB1 0.5
 '115'.FEB2 0.31
 '115'.MRZ2 0.12
 '115'.APR1 0.47
 '115'.APR2 0.27
 '115'.MAI1 0.12
 '115'.JUN1 0.44
 '115'.AUG1 2.4
 '115'.AUG2 1
 '115'.SEP1 0.29
 '115'.SEP2 2.8
 '115'.OKT1 0.57
 '115'.OKT2 1.24
 '603'.FEB2 0.5
 '603'.MRZ1 0.82
 '603'.MRZ2 1.41
 '603'.MAI2 0.27
 '603'.JUL2 0.12
 '603'.AUG1 0.27
 '603'.SEP2 4.45
 '603'.OKT1 1.31
 '603'.OKT2 1.88
 '633'.MRZ1 2.86
 '633'.MRZ2 0.3
 '633'.APR1 0.6
 '633'.MAI1 0.3
 '633'.MAI2 1.02
 '633'.JUN1 10.64
 '633'.JUN2 0.36
 '633'.JUL1 1.53
 '633'.JUL2 1.53
 '633'.AUG2 12.84
 '633'.SEP1 3.59
 '633'.OKT1 1.81
 '633'.OKT2 0.39
 '633'.NOV1 1.88
/;
