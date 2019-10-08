* -------------------------------
* Fruchtfolge Model - Include file
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2019
* -------------------------------

* Static data
set grossMarginAttr / price,yield,directCosts,variableCosts,fixCosts,grossMargin,revenue,distanceCosts,croppingFactor,yieldCap /;
set plotAttr / size,distance,quality,humusContent /;
set cropAttr / rotBreak, maxShare, minSoilQuality, efaFactor, catchCropAfter, season, duevYieldLvl, nRequirement, nMaxAddition, nMinSubtraction, prevCropEff, pWithdraw, pHarvestLeft, hnv/;
set cropType / catchCrop, Blattfrucht, Halmfrucht /;
set symbol / lt,gt /;
set soilTypes /
"Reinsande (ss)"
"Lehmsande (ls)"
"Schluffsande (us)"
"Sandlehme (sl)"
"Normallehme (ll)"
"Tonlehme (tl)"
"Lehmschluffe (lu)"
"Tonschluffe (tu)"
"Schlufftone (ut)"
"Moore (mo)"
"Watt"
"Siedlung"
"Abbauflächen"
"Gewässer"
/;

set humusContents /
'1 - <2%'
'2 - <3%'
'3 - <4%'
'4 - <6%'
'6 - <8%'
'8 - <11,5%'
'11,5 - <15%'
'15 - <30%'
'≥30%'
/;
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
set manAmounts /0,5,7,10,12,15,20,25,30/;
set solidAmounts /'0','6.5','10','15','17','20','25','30'/;
$onempty
$offdigit
set curYear(years) / 2019 /;
set plots /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'
 '2d64e2d8-1909-4abf-9c42-71041141645a'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'
 '558f9729-9f85-4837-ad21-033762c4ba5d'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'
 'cc74cf23-840a-4016-a5b6-144b4d228489'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'
 'dc298ebb-1b27-411a-8024-af0623f621c5'
/;

set curPlots(plots) /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'
 '2d64e2d8-1909-4abf-9c42-71041141645a'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'
 '558f9729-9f85-4837-ad21-033762c4ba5d'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'
 'cc74cf23-840a-4016-a5b6-144b4d228489'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'
 'dc298ebb-1b27-411a-8024-af0623f621c5'
/;

parameter p_plotData(curPlots,plotAttr) /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.size 3.64
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.distance 5.46
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.quality 57
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.size 8.62
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.distance 7.44
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.quality 57
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.size 1.93
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.distance 6.04
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.quality 57
 '2d64e2d8-1909-4abf-9c42-71041141645a'.size 3.31
 '2d64e2d8-1909-4abf-9c42-71041141645a'.distance 0.47
 '2d64e2d8-1909-4abf-9c42-71041141645a'.quality 67.5
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.size 4.76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.distance 0.3
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.quality 64.5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.size 6.46
 '558f9729-9f85-4837-ad21-033762c4ba5d'.distance 6.45
 '558f9729-9f85-4837-ad21-033762c4ba5d'.quality 57
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.size 2.74
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.distance 6.8
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.quality 57
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.size 7.81
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.distance 0.77
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.quality 67.5
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.size 5.87
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.distance 3.13
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.quality 65
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.size 4.72
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.distance 5.82
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.quality 57
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.size 2.34
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.distance 0.4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.quality 64.5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.size 1.98
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.distance 6.26
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.quality 57
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.size 4.28
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.distance 5.57
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.quality 57
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.size 1.37
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.distance 6.62
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.quality 57
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.size 4.17
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.distance 3.28
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.quality 67.5
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.size 6.49
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.distance 6.67
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.quality 57
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.size 8.95
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.distance 2.52
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.quality 67.5
 'cc74cf23-840a-4016-a5b6-144b4d228489'.size 6.38
 'cc74cf23-840a-4016-a5b6-144b4d228489'.distance 4.34
 'cc74cf23-840a-4016-a5b6-144b4d228489'.quality 57
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.size 9.02
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.distance 1.19
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.quality 67.5
 'dc298ebb-1b27-411a-8024-af0623f621c5'.size 3.57
 'dc298ebb-1b27-411a-8024-af0623f621c5'.distance 4.12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.quality 57
/;

set plots_soilTypes(curPlots,soilTypes) /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Reinsande (ss)'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Reinsande (ss)'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Reinsande (ss)'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Lehmsande (ls)'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Lehmsande (ls)'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Reinsande (ss)'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Reinsande (ss)'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Lehmsande (ls)'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Lehmsande (ls)'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Reinsande (ss)'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Lehmsande (ls)'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Reinsande (ss)'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Reinsande (ss)'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Reinsande (ss)'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Lehmsande (ls)'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Reinsande (ss)'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Lehmsande (ls)'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Reinsande (ss)'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Lehmsande (ls)'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Reinsande (ss)'
/;

set plots_humusContent(curPlots,humusContents) /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'6 - <8%'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'2 - <3%'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'6 - <8%'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'3 - <4%'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'3 - <4%'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'2 - <3%'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'2 - <3%'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'3 - <4%'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'3 - <4%'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'6 - <8%'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'3 - <4%'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'2 - <3%'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'2 - <3%'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'2 - <3%'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'3 - <4%'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'2 - <3%'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'3 - <4%'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'6 - <8%'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'3 - <4%'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'6 - <8%'
/;

set plots_rootCropCap(curPlots) /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369' 'YES'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f' 'YES'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8' 'YES'
 '2d64e2d8-1909-4abf-9c42-71041141645a' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8' 'YES'
 '558f9729-9f85-4837-ad21-033762c4ba5d' 'YES'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f' 'YES'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3' 'YES'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d' 'YES'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31' 'YES'
 'af3d2471-1e40-4c82-b332-0147a237b3dd' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204' 'YES'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5' 'YES'
/;

set plots_permPast(curPlots) /

/;

set plots_duevEndangered(curPlots) /
 '2d64e2d8-1909-4abf-9c42-71041141645a' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5' 'YES'
/;

set crops /
 ''
 'Speisekartoffeln'
 'Stärkekartoffeln'
 'Sommergerste - Braugerste'
 'Erbsen, Markerbsen'
 'Sojabohnen - Speisequalität'
 'Winterroggen - Mahl- und Brotroggen'
 'Mais - Silomais'
 'Winterraps'
 'Zuckerrüben'
 'Winterweizen - Brotweizen'
 'Wintergerste - Futtergerste'
 'Wintertriticale - Futtertriticale'
 'Sommerhafer - Futterhafer'
 'Silomais (als Hauptfutter)'
 'Winterweichweizen'
 'Wintergerste'
 'Kartoffeln'
/;

set curCrops(crops) /
 ''
 'Mais - Silomais'
 'Sommerhafer - Futterhafer'
 'Sommergerste - Braugerste'
 'Wintertriticale - Futtertriticale'
 'Winterweizen - Brotweizen'
 'Zuckerrüben'
 'Winterraps'
 'Wintergerste - Futtergerste'
 'Winterroggen - Mahl- und Brotroggen'
 'Erbsen, Markerbsen'
 'Stärkekartoffeln'
/;

set permPastCrops(curCrops) /
 ''
/;

set cropGroup /
 ''
 'Gattung: Zea (Mais)'
 'Sommerhafer'
 'Sommergerste'
 'Wintertriticale'
 'Winterweizen'
 'Gattung: Beta (Rüben)'
 'Winterraps'
 'Wintergerste'
 'Winterroggen'
 'Gattung: Pisum (Erbse)'
 'Art: Solanum tuberosum (Kartoffel)'
/;

set crops_cropGroup(curCrops,cropGroup) /
 ''.''
 'Mais - Silomais'.'Gattung: Zea (Mais)'
 'Sommerhafer - Futterhafer'.'Sommerhafer'
 'Sommergerste - Braugerste'.'Sommergerste'
 'Wintertriticale - Futtertriticale'.'Wintertriticale'
 'Winterweizen - Brotweizen'.'Winterweizen'
 'Zuckerrüben'.'Gattung: Beta (Rüben)'
 'Winterraps'.'Winterraps'
 'Wintergerste - Futtergerste'.'Wintergerste'
 'Winterroggen - Mahl- und Brotroggen'.'Winterroggen'
 'Erbsen, Markerbsen'.'Gattung: Pisum (Erbse)'
 'Stärkekartoffeln'.'Art: Solanum tuberosum (Kartoffel)'
/;

set crops_cropType(curCrops,cropType) /
 'Mais - Silomais'.'Blattfrucht'
 'Sommerhafer - Futterhafer'.'Halmfrucht'
 'Sommergerste - Braugerste'.'Halmfrucht'
 'Wintertriticale - Futtertriticale'.'Halmfrucht'
 'Winterweizen - Brotweizen'.'Halmfrucht'
 'Zuckerrüben'.'Blattfrucht'
 'Winterraps'.'Blattfrucht'
 'Wintergerste - Futtergerste'.'Halmfrucht'
 'Winterroggen - Mahl- und Brotroggen'.'Halmfrucht'
 'Erbsen, Markerbsen'.'Blattfrucht'
 'Stärkekartoffeln'.'Blattfrucht'
/;

parameter p_cropData(curCrops,cropAttr) /

'Mais - Silomais'.maxShare 50
'Mais - Silomais'.minSoilQuality 20

'Mais - Silomais'.duevYieldLvl 450
'Mais - Silomais'.nRequirement 200
'Mais - Silomais'.nMaxAddition 0.2
'Mais - Silomais'.nMinSubtraction 0.3

'Mais - Silomais'.pWithdraw 0.16


'Sommerhafer - Futterhafer'.rotBreak 3
'Sommerhafer - Futterhafer'.maxShare 25
'Sommerhafer - Futterhafer'.minSoilQuality 20

'Sommerhafer - Futterhafer'.duevYieldLvl 55
'Sommerhafer - Futterhafer'.nRequirement 130
'Sommerhafer - Futterhafer'.nMaxAddition 1
'Sommerhafer - Futterhafer'.nMinSubtraction 1.5

'Sommerhafer - Futterhafer'.pWithdraw 0.8
'Sommerhafer - Futterhafer'.pHarvestLeft 0.3
'Sommerhafer - Futterhafer'.hnv 1.1
'Sommergerste - Braugerste'.rotBreak 2
'Sommergerste - Braugerste'.maxShare 33.33
'Sommergerste - Braugerste'.minSoilQuality 20

'Sommergerste - Braugerste'.duevYieldLvl 50
'Sommergerste - Braugerste'.nRequirement 140
'Sommergerste - Braugerste'.nMaxAddition 1
'Sommergerste - Braugerste'.nMinSubtraction 1.5

'Sommergerste - Braugerste'.pWithdraw 0.8
'Sommergerste - Braugerste'.pHarvestLeft 0.3
'Sommergerste - Braugerste'.hnv 0.7
'Wintertriticale - Futtertriticale'.rotBreak 2
'Wintertriticale - Futtertriticale'.maxShare 33.33
'Wintertriticale - Futtertriticale'.minSoilQuality 20

'Wintertriticale - Futtertriticale'.duevYieldLvl 70
'Wintertriticale - Futtertriticale'.nRequirement 190
'Wintertriticale - Futtertriticale'.nMaxAddition 1
'Wintertriticale - Futtertriticale'.nMinSubtraction 1.5

'Wintertriticale - Futtertriticale'.pWithdraw 0.8
'Wintertriticale - Futtertriticale'.pHarvestLeft 0.3
'Wintertriticale - Futtertriticale'.hnv 0.9
'Winterweizen - Brotweizen'.rotBreak 2
'Winterweizen - Brotweizen'.maxShare 33.33
'Winterweizen - Brotweizen'.minSoilQuality 20

'Winterweizen - Brotweizen'.duevYieldLvl 80
'Winterweizen - Brotweizen'.nRequirement 230
'Winterweizen - Brotweizen'.nMaxAddition 1
'Winterweizen - Brotweizen'.nMinSubtraction 1.5

'Winterweizen - Brotweizen'.pWithdraw 0.8
'Winterweizen - Brotweizen'.pHarvestLeft 0.3
'Winterweizen - Brotweizen'.hnv 0.8
'Zuckerrüben'.rotBreak 4
'Zuckerrüben'.maxShare 20
'Zuckerrüben'.minSoilQuality 20

'Zuckerrüben'.duevYieldLvl 650
'Zuckerrüben'.nRequirement 170
'Zuckerrüben'.nMaxAddition 0.1
'Zuckerrüben'.nMinSubtraction 0.15
'Zuckerrüben'.prevCropEff 10
'Zuckerrüben'.pWithdraw 0.1
'Zuckerrüben'.pHarvestLeft 0.11
'Zuckerrüben'.hnv 0.7
'Winterraps'.rotBreak 4
'Winterraps'.maxShare 20
'Winterraps'.minSoilQuality 20

'Winterraps'.duevYieldLvl 40
'Winterraps'.nRequirement 200
'Winterraps'.nMaxAddition 2
'Winterraps'.nMinSubtraction 3

'Winterraps'.pWithdraw 1.8
'Winterraps'.pHarvestLeft 0.4
'Winterraps'.hnv 1.7
'Wintergerste - Futtergerste'.rotBreak 2
'Wintergerste - Futtergerste'.maxShare 33.33
'Wintergerste - Futtergerste'.minSoilQuality 20

'Wintergerste - Futtergerste'.duevYieldLvl 70
'Wintergerste - Futtergerste'.nRequirement 180
'Wintergerste - Futtergerste'.nMaxAddition 1
'Wintergerste - Futtergerste'.nMinSubtraction 1.5

'Wintergerste - Futtergerste'.pWithdraw 0.8
'Wintergerste - Futtergerste'.pHarvestLeft 0.3
'Wintergerste - Futtergerste'.hnv 0.7
'Winterroggen - Mahl- und Brotroggen'.rotBreak 2
'Winterroggen - Mahl- und Brotroggen'.maxShare 33.33
'Winterroggen - Mahl- und Brotroggen'.minSoilQuality 20

'Winterroggen - Mahl- und Brotroggen'.duevYieldLvl 70
'Winterroggen - Mahl- und Brotroggen'.nRequirement 170
'Winterroggen - Mahl- und Brotroggen'.nMaxAddition 1
'Winterroggen - Mahl- und Brotroggen'.nMinSubtraction 1.5

'Winterroggen - Mahl- und Brotroggen'.pWithdraw 0.8
'Winterroggen - Mahl- und Brotroggen'.pHarvestLeft 0.3
'Winterroggen - Mahl- und Brotroggen'.hnv 0.9
'Erbsen, Markerbsen'.rotBreak 5
'Erbsen, Markerbsen'.maxShare 16.67
'Erbsen, Markerbsen'.minSoilQuality 20
'Erbsen, Markerbsen'.efaFactor 1
'Erbsen, Markerbsen'.duevYieldLvl 250
'Erbsen, Markerbsen'.nRequirement 60


'Erbsen, Markerbsen'.prevCropEff 65
'Erbsen, Markerbsen'.pWithdraw 0.11


'Stärkekartoffeln'.rotBreak 3
'Stärkekartoffeln'.maxShare 25
'Stärkekartoffeln'.minSoilQuality 20

'Stärkekartoffeln'.duevYieldLvl 450
'Stärkekartoffeln'.nRequirement 180
'Stärkekartoffeln'.nMaxAddition 0.2
'Stärkekartoffeln'.nMinSubtraction 0.2

'Stärkekartoffeln'.pWithdraw 0.14
'Stärkekartoffeln'.pHarvestLeft 0.04
'Stärkekartoffeln'.hnv 0.2
/;

parameter p_avgYield(curCrops) /
 'Mais - Silomais' 431
 'Sommerhafer - Futterhafer' 45
 'Sommergerste - Braugerste' 64
 'Wintertriticale - Futtertriticale' 59
 'Winterweizen - Brotweizen' 79
 'Zuckerrüben' 671
 'Winterraps' 35
 'Wintergerste - Futtergerste' 69
 'Winterroggen - Mahl- und Brotroggen' 58
 'Erbsen, Markerbsen' 50
 'Stärkekartoffeln' 496
/;

parameter p_nmin(curCrops,soilTypes,cropType) /

/;

set crops_rootCrop(curCrops) /
 'Zuckerrüben' YES
 'Stärkekartoffeln' YES
/;

set crops_catchCrop(curCrops) /
 'Sommerhafer - Futterhafer' YES
 'Sommergerste - Braugerste' YES
 'Wintertriticale - Futtertriticale' YES
 'Winterweizen - Brotweizen' YES
 'Winterraps' YES
 'Wintergerste - Futtergerste' YES
 'Winterroggen - Mahl- und Brotroggen' YES
 'Erbsen, Markerbsen' YES
 'Stärkekartoffeln' YES
/;

set crops_summer(curCrops) /
 'Mais - Silomais' YES
 'Sommerhafer - Futterhafer' YES
 'Sommergerste - Braugerste' YES
 'Zuckerrüben' YES
 'Erbsen, Markerbsen' YES
 'Stärkekartoffeln' YES
/;

parameter p_croppingFactor(curCrops,curCrops) /
 'Mais - Silomais'.'Mais - Silomais' 7
 'Mais - Silomais'.'Sommerhafer - Futterhafer' 8
 'Mais - Silomais'.'Sommergerste - Braugerste' 10
 'Mais - Silomais'.'Wintertriticale - Futtertriticale' 6
 'Mais - Silomais'.'Winterweizen - Brotweizen' 8
 'Mais - Silomais'.'Zuckerrüben' 4
 'Mais - Silomais'.'Winterraps' 4
 'Mais - Silomais'.'Wintergerste - Futtergerste' 6
 'Mais - Silomais'.'Winterroggen - Mahl- und Brotroggen' 6
 'Mais - Silomais'.'Erbsen, Markerbsen' 10
 'Mais - Silomais'.'Stärkekartoffeln' 10
 'Sommerhafer - Futterhafer'.'Mais - Silomais' 10
 'Sommerhafer - Futterhafer'.'Sommerhafer - Futterhafer' 2
 'Sommerhafer - Futterhafer'.'Sommergerste - Braugerste' 6
 'Sommerhafer - Futterhafer'.'Wintertriticale - Futtertriticale' 8
 'Sommerhafer - Futterhafer'.'Winterweizen - Brotweizen' 8
 'Sommerhafer - Futterhafer'.'Zuckerrüben' 10
 'Sommerhafer - Futterhafer'.'Winterraps' 8
 'Sommerhafer - Futterhafer'.'Wintergerste - Futtergerste' 8
 'Sommerhafer - Futterhafer'.'Winterroggen - Mahl- und Brotroggen' 8
 'Sommerhafer - Futterhafer'.'Erbsen, Markerbsen' 10
 'Sommerhafer - Futterhafer'.'Stärkekartoffeln' 10
 'Sommergerste - Braugerste'.'Mais - Silomais' 10
 'Sommergerste - Braugerste'.'Sommerhafer - Futterhafer' 8
 'Sommergerste - Braugerste'.'Sommergerste - Braugerste' 4
 'Sommergerste - Braugerste'.'Wintertriticale - Futtertriticale' 6
 'Sommergerste - Braugerste'.'Winterweizen - Brotweizen' 4
 'Sommergerste - Braugerste'.'Zuckerrüben' 10
 'Sommergerste - Braugerste'.'Winterraps' 10
 'Sommergerste - Braugerste'.'Wintergerste - Futtergerste' 6
 'Sommergerste - Braugerste'.'Winterroggen - Mahl- und Brotroggen' 6
 'Sommergerste - Braugerste'.'Erbsen, Markerbsen' 10
 'Sommergerste - Braugerste'.'Stärkekartoffeln' 10
 'Wintertriticale - Futtertriticale'.'Mais - Silomais' 10
 'Wintertriticale - Futtertriticale'.'Sommerhafer - Futterhafer' 8
 'Wintertriticale - Futtertriticale'.'Sommergerste - Braugerste' 8
 'Wintertriticale - Futtertriticale'.'Wintertriticale - Futtertriticale' 4
 'Wintertriticale - Futtertriticale'.'Winterweizen - Brotweizen' 4
 'Wintertriticale - Futtertriticale'.'Zuckerrüben' 10
 'Wintertriticale - Futtertriticale'.'Winterraps' 8
 'Wintertriticale - Futtertriticale'.'Wintergerste - Futtergerste' 6
 'Wintertriticale - Futtertriticale'.'Winterroggen - Mahl- und Brotroggen' 6
 'Wintertriticale - Futtertriticale'.'Erbsen, Markerbsen' 10
 'Wintertriticale - Futtertriticale'.'Stärkekartoffeln' 10
 'Winterweizen - Brotweizen'.'Mais - Silomais' 10
 'Winterweizen - Brotweizen'.'Sommerhafer - Futterhafer' 8
 'Winterweizen - Brotweizen'.'Sommergerste - Braugerste' 6
 'Winterweizen - Brotweizen'.'Wintertriticale - Futtertriticale' 6
 'Winterweizen - Brotweizen'.'Winterweizen - Brotweizen' 4
 'Winterweizen - Brotweizen'.'Zuckerrüben' 10
 'Winterweizen - Brotweizen'.'Winterraps' 10
 'Winterweizen - Brotweizen'.'Wintergerste - Futtergerste' 6
 'Winterweizen - Brotweizen'.'Winterroggen - Mahl- und Brotroggen' 6
 'Winterweizen - Brotweizen'.'Erbsen, Markerbsen' 10
 'Winterweizen - Brotweizen'.'Stärkekartoffeln' 10
 'Zuckerrüben'.'Mais - Silomais' 8
 'Zuckerrüben'.'Sommerhafer - Futterhafer' 10
 'Zuckerrüben'.'Sommergerste - Braugerste' 10
 'Zuckerrüben'.'Wintertriticale - Futtertriticale' 4
 'Zuckerrüben'.'Winterweizen - Brotweizen' 8
 'Zuckerrüben'.'Zuckerrüben' 2
 'Zuckerrüben'.'Winterraps' 4
 'Zuckerrüben'.'Wintergerste - Futtergerste' 4
 'Zuckerrüben'.'Winterroggen - Mahl- und Brotroggen' 4
 'Zuckerrüben'.'Erbsen, Markerbsen' 6
 'Zuckerrüben'.'Stärkekartoffeln' 8
 'Winterraps'.'Mais - Silomais' 10
 'Winterraps'.'Sommerhafer - Futterhafer' 6
 'Winterraps'.'Sommergerste - Braugerste' 6
 'Winterraps'.'Wintertriticale - Futtertriticale' 8
 'Winterraps'.'Winterweizen - Brotweizen' 10
 'Winterraps'.'Zuckerrüben' 4
 'Winterraps'.'Winterraps' 4
 'Winterraps'.'Wintergerste - Futtergerste' 8
 'Winterraps'.'Winterroggen - Mahl- und Brotroggen' 8
 'Winterraps'.'Erbsen, Markerbsen' 4
 'Winterraps'.'Stärkekartoffeln' 8
 'Wintergerste - Futtergerste'.'Mais - Silomais' 10
 'Wintergerste - Futtergerste'.'Sommerhafer - Futterhafer' 8
 'Wintergerste - Futtergerste'.'Sommergerste - Braugerste' 6
 'Wintergerste - Futtergerste'.'Wintertriticale - Futtertriticale' 6
 'Wintergerste - Futtergerste'.'Winterweizen - Brotweizen' 4
 'Wintergerste - Futtergerste'.'Zuckerrüben' 10
 'Wintergerste - Futtergerste'.'Winterraps' 10
 'Wintergerste - Futtergerste'.'Wintergerste - Futtergerste' 4
 'Wintergerste - Futtergerste'.'Winterroggen - Mahl- und Brotroggen' 6
 'Wintergerste - Futtergerste'.'Erbsen, Markerbsen' 10
 'Wintergerste - Futtergerste'.'Stärkekartoffeln' 10
 'Winterroggen - Mahl- und Brotroggen'.'Mais - Silomais' 10
 'Winterroggen - Mahl- und Brotroggen'.'Sommerhafer - Futterhafer' 8
 'Winterroggen - Mahl- und Brotroggen'.'Sommergerste - Braugerste' 8
 'Winterroggen - Mahl- und Brotroggen'.'Wintertriticale - Futtertriticale' 6
 'Winterroggen - Mahl- und Brotroggen'.'Winterweizen - Brotweizen' 6
 'Winterroggen - Mahl- und Brotroggen'.'Zuckerrüben' 10
 'Winterroggen - Mahl- und Brotroggen'.'Winterraps' 10
 'Winterroggen - Mahl- und Brotroggen'.'Wintergerste - Futtergerste' 8
 'Winterroggen - Mahl- und Brotroggen'.'Winterroggen - Mahl- und Brotroggen' 4
 'Winterroggen - Mahl- und Brotroggen'.'Erbsen, Markerbsen' 10
 'Winterroggen - Mahl- und Brotroggen'.'Stärkekartoffeln' 10
 'Erbsen, Markerbsen'.'Mais - Silomais' 10
 'Erbsen, Markerbsen'.'Sommerhafer - Futterhafer' 4
 'Erbsen, Markerbsen'.'Sommergerste - Braugerste' 6
 'Erbsen, Markerbsen'.'Wintertriticale - Futtertriticale' 10
 'Erbsen, Markerbsen'.'Winterweizen - Brotweizen' 10
 'Erbsen, Markerbsen'.'Zuckerrüben' 6
 'Erbsen, Markerbsen'.'Winterraps' 6
 'Erbsen, Markerbsen'.'Wintergerste - Futtergerste' 10
 'Erbsen, Markerbsen'.'Winterroggen - Mahl- und Brotroggen' 10
 'Erbsen, Markerbsen'.'Erbsen, Markerbsen' 2
 'Erbsen, Markerbsen'.'Stärkekartoffeln' 10
 'Stärkekartoffeln'.'Mais - Silomais' 8
 'Stärkekartoffeln'.'Sommerhafer - Futterhafer' 10
 'Stärkekartoffeln'.'Sommergerste - Braugerste' 6
 'Stärkekartoffeln'.'Wintertriticale - Futtertriticale' 10
 'Stärkekartoffeln'.'Winterweizen - Brotweizen' 10
 'Stärkekartoffeln'.'Zuckerrüben' 10
 'Stärkekartoffeln'.'Winterraps' 10
 'Stärkekartoffeln'.'Wintergerste - Futtergerste' 8
 'Stärkekartoffeln'.'Winterroggen - Mahl- und Brotroggen' 8
 'Stärkekartoffeln'.'Erbsen, Markerbsen' 8
 'Stärkekartoffeln'.'Stärkekartoffeln' 2
/;

set plots_years_crops(plots,years,crops) /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.2016.'Silomais (als Hauptfutter)' 'YES'
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.2017.'Silomais (als Hauptfutter)' 'YES'
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.2018.'Silomais (als Hauptfutter)' 'YES'
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.2019.'' 'YES'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.2016.'Winterweichweizen' 'YES'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.2017.'Silomais (als Hauptfutter)' 'YES'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.2018.'Wintergerste' 'YES'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.2019.'' 'YES'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.2016.'Wintergerste' 'YES'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.2017.'Silomais (als Hauptfutter)' 'YES'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.2018.'Silomais (als Hauptfutter)' 'YES'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.2019.'' 'YES'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.2016.'Wintergerste' 'YES'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.2017.'Zuckerrüben' 'YES'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.2018.'Kartoffeln' 'YES'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.2019.'' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.2016.'Kartoffeln' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.2017.'Wintergerste' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.2018.'Zuckerrüben' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.2019.'' 'YES'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.2016.'Winterweichweizen' 'YES'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.2017.'Silomais (als Hauptfutter)' 'YES'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.2018.'Winterweichweizen' 'YES'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.2019.'' 'YES'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.2016.'Kartoffeln' 'YES'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.2017.'Winterweichweizen' 'YES'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.2018.'Silomais (als Hauptfutter)' 'YES'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.2019.'' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.2016.'Wintergerste' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.2017.'Winterweichweizen' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.2018.'Zuckerrüben' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.2019.'' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.2016.'Silomais (als Hauptfutter)' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.2017.'Zuckerrüben' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.2018.'Kartoffeln' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.2019.'' 'YES'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.2016.'Winterweichweizen' 'YES'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.2017.'Silomais (als Hauptfutter)' 'YES'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.2018.'Wintergerste' 'YES'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.2019.'' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.2016.'Kartoffeln' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.2017.'Silomais (als Hauptfutter)' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.2018.'Zuckerrüben' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.2019.'' 'YES'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.2016.'Wintergerste' 'YES'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.2017.'Winterweichweizen' 'YES'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.2018.'Silomais (als Hauptfutter)' 'YES'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.2019.'' 'YES'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.2016.'Wintergerste' 'YES'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.2017.'Silomais (als Hauptfutter)' 'YES'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.2018.'Wintergerste' 'YES'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.2019.'' 'YES'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.2016.'Kartoffeln' 'YES'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.2017.'Silomais (als Hauptfutter)' 'YES'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.2018.'Silomais (als Hauptfutter)' 'YES'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.2019.'' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.2016.'Silomais (als Hauptfutter)' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.2017.'Silomais (als Hauptfutter)' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.2018.'Winterweichweizen' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.2019.'' 'YES'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.2016.'Silomais (als Hauptfutter)' 'YES'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.2017.'Wintergerste' 'YES'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.2018.'Zuckerrüben' 'YES'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.2019.'' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.2016.'Silomais (als Hauptfutter)' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.2017.'Silomais (als Hauptfutter)' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.2018.'Silomais (als Hauptfutter)' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.2019.'' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.2016.'Silomais (als Hauptfutter)' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.2017.'Winterweichweizen' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.2018.'Silomais (als Hauptfutter)' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.2019.'' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.2016.'Silomais (als Hauptfutter)' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.2017.'Zuckerrüben' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.2018.'Winterweichweizen' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.2019.'' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.2016.'Silomais (als Hauptfutter)' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.2017.'Winterweichweizen' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.2018.'Wintergerste' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.2019.'' 'YES'
/;

set plots_years_cropGroup(plots,years,cropGroup) /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.2016.'Gattung: Zea (Mais)' 'YES'
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.2017.'Gattung: Zea (Mais)' 'YES'
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.2018.'Gattung: Zea (Mais)' 'YES'
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.2019.'' 'YES'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.2016.'Winterweizen' 'YES'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.2017.'Gattung: Zea (Mais)' 'YES'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.2018.'Wintergerste' 'YES'
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.2019.'' 'YES'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.2016.'Wintergerste' 'YES'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.2017.'Gattung: Zea (Mais)' 'YES'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.2018.'Gattung: Zea (Mais)' 'YES'
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.2019.'' 'YES'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.2016.'Wintergerste' 'YES'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.2017.'Gattung: Beta (Rüben)' 'YES'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '2d64e2d8-1909-4abf-9c42-71041141645a'.2019.'' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.2017.'Wintergerste' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.2018.'Gattung: Beta (Rüben)' 'YES'
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.2019.'' 'YES'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.2016.'Winterweizen' 'YES'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.2017.'Gattung: Zea (Mais)' 'YES'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.2018.'Winterweizen' 'YES'
 '558f9729-9f85-4837-ad21-033762c4ba5d'.2019.'' 'YES'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.2017.'Winterweizen' 'YES'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.2018.'Gattung: Zea (Mais)' 'YES'
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.2019.'' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.2016.'Wintergerste' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.2017.'Winterweizen' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.2018.'Gattung: Beta (Rüben)' 'YES'
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.2019.'' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.2016.'Gattung: Zea (Mais)' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.2017.'Gattung: Beta (Rüben)' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.2019.'' 'YES'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.2016.'Winterweizen' 'YES'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.2017.'Gattung: Zea (Mais)' 'YES'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.2018.'Wintergerste' 'YES'
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.2019.'' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.2017.'Gattung: Zea (Mais)' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.2018.'Gattung: Beta (Rüben)' 'YES'
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.2019.'' 'YES'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.2016.'Wintergerste' 'YES'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.2017.'Winterweizen' 'YES'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.2018.'Gattung: Zea (Mais)' 'YES'
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.2019.'' 'YES'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.2016.'Wintergerste' 'YES'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.2017.'Gattung: Zea (Mais)' 'YES'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.2018.'Wintergerste' 'YES'
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.2019.'' 'YES'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.2017.'Gattung: Zea (Mais)' 'YES'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.2018.'Gattung: Zea (Mais)' 'YES'
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.2019.'' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.2016.'Gattung: Zea (Mais)' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.2017.'Gattung: Zea (Mais)' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.2018.'Winterweizen' 'YES'
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.2019.'' 'YES'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.2016.'Gattung: Zea (Mais)' 'YES'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.2017.'Wintergerste' 'YES'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.2018.'Gattung: Beta (Rüben)' 'YES'
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.2019.'' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.2016.'Gattung: Zea (Mais)' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.2017.'Gattung: Zea (Mais)' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.2018.'Gattung: Zea (Mais)' 'YES'
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.2019.'' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.2016.'Gattung: Zea (Mais)' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.2017.'Winterweizen' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.2018.'Gattung: Zea (Mais)' 'YES'
 'cc74cf23-840a-4016-a5b6-144b4d228489'.2019.'' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.2016.'Gattung: Zea (Mais)' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.2017.'Gattung: Beta (Rüben)' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.2018.'Winterweizen' 'YES'
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.2019.'' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.2016.'Gattung: Zea (Mais)' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.2017.'Winterweizen' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.2018.'Wintergerste' 'YES'
 'dc298ebb-1b27-411a-8024-af0623f621c5'.2019.'' 'YES'
/;

set data_attr /
nSum
pSum
minNAmount
minPAmount
grossMarginHa
/;

parameter p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,data_attr) /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'0'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'0'.'0'.'minNAmount' 467
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 732
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 55
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 204
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -434
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 94
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 348
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -571
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 467
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -628
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 181
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 670
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 429
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'0'.'0'.'nSum' 112
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'0'.'0'.'minNAmount' 415
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 148
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'0'.'0'.'nSum' 148
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'0'.'0'.'pSum' 63
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'0'.'0'.'minNAmount' 548
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'0'.'0'.'grossMarginHa' -768
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 141
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 522
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 73
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 118
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 437
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -580
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1215
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'0'.'0'.'nSum' 128
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 474
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2559
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'5'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'5'.'0'.'minNAmount' 397
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 768
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 55
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 134
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -398
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 94
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 279
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -536
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 397
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -592
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 181
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 601
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 464
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'5'.'0'.'nSum' 112
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'5'.'0'.'minNAmount' 345
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 183
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'5'.'0'.'nSum' 148
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'5'.'0'.'pSum' 63
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'5'.'0'.'minNAmount' 479
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'5'.'0'.'grossMarginHa' -733
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 141
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 453
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 109
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 118
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 368
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -544
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1211
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'5'.'0'.'nSum' 128
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 405
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2595
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'7'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'7'.'0'.'minNAmount' 370
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 783
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 55
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 107
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -383
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 94
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 251
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -521
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 370
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -577
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 181
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 573
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 479
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'7'.'0'.'nSum' 112
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'7'.'0'.'minNAmount' 318
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 198
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'7'.'0'.'nSum' 148
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'7'.'0'.'pSum' 63
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'7'.'0'.'minNAmount' 451
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'7'.'0'.'grossMarginHa' -718
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 141
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 425
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 124
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 118
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 340
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -529
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1213
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'7'.'0'.'nSum' 128
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 377
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2610
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'12'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'12'.'0'.'minNAmount' 300
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 821
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 55
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 37
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -345
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 94
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 182
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -483
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 300
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -539
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 181
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 504
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 517
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'12'.'0'.'nSum' 112
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'12'.'0'.'minNAmount' 248
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 236
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'12'.'0'.'nSum' 148
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'12'.'0'.'pSum' 63
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'12'.'0'.'minNAmount' 382
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'12'.'0'.'grossMarginHa' -680
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 141
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 356
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 162
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 118
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 271
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -492
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1218
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'12'.'0'.'nSum' 128
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 308
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2647
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'15'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'15'.'0'.'minNAmount' 259
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 843
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 55
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -335
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 94
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 140
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -461
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 259
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -517
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 181
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 462
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 540
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'15'.'0'.'nSum' 112
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'15'.'0'.'minNAmount' 207
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 258
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'15'.'0'.'nSum' 148
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'15'.'0'.'pSum' 63
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'15'.'0'.'minNAmount' 340
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'15'.'0'.'grossMarginHa' -658
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 141
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 314
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 184
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 118
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 229
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -469
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1221
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'15'.'0'.'nSum' 128
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 266
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2670
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'20'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'20'.'0'.'minNAmount' 189
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 881
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 55
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -341
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 94
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 71
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -435
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 189
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -498
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 181
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 393
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 577
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'20'.'0'.'nSum' 112
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'20'.'0'.'minNAmount' 137
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 295
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'20'.'0'.'nSum' 148
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'20'.'0'.'pSum' 63
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'20'.'0'.'minNAmount' 271
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'20'.'0'.'grossMarginHa' -621
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 141
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 245
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 217
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 118
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 160
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -452
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1227
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'20'.'0'.'nSum' 128
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 197
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2707
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'25'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'25'.'0'.'minNAmount' 120
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 912
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 55
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -346
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 94
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 1
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -424
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 120
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -488
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 181
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 324
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 598
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'25'.'0'.'nSum' 112
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'25'.'0'.'minNAmount' 68
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 324
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'25'.'0'.'nSum' 148
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'25'.'0'.'pSum' 63
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'25'.'0'.'minNAmount' 201
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'25'.'0'.'grossMarginHa' -599
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 141
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 176
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 228
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 118
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 90
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -441
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1233
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'25'.'0'.'nSum' 128
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 127
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2740
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'30'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'30'.'0'.'minNAmount' 51
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 923
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 55
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -352
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 94
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -428
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 126
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 51
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -478
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 181
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 254
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 608
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'30'.'0'.'nSum' 112
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 335
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'30'.'0'.'nSum' 148
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'30'.'0'.'pSum' 63
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'30'.'0'.'minNAmount' 132
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterraps'.'30'.'0'.'grossMarginHa' -589
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 141
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 106
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 238
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 118
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 21
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -431
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1239
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'30'.'0'.'nSum' 128
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 58
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2750
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'0'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'0'.'0'.'minNAmount' 541
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1063
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 75
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 278
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -477
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 114
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 422
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -615
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 541
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -671
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 201
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 744
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' -38
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'0'.'0'.'nSum' 132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'0'.'0'.'minNAmount' 489
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 1311
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'0'.'0'.'nSum' 168
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'0'.'0'.'pSum' 63
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'0'.'0'.'minNAmount' 622
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'0'.'0'.'grossMarginHa' -812
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 607
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' -132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 138
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 511
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -624
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 20
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 74
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1255
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'0'.'0'.'nSum' 148
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 548
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2936
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'5'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'5'.'0'.'minNAmount' 471
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1097
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 75
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 208
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -443
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 114
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 353
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -582
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 471
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -638
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 201
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 675
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' -5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'5'.'0'.'nSum' 132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'5'.'0'.'minNAmount' 420
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 1345
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'5'.'0'.'nSum' 168
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'5'.'0'.'pSum' 63
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'5'.'0'.'minNAmount' 553
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'5'.'0'.'grossMarginHa' -778
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 538
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' -99
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 138
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 442
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -590
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 20
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1237
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'5'.'0'.'nSum' 148
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 479
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2970
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'7'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'7'.'0'.'minNAmount' 444
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1111
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 75
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 181
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -428
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 114
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 325
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -567
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 444
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -623
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 201
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 647
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 10
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'7'.'0'.'nSum' 132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'7'.'0'.'minNAmount' 392
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 1360
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'7'.'0'.'nSum' 168
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'7'.'0'.'pSum' 63
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'7'.'0'.'minNAmount' 525
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'7'.'0'.'grossMarginHa' -763
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 510
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' -84
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 138
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 414
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -575
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 20
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1237
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'7'.'0'.'nSum' 148
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 451
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2984
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'12'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'12'.'0'.'minNAmount' 374
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1149
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 75
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 111
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -391
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 114
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 256
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -530
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 374
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -586
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 201
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 578
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 46
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'12'.'0'.'nSum' 132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'12'.'0'.'minNAmount' 322
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 1397
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'12'.'0'.'nSum' 168
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'12'.'0'.'pSum' 63
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'12'.'0'.'minNAmount' 456
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'12'.'0'.'grossMarginHa' -727
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 441
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' -47
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 138
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 345
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -539
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 20
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1243
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'12'.'0'.'nSum' 148
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 382
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 3021
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'15'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'15'.'0'.'minNAmount' 333
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1171
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 75
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 70
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -382
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 114
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 214
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -508
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 333
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -564
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 201
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 536
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 68
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'15'.'0'.'nSum' 132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'15'.'0'.'minNAmount' 281
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 1418
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'15'.'0'.'nSum' 168
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'15'.'0'.'pSum' 63
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'15'.'0'.'minNAmount' 414
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'15'.'0'.'grossMarginHa' -705
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 399
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' -25
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 138
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 303
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -516
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 20
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1247
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'15'.'0'.'nSum' 148
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 340
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 3043
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'20'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'20'.'0'.'minNAmount' 263
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1207
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 75
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -371
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 114
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 145
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -483
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 263
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -546
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 201
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 467
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 105
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'20'.'0'.'nSum' 132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'20'.'0'.'minNAmount' 212
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 1455
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'20'.'0'.'nSum' 168
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'20'.'0'.'pSum' 63
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'20'.'0'.'minNAmount' 345
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'20'.'0'.'grossMarginHa' -668
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 330
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 7
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 138
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 234
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -500
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 20
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1253
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'20'.'0'.'nSum' 148
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 271
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 3080
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'25'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'25'.'0'.'minNAmount' 194
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1238
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 75
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -377
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 114
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 76
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -473
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 194
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -537
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 201
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 398
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 125
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'25'.'0'.'nSum' 132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'25'.'0'.'minNAmount' 142
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 1483
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'25'.'0'.'nSum' 168
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'25'.'0'.'pSum' 63
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'25'.'0'.'minNAmount' 276
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'25'.'0'.'grossMarginHa' -648
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 261
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 17
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 138
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -490
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 20
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1260
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'25'.'0'.'nSum' 148
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 201
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 3112
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'30'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'30'.'0'.'minNAmount' 125
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1248
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 75
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -384
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 114
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 6
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -464
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 146
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 125
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -528
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 201
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 328
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 135
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'30'.'0'.'nSum' 132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'30'.'0'.'minNAmount' 73
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 1492
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'30'.'0'.'nSum' 168
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'30'.'0'.'pSum' 63
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'30'.'0'.'minNAmount' 206
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterraps'.'30'.'0'.'grossMarginHa' -638
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 164
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 191
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 26
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 138
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 95
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -481
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 20
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1266
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'30'.'0'.'nSum' 148
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 132
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '119f0d98-ec65-4752-802f-3cb0ca4d205f'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 3122
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'0'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'0'.'0'.'minNAmount' 467
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 706
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 55
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 204
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -471
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 94
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 348
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -608
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 467
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -665
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 181
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 670
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 382
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'0'.'0'.'nSum' 112
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'0'.'0'.'minNAmount' 415
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 164
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'0'.'0'.'nSum' 148
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'0'.'0'.'pSum' 63
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'0'.'0'.'minNAmount' 548
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'0'.'0'.'grossMarginHa' -806
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 141
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 522
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 32
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 118
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 437
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -617
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1248
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'0'.'0'.'nSum' 128
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 474
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2580
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'5'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'5'.'0'.'minNAmount' 397
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 740
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 55
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 134
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -436
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 94
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 279
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -574
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 397
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -631
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 181
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 601
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 416
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'5'.'0'.'nSum' 112
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'5'.'0'.'minNAmount' 345
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 198
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'5'.'0'.'nSum' 148
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'5'.'0'.'pSum' 63
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'5'.'0'.'minNAmount' 479
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'5'.'0'.'grossMarginHa' -772
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 141
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 453
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 66
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 118
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 368
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -583
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1245
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'5'.'0'.'nSum' 128
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 405
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2614
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'7'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'7'.'0'.'minNAmount' 370
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 755
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 55
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 107
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -422
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 94
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 251
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -559
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 370
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -616
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 181
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 573
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 431
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'7'.'0'.'nSum' 112
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'7'.'0'.'minNAmount' 318
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 213
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'7'.'0'.'nSum' 148
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'7'.'0'.'pSum' 63
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'7'.'0'.'minNAmount' 451
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'7'.'0'.'grossMarginHa' -757
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 141
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 425
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 81
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 118
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 340
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -568
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1247
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'7'.'0'.'nSum' 128
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 377
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2630
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'12'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'12'.'0'.'minNAmount' 300
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 793
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 55
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 37
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -384
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 94
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 182
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -521
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 300
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -578
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 181
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 504
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 469
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'12'.'0'.'nSum' 112
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'12'.'0'.'minNAmount' 248
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 251
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'12'.'0'.'nSum' 148
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'12'.'0'.'pSum' 63
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'12'.'0'.'minNAmount' 382
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'12'.'0'.'grossMarginHa' -719
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 141
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 356
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 118
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 118
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 271
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -530
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1252
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'12'.'0'.'nSum' 128
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 308
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2667
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'15'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'15'.'0'.'minNAmount' 259
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 815
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 55
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -373
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 94
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 140
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -499
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 259
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -556
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 181
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 462
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 491
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'15'.'0'.'nSum' 112
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'15'.'0'.'minNAmount' 207
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 273
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'15'.'0'.'nSum' 148
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'15'.'0'.'pSum' 63
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'15'.'0'.'minNAmount' 340
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'15'.'0'.'grossMarginHa' -697
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 141
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 314
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 141
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 118
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 229
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -508
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1255
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'15'.'0'.'nSum' 128
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 266
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2690
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'20'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'20'.'0'.'minNAmount' 189
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 853
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 55
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -378
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 94
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 71
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -473
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 189
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -537
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 181
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 393
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 529
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'20'.'0'.'nSum' 112
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'20'.'0'.'minNAmount' 137
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 311
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'20'.'0'.'nSum' 148
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'20'.'0'.'pSum' 63
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'20'.'0'.'minNAmount' 271
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'20'.'0'.'grossMarginHa' -660
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 141
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 245
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 175
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 118
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 160
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -490
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1261
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'20'.'0'.'nSum' 128
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 197
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2727
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'25'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'25'.'0'.'minNAmount' 120
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 885
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 55
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -384
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 94
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 1
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -462
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 120
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -526
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 181
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 324
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 550
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'25'.'0'.'nSum' 112
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'25'.'0'.'minNAmount' 68
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 339
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'25'.'0'.'nSum' 148
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'25'.'0'.'pSum' 63
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'25'.'0'.'minNAmount' 201
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'25'.'0'.'grossMarginHa' -638
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 141
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 176
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 185
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 118
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 90
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -480
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1266
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'25'.'0'.'nSum' 128
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 127
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2760
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'30'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'30'.'0'.'minNAmount' 51
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 895
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 55
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -390
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 94
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -466
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 126
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 51
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -516
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 181
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 254
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 560
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'30'.'0'.'nSum' 112
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 351
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'30'.'0'.'nSum' 148
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'30'.'0'.'pSum' 63
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'30'.'0'.'minNAmount' 132
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterraps'.'30'.'0'.'grossMarginHa' -628
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 141
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 106
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 195
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 118
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 21
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -470
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1272
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'30'.'0'.'nSum' 128
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 58
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2770
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'0'.'0'.'nSum' 106
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'0'.'0'.'minNAmount' 393
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1247
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 49
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 181
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -408
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 86
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 319
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -544
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 108
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 400
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -591
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 155
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 574
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 738
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'0'.'0'.'nSum' 98
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'0'.'0'.'minNAmount' 363
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 1529
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'0'.'0'.'nSum' 128
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'0'.'0'.'pSum' 63
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'0'.'0'.'minNAmount' 474
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'0'.'0'.'grossMarginHa' -731
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 125
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 463
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 353
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 104
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 385
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -547
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 8
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 30
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1208
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'0'.'0'.'nSum' 112
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 415
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' -118
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'5'.'0'.'nSum' 106
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'5'.'0'.'minNAmount' 323
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1285
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 49
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 112
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -371
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 86
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 249
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -506
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 108
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 331
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -554
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 155
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 505
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 776
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'5'.'0'.'nSum' 98
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'5'.'0'.'minNAmount' 294
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 1566
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'5'.'0'.'nSum' 128
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'5'.'0'.'pSum' 63
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'5'.'0'.'minNAmount' 405
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'5'.'0'.'grossMarginHa' -693
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 125
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 394
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 391
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 104
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 316
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -509
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 8
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1193
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'5'.'0'.'nSum' 112
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 345
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' -80
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'7'.'0'.'nSum' 106
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'7'.'0'.'minNAmount' 296
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1301
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 49
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 84
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -355
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 86
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 221
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -490
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 108
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 303
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -538
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 155
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 477
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 792
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'7'.'0'.'nSum' 98
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'7'.'0'.'minNAmount' 266
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 1582
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'7'.'0'.'nSum' 128
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'7'.'0'.'pSum' 63
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'7'.'0'.'minNAmount' 377
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'7'.'0'.'grossMarginHa' -677
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 125
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 366
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 406
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 104
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 288
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -494
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 8
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1194
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'7'.'0'.'nSum' 112
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 318
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' -64
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'12'.'0'.'nSum' 106
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'12'.'0'.'minNAmount' 226
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1340
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 49
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 15
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -316
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 86
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 152
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -451
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 108
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 234
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -498
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 155
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 408
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 831
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'12'.'0'.'nSum' 98
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'12'.'0'.'minNAmount' 197
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 1622
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'12'.'0'.'nSum' 128
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'12'.'0'.'pSum' 63
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'12'.'0'.'minNAmount' 308
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'12'.'0'.'grossMarginHa' -638
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 125
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 297
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 446
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 104
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 219
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -454
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 8
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1197
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'12'.'0'.'nSum' 112
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 248
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' -25
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'15'.'0'.'nSum' 106
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'15'.'0'.'minNAmount' 185
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1364
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 49
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -309
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 86
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 111
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -428
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 108
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 192
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -475
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 155
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 366
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 855
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'15'.'0'.'nSum' 98
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'15'.'0'.'minNAmount' 155
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 1645
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'15'.'0'.'nSum' 128
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'15'.'0'.'pSum' 63
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'15'.'0'.'minNAmount' 266
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'15'.'0'.'grossMarginHa' -615
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 125
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 255
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 469
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 104
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 177
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -431
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 8
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1200
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'15'.'0'.'nSum' 112
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 207
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' -1
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'20'.'0'.'nSum' 106
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'20'.'0'.'minNAmount' 115
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1403
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 49
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -313
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 86
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 41
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -400
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 108
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 123
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -455
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 155
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 297
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 893
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'20'.'0'.'nSum' 98
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'20'.'0'.'minNAmount' 86
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 1684
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'20'.'0'.'nSum' 128
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'20'.'0'.'pSum' 63
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'20'.'0'.'minNAmount' 197
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'20'.'0'.'grossMarginHa' -576
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 125
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 186
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 504
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 104
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 108
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -412
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 8
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1203
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'20'.'0'.'nSum' 112
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 137
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 38
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'25'.'0'.'nSum' 106
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'25'.'0'.'minNAmount' 46
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1436
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 49
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -317
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 86
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -393
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 108
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 53
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -442
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 155
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 227
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 917
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'25'.'0'.'nSum' 98
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'25'.'0'.'minNAmount' 16
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 1714
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'25'.'0'.'nSum' 128
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'25'.'0'.'pSum' 63
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'25'.'0'.'minNAmount' 127
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'25'.'0'.'grossMarginHa' -553
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 125
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 116
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 517
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 104
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 39
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -400
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 8
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1207
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'25'.'0'.'nSum' 112
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 68
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 72
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'30'.'0'.'nSum' 106
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1444
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 49
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -321
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 86
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -397
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 108
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -432
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 155
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 158
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 929
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'30'.'0'.'nSum' 98
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 1716
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'30'.'0'.'nSum' 128
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'30'.'0'.'pSum' 63
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'30'.'0'.'minNAmount' 58
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterraps'.'30'.'0'.'grossMarginHa' -541
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 125
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 47
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 529
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 104
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -393
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 8
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1211
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'30'.'0'.'nSum' 112
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '2d64e2d8-1909-4abf-9c42-71041141645a'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 85
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'0'.'0'.'nSum' 96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'0'.'0'.'minNAmount' 356
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1168
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 39
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 144
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -415
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 281
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -551
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 98
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 363
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -598
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 145
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 537
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 537
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'0'.'0'.'nSum' 88
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'0'.'0'.'minNAmount' 326
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' -3
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'0'.'0'.'nSum' 118
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'0'.'0'.'pSum' 63
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'0'.'0'.'minNAmount' 437
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'0'.'0'.'grossMarginHa' -737
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 426
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' -36
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 94
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 348
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -554
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' -2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1212
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'0'.'0'.'nSum' 102
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 378
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2186
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'5'.'0'.'nSum' 96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'5'.'0'.'minNAmount' 286
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1205
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 39
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 75
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -378
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 212
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -514
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 98
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 294
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -561
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 145
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 468
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 574
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'5'.'0'.'nSum' 88
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'5'.'0'.'minNAmount' 257
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 34
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'5'.'0'.'nSum' 118
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'5'.'0'.'pSum' 63
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'5'.'0'.'minNAmount' 368
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'5'.'0'.'grossMarginHa' -700
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 357
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 94
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 279
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -517
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' -2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1206
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'5'.'0'.'nSum' 102
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 308
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2224
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'7'.'0'.'nSum' 96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'7'.'0'.'minNAmount' 258
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1221
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 39
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 47
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -362
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 184
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -498
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 98
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 266
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -545
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 145
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 440
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 590
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'7'.'0'.'nSum' 88
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'7'.'0'.'minNAmount' 229
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 50
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'7'.'0'.'nSum' 118
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'7'.'0'.'pSum' 63
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'7'.'0'.'minNAmount' 340
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'7'.'0'.'grossMarginHa' -684
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 329
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 17
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 94
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 251
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -501
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' -2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1207
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'7'.'0'.'nSum' 102
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 281
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2239
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'12'.'0'.'nSum' 96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'12'.'0'.'minNAmount' 189
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1260
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 39
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -327
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -459
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 98
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 197
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -506
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 145
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 371
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 629
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'12'.'0'.'nSum' 88
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'12'.'0'.'minNAmount' 160
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 89
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'12'.'0'.'nSum' 118
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'12'.'0'.'pSum' 63
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'12'.'0'.'minNAmount' 271
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'12'.'0'.'grossMarginHa' -645
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 260
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 56
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 94
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 182
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -462
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' -2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1210
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'12'.'0'.'nSum' 102
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 211
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2279
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'15'.'0'.'nSum' 96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'15'.'0'.'minNAmount' 148
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1284
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 39
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -325
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 73
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -435
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 98
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 155
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -483
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 145
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 329
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 653
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'15'.'0'.'nSum' 88
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'15'.'0'.'minNAmount' 118
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 112
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'15'.'0'.'nSum' 118
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'15'.'0'.'pSum' 63
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'15'.'0'.'minNAmount' 229
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'15'.'0'.'grossMarginHa' -622
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 218
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 79
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 94
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 140
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -438
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' -2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1212
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'15'.'0'.'nSum' 102
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 170
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2302
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'20'.'0'.'nSum' 96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'20'.'0'.'minNAmount' 78
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1323
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 39
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -329
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 4
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -407
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 98
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 86
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -462
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 145
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 260
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 691
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'20'.'0'.'nSum' 88
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'20'.'0'.'minNAmount' 49
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 151
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'20'.'0'.'nSum' 118
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'20'.'0'.'pSum' 63
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'20'.'0'.'minNAmount' 160
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'20'.'0'.'grossMarginHa' -583
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 149
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 94
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 71
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -419
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' -2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1216
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'20'.'0'.'nSum' 102
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 100
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2341
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'25'.'0'.'nSum' 96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'25'.'0'.'minNAmount' 9
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1356
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 39
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -333
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -409
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 98
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 16
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -450
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 145
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 190
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 715
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'25'.'0'.'nSum' 88
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'25'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 178
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'25'.'0'.'nSum' 118
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'25'.'0'.'pSum' 63
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'25'.'0'.'minNAmount' 90
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'25'.'0'.'grossMarginHa' -560
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 79
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 127
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 94
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -407
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' -2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1220
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'25'.'0'.'nSum' 102
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 31
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2375
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'30'.'0'.'nSum' 96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1356
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 39
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -337
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 76
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -413
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 98
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -449
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 145
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 121
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 727
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'30'.'0'.'nSum' 88
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 174
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'30'.'0'.'nSum' 118
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'30'.'0'.'pSum' 63
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'30'.'0'.'minNAmount' 21
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterraps'.'30'.'0'.'grossMarginHa' -548
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 115
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 10
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 139
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 94
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -409
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' -2
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1224
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'30'.'0'.'nSum' 102
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2380
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'0'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'0'.'0'.'minNAmount' 541
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1067
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 75
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 278
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -479
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 114
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 422
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -617
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 541
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -674
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 201
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 744
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' -42
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'0'.'0'.'nSum' 132
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'0'.'0'.'minNAmount' 489
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 1241
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'0'.'0'.'nSum' 168
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'0'.'0'.'pSum' 63
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'0'.'0'.'minNAmount' 622
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'0'.'0'.'grossMarginHa' -814
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 607
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 20
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 138
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 511
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -626
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 20
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 74
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1258
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'0'.'0'.'nSum' 148
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 548
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2821
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'5'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'5'.'0'.'minNAmount' 471
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1101
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 75
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 208
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -445
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 114
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 353
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -583
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 471
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -640
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 201
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 675
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' -8
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'5'.'0'.'nSum' 132
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'5'.'0'.'minNAmount' 420
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 1275
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'5'.'0'.'nSum' 168
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'5'.'0'.'pSum' 63
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'5'.'0'.'minNAmount' 553
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'5'.'0'.'grossMarginHa' -780
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 538
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 54
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 138
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 442
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -592
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 20
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1239
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'5'.'0'.'nSum' 148
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 479
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2855
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'7'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'7'.'0'.'minNAmount' 444
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1115
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 75
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 181
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -430
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 114
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 325
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -568
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 444
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -625
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 201
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 647
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 7
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'7'.'0'.'nSum' 132
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'7'.'0'.'minNAmount' 392
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 1289
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'7'.'0'.'nSum' 168
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'7'.'0'.'pSum' 63
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'7'.'0'.'minNAmount' 525
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'7'.'0'.'grossMarginHa' -766
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 510
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 69
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 138
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 414
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -577
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 20
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1239
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'7'.'0'.'nSum' 148
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 451
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2870
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'12'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'12'.'0'.'minNAmount' 374
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1153
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 75
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 111
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -393
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 114
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 256
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -531
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 374
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -588
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 201
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 578
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 44
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'12'.'0'.'nSum' 132
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'12'.'0'.'minNAmount' 322
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 1327
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'12'.'0'.'nSum' 168
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'12'.'0'.'pSum' 63
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'12'.'0'.'minNAmount' 456
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'12'.'0'.'grossMarginHa' -728
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 441
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 106
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 138
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 345
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -540
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 20
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1245
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'12'.'0'.'nSum' 148
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 382
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2907
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'15'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'15'.'0'.'minNAmount' 333
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1175
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 75
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 70
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -383
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 114
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 214
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -509
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 333
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -566
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 201
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 536
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 66
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'15'.'0'.'nSum' 132
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'15'.'0'.'minNAmount' 281
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 1349
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'15'.'0'.'nSum' 168
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'15'.'0'.'pSum' 63
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'15'.'0'.'minNAmount' 414
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'15'.'0'.'grossMarginHa' -706
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 399
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 128
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 138
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 303
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -518
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 20
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1248
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'15'.'0'.'nSum' 148
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 340
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2929
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'20'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'20'.'0'.'minNAmount' 263
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1212
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 75
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -372
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 114
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 145
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -484
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 263
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -547
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 201
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 467
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 103
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'20'.'0'.'nSum' 132
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'20'.'0'.'minNAmount' 212
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 1385
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'20'.'0'.'nSum' 168
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'20'.'0'.'pSum' 63
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'20'.'0'.'minNAmount' 345
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'20'.'0'.'grossMarginHa' -670
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 330
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 161
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 138
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 234
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -501
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 20
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1254
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'20'.'0'.'nSum' 148
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 271
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2966
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'25'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'25'.'0'.'minNAmount' 194
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1243
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 75
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -378
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 114
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 76
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -474
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 194
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -538
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 201
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 398
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 124
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'25'.'0'.'nSum' 132
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'25'.'0'.'minNAmount' 142
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 1414
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'25'.'0'.'nSum' 168
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'25'.'0'.'pSum' 63
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'25'.'0'.'minNAmount' 276
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'25'.'0'.'grossMarginHa' -649
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 261
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 171
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 138
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -491
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 20
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1261
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'25'.'0'.'nSum' 148
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 201
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2999
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'30'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'30'.'0'.'minNAmount' 125
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1253
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 75
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -384
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 114
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 6
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -464
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 146
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 125
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -528
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 201
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 328
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 134
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'30'.'0'.'nSum' 132
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'30'.'0'.'minNAmount' 73
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 1423
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'30'.'0'.'nSum' 168
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'30'.'0'.'pSum' 63
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'30'.'0'.'minNAmount' 206
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterraps'.'30'.'0'.'grossMarginHa' -639
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 164
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 191
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 181
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 138
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 95
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -482
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 20
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1267
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'30'.'0'.'nSum' 148
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 132
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '558f9729-9f85-4837-ad21-033762c4ba5d'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 3008
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'0'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'0'.'0'.'minNAmount' 541
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 698
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 75
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 278
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -465
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 114
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 422
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -603
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 541
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -659
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 201
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 744
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 393
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'0'.'0'.'nSum' 132
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'0'.'0'.'minNAmount' 489
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 134
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'0'.'0'.'nSum' 168
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'0'.'0'.'pSum' 63
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'0'.'0'.'minNAmount' 622
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'0'.'0'.'grossMarginHa' -800
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 161
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 596
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 40
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 138
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 511
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -611
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 20
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 74
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1246
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'0'.'0'.'nSum' 148
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 548
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2542
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'5'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'5'.'0'.'minNAmount' 471
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 733
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 75
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 208
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -430
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 114
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 353
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -568
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 471
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -624
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 201
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 675
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 428
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'5'.'0'.'nSum' 132
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'5'.'0'.'minNAmount' 420
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 169
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'5'.'0'.'nSum' 168
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'5'.'0'.'pSum' 63
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'5'.'0'.'minNAmount' 553
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'5'.'0'.'grossMarginHa' -765
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 161
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 527
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 75
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 138
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 442
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -576
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 20
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 5
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1226
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'5'.'0'.'nSum' 148
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 479
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2577
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'7'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'7'.'0'.'minNAmount' 444
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 748
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 75
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 181
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -415
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 114
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 325
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -553
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 444
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -609
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 201
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 647
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 443
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'7'.'0'.'nSum' 132
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'7'.'0'.'minNAmount' 392
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 184
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'7'.'0'.'nSum' 168
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'7'.'0'.'pSum' 63
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'7'.'0'.'minNAmount' 525
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'7'.'0'.'grossMarginHa' -750
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 161
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 499
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 90
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 138
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 414
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -561
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 20
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1226
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'7'.'0'.'nSum' 148
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 451
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2592
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'12'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'12'.'0'.'minNAmount' 374
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 785
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 75
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 111
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -378
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 114
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 256
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -516
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 374
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -572
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 201
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 578
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 480
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'12'.'0'.'nSum' 132
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'12'.'0'.'minNAmount' 322
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 221
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'12'.'0'.'nSum' 168
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'12'.'0'.'pSum' 63
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'12'.'0'.'minNAmount' 456
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'12'.'0'.'grossMarginHa' -713
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 161
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 430
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 127
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 138
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 345
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -524
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 20
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1231
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'12'.'0'.'nSum' 148
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 382
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2629
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'15'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'15'.'0'.'minNAmount' 333
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 808
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 75
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 70
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -368
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 114
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 214
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -493
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 333
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -550
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 201
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 536
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 503
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'15'.'0'.'nSum' 132
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'15'.'0'.'minNAmount' 281
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 243
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'15'.'0'.'nSum' 168
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'15'.'0'.'pSum' 63
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'15'.'0'.'minNAmount' 414
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'15'.'0'.'grossMarginHa' -691
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 161
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 388
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 149
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 138
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 303
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -502
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 20
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1235
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'15'.'0'.'nSum' 148
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 340
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2652
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'20'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'20'.'0'.'minNAmount' 263
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 844
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 75
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -356
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 114
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 145
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -468
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 263
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -531
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 201
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 467
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 539
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'20'.'0'.'nSum' 132
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'20'.'0'.'minNAmount' 212
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 280
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'20'.'0'.'nSum' 168
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'20'.'0'.'pSum' 63
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'20'.'0'.'minNAmount' 345
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'20'.'0'.'grossMarginHa' -654
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 161
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 319
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 182
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 138
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 234
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -485
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 20
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1241
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'20'.'0'.'nSum' 148
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 271
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2688
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'25'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'25'.'0'.'minNAmount' 194
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 876
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 75
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -362
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 114
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 76
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -458
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 194
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -521
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 201
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 398
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 560
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'25'.'0'.'nSum' 132
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'25'.'0'.'minNAmount' 142
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 308
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'25'.'0'.'nSum' 168
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'25'.'0'.'pSum' 63
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'25'.'0'.'minNAmount' 276
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'25'.'0'.'grossMarginHa' -633
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 161
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 250
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 192
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 138
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 164
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -475
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 20
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1247
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'25'.'0'.'nSum' 148
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 201
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2721
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'30'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'30'.'0'.'minNAmount' 125
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 886
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 75
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -369
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 114
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 6
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -448
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 146
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 125
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -512
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 201
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 328
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 570
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'30'.'0'.'nSum' 132
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'30'.'0'.'minNAmount' 73
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 318
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'30'.'0'.'nSum' 168
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'30'.'0'.'pSum' 63
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'30'.'0'.'minNAmount' 206
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterraps'.'30'.'0'.'grossMarginHa' -623
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 161
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 180
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 202
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 138
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 95
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -465
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 20
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1253
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'30'.'0'.'nSum' 148
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 132
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2731
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'0'.'0'.'nSum' 96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'0'.'0'.'minNAmount' 356
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1248
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 39
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 144
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -444
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 76
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 281
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -580
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 98
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 363
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -628
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 145
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 537
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 553
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'0'.'0'.'nSum' 88
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'0'.'0'.'minNAmount' 326
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 265
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'0'.'0'.'nSum' 118
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'0'.'0'.'pSum' 63
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'0'.'0'.'minNAmount' 437
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'0'.'0'.'grossMarginHa' -767
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 115
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 426
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' -44
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 94
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 348
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -584
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' -2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1236
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'0'.'0'.'nSum' 102
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 378
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2757
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'5'.'0'.'nSum' 96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'5'.'0'.'minNAmount' 286
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1284
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 39
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 75
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -409
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 76
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 212
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -544
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 98
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 294
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -593
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 145
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 468
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 588
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'5'.'0'.'nSum' 88
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'5'.'0'.'minNAmount' 257
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 301
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'5'.'0'.'nSum' 118
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'5'.'0'.'pSum' 63
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'5'.'0'.'minNAmount' 368
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'5'.'0'.'grossMarginHa' -731
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 115
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 357
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' -8
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 94
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 279
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -548
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' -2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1231
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'5'.'0'.'nSum' 102
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 308
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2793
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'7'.'0'.'nSum' 96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'7'.'0'.'minNAmount' 258
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1300
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 39
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 47
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -393
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 76
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 184
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -529
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 98
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 266
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -577
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 145
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 440
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 604
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'7'.'0'.'nSum' 88
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'7'.'0'.'minNAmount' 229
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 317
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'7'.'0'.'nSum' 118
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'7'.'0'.'pSum' 63
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'7'.'0'.'minNAmount' 340
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'7'.'0'.'grossMarginHa' -715
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 115
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 329
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 8
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 94
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 251
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -532
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' -2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1233
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'7'.'0'.'nSum' 102
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 281
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2808
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'12'.'0'.'nSum' 96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'12'.'0'.'minNAmount' 189
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1339
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 39
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -358
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 76
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 115
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -490
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 98
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 197
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -538
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 145
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 371
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 643
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'12'.'0'.'nSum' 88
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'12'.'0'.'minNAmount' 160
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 356
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'12'.'0'.'nSum' 118
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'12'.'0'.'pSum' 63
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'12'.'0'.'minNAmount' 271
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'12'.'0'.'grossMarginHa' -676
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 115
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 260
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 47
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 94
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 182
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -493
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' -2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1236
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'12'.'0'.'nSum' 102
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 211
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2847
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'15'.'0'.'nSum' 96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'15'.'0'.'minNAmount' 148
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1362
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 39
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -356
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 76
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 73
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -466
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 98
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 155
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -514
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 145
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 329
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 667
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'15'.'0'.'nSum' 88
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'15'.'0'.'minNAmount' 118
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 379
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'15'.'0'.'nSum' 118
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'15'.'0'.'pSum' 63
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'15'.'0'.'minNAmount' 229
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'15'.'0'.'grossMarginHa' -653
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 115
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 218
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 70
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 94
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 140
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -470
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' -2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1239
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'15'.'0'.'nSum' 102
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 170
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2870
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'20'.'0'.'nSum' 96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'20'.'0'.'minNAmount' 78
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1401
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 39
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -360
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 76
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 4
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -439
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 98
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 86
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -494
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 145
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 260
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 705
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'20'.'0'.'nSum' 88
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'20'.'0'.'minNAmount' 49
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 418
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'20'.'0'.'nSum' 118
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'20'.'0'.'pSum' 63
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'20'.'0'.'minNAmount' 160
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'20'.'0'.'grossMarginHa' -614
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 115
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 149
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 105
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 94
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 71
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -451
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' -2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1243
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'20'.'0'.'nSum' 102
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 100
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2909
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'25'.'0'.'nSum' 96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'25'.'0'.'minNAmount' 9
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1434
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 39
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -364
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 76
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -440
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 98
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 16
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -482
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 145
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 190
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 728
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'25'.'0'.'nSum' 88
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'25'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 445
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'25'.'0'.'nSum' 118
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'25'.'0'.'pSum' 63
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'25'.'0'.'minNAmount' 90
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'25'.'0'.'grossMarginHa' -592
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 115
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 79
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 117
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 94
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 1
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -439
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' -2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1247
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'25'.'0'.'nSum' 102
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 31
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2944
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'30'.'0'.'nSum' 96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1434
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 39
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -368
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 76
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -445
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 98
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -481
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 145
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 121
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 740
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'30'.'0'.'nSum' 88
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 440
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'30'.'0'.'nSum' 118
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'30'.'0'.'pSum' 63
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'30'.'0'.'minNAmount' 21
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterraps'.'30'.'0'.'grossMarginHa' -580
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 115
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 10
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 129
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 94
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -442
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' -2
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1251
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'30'.'0'.'nSum' 102
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '62ffe0b8-d621-436b-a76a-1f44235178e0'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2948
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'0'.'0'.'nSum' 110
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'0'.'0'.'minNAmount' 407
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1152
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 49
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 181
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -445
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 86
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 319
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -581
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 114
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 422
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -634
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 161
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 596
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 633
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'0'.'0'.'nSum' 98
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'0'.'0'.'minNAmount' 363
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 1550
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'0'.'0'.'nSum' 123
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'0'.'0'.'pSum' 63
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'0'.'0'.'minNAmount' 456
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'0'.'0'.'grossMarginHa' -763
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 121
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 448
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 278
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 356
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -577
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 8
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 30
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1238
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'0'.'0'.'nSum' 112
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 415
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' -11
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'5'.'0'.'nSum' 110
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'5'.'0'.'minNAmount' 338
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1188
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 49
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 112
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -409
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 86
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 249
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -545
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 114
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 353
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -598
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 161
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 527
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 669
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'5'.'0'.'nSum' 98
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'5'.'0'.'minNAmount' 294
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 1586
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'5'.'0'.'nSum' 123
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'5'.'0'.'pSum' 63
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'5'.'0'.'minNAmount' 386
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'5'.'0'.'grossMarginHa' -727
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 121
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 379
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 314
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 286
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -542
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 8
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1225
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'5'.'0'.'nSum' 112
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 345
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 25
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'7'.'0'.'nSum' 110
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'7'.'0'.'minNAmount' 310
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1203
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 49
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 84
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -394
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 86
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 221
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -530
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 114
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 325
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -583
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 161
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 499
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 684
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'7'.'0'.'nSum' 98
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'7'.'0'.'minNAmount' 266
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 1601
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'7'.'0'.'nSum' 123
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'7'.'0'.'pSum' 63
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'7'.'0'.'minNAmount' 358
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'7'.'0'.'grossMarginHa' -712
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 121
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 351
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 329
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 258
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -526
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 8
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1226
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'7'.'0'.'nSum' 112
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 318
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 40
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'12'.'0'.'nSum' 110
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'12'.'0'.'minNAmount' 241
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1241
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 49
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 15
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -356
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 86
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 152
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -492
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 114
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 256
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -544
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 161
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 430
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 722
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'12'.'0'.'nSum' 98
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'12'.'0'.'minNAmount' 197
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 1639
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'12'.'0'.'nSum' 123
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'12'.'0'.'pSum' 63
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'12'.'0'.'minNAmount' 289
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'12'.'0'.'grossMarginHa' -674
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 121
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 282
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 367
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 189
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -488
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 8
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1231
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'12'.'0'.'nSum' 112
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 248
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 79
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'15'.'0'.'nSum' 110
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'15'.'0'.'minNAmount' 199
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1264
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 49
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -350
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 86
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 111
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -469
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 114
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 214
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -522
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 161
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 388
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 745
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'15'.'0'.'nSum' 98
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'15'.'0'.'minNAmount' 155
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 1662
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'15'.'0'.'nSum' 123
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'15'.'0'.'pSum' 63
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'15'.'0'.'minNAmount' 248
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'15'.'0'.'grossMarginHa' -651
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 121
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 240
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 390
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 148
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -465
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 8
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1234
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'15'.'0'.'nSum' 112
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 207
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 101
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'20'.'0'.'nSum' 110
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'20'.'0'.'minNAmount' 130
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1302
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 49
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -355
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 86
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 41
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -442
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 114
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 145
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -502
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 161
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 319
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 783
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'20'.'0'.'nSum' 98
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'20'.'0'.'minNAmount' 86
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 1700
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'20'.'0'.'nSum' 123
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'20'.'0'.'pSum' 63
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'20'.'0'.'minNAmount' 178
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'20'.'0'.'grossMarginHa' -613
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 121
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 171
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 424
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 78
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -447
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 8
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1239
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'20'.'0'.'nSum' 112
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 137
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 139
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'25'.'0'.'nSum' 110
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'25'.'0'.'minNAmount' 61
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1334
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 49
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -360
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 86
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -436
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 114
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 76
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -491
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 161
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 250
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 805
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'25'.'0'.'nSum' 98
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'25'.'0'.'minNAmount' 16
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 1729
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'25'.'0'.'nSum' 123
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'25'.'0'.'pSum' 63
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'25'.'0'.'minNAmount' 109
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'25'.'0'.'grossMarginHa' -592
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 121
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 101
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 435
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 9
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -436
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 8
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1244
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'25'.'0'.'nSum' 112
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 68
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 173
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'30'.'0'.'nSum' 110
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1345
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 49
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -365
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 86
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -441
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 114
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 6
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -480
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 161
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 180
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 816
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'30'.'0'.'nSum' 98
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 1730
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'30'.'0'.'nSum' 123
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'30'.'0'.'pSum' 63
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'30'.'0'.'minNAmount' 40
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterraps'.'30'.'0'.'grossMarginHa' -581
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 121
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 32
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 446
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 96
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -438
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 8
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1249
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'30'.'0'.'nSum' 112
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 185
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'0'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'0'.'0'.'minNAmount' 467
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1091
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 55
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 204
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -442
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 94
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 348
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -580
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 467
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -636
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 181
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 670
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'0'.'0'.'nSum' 112
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'0'.'0'.'minNAmount' 415
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 1124
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'0'.'0'.'nSum' 148
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'0'.'0'.'pSum' 63
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'0'.'0'.'minNAmount' 548
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'0'.'0'.'grossMarginHa' -777
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 144
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 533
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' -95
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 118
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 437
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -589
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1222
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'0'.'0'.'nSum' 128
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 474
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2614
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'5'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'5'.'0'.'minNAmount' 397
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1127
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 55
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 134
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -407
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 94
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 279
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -545
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 397
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -601
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 181
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 601
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 37
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'5'.'0'.'nSum' 112
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'5'.'0'.'minNAmount' 345
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 1159
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'5'.'0'.'nSum' 148
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'5'.'0'.'pSum' 63
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'5'.'0'.'minNAmount' 479
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'5'.'0'.'grossMarginHa' -742
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 144
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 464
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' -60
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 118
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 368
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -553
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1218
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'5'.'0'.'nSum' 128
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 405
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2649
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'7'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'7'.'0'.'minNAmount' 370
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1142
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 55
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 107
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -392
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 94
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 251
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -530
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 370
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -586
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 181
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 573
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 52
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'7'.'0'.'nSum' 112
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'7'.'0'.'minNAmount' 318
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 1174
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'7'.'0'.'nSum' 148
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'7'.'0'.'pSum' 63
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'7'.'0'.'minNAmount' 451
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'7'.'0'.'grossMarginHa' -727
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 144
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 436
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' -45
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 118
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 340
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -538
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1221
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'7'.'0'.'nSum' 128
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 377
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2664
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'12'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'12'.'0'.'minNAmount' 300
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1179
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 55
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 37
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -355
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 94
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 182
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -493
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 300
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -549
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 181
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 504
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 89
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'12'.'0'.'nSum' 112
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'12'.'0'.'minNAmount' 248
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 1211
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'12'.'0'.'nSum' 148
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'12'.'0'.'pSum' 63
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'12'.'0'.'minNAmount' 382
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'12'.'0'.'grossMarginHa' -690
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 144
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 367
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' -7
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 118
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 271
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -501
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1226
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'12'.'0'.'nSum' 128
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 308
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2701
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'15'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'15'.'0'.'minNAmount' 259
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1202
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 55
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -344
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 94
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 140
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -470
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 259
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -527
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 181
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 462
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 111
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'15'.'0'.'nSum' 112
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'15'.'0'.'minNAmount' 207
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 1233
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'15'.'0'.'nSum' 148
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'15'.'0'.'pSum' 63
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'15'.'0'.'minNAmount' 340
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'15'.'0'.'grossMarginHa' -667
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 144
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 325
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 15
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 118
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 229
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -479
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1229
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'15'.'0'.'nSum' 128
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 266
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2724
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'20'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'20'.'0'.'minNAmount' 189
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1239
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 55
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -350
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 94
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 71
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -444
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 189
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -508
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 181
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 393
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 148
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'20'.'0'.'nSum' 112
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'20'.'0'.'minNAmount' 137
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 1270
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'20'.'0'.'nSum' 148
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'20'.'0'.'pSum' 63
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'20'.'0'.'minNAmount' 271
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'20'.'0'.'grossMarginHa' -630
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 144
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 256
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 48
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 118
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 160
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -462
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1235
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'20'.'0'.'nSum' 128
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 197
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2761
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'25'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'25'.'0'.'minNAmount' 120
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1270
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 55
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -356
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 94
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -434
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 120
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -498
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 181
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 324
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 169
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'25'.'0'.'nSum' 112
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'25'.'0'.'minNAmount' 68
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 1299
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'25'.'0'.'nSum' 148
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'25'.'0'.'pSum' 63
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'25'.'0'.'minNAmount' 201
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'25'.'0'.'grossMarginHa' -609
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 144
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 187
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 58
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 118
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 90
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -452
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1241
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'25'.'0'.'nSum' 128
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 127
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2793
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'30'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'30'.'0'.'minNAmount' 51
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1280
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 55
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -362
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 94
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -439
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 126
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 51
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -488
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 181
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 254
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 179
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'30'.'0'.'nSum' 112
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 1310
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'30'.'0'.'nSum' 148
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'30'.'0'.'pSum' 63
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'30'.'0'.'minNAmount' 132
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterraps'.'30'.'0'.'grossMarginHa' -600
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 144
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 117
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 68
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 118
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 21
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -442
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1248
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'30'.'0'.'nSum' 128
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 58
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '9dc87df6-5113-40c7-9d16-b27f2485faaa'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2803
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'0'.'0'.'nSum' 96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'0'.'0'.'minNAmount' 356
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1160
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 39
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 144
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -407
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 281
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -543
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 98
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 363
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -590
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 145
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 537
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 552
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'0'.'0'.'nSum' 88
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'0'.'0'.'minNAmount' 326
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' -16
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'0'.'0'.'nSum' 118
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'0'.'0'.'pSum' 63
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'0'.'0'.'minNAmount' 437
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'0'.'0'.'minPAmount' 525
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'0'.'0'.'grossMarginHa' -731
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 115
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 426
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' -25
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 94
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 348
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -546
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' -2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1207
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'0'.'0'.'nSum' 102
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 378
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2175
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'5'.'0'.'nSum' 96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'5'.'0'.'minNAmount' 286
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1197
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 39
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 75
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -371
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 212
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -506
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 98
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 294
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -554
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 145
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 468
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 588
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'5'.'0'.'nSum' 88
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'5'.'0'.'minNAmount' 257
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 21
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'5'.'0'.'nSum' 118
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'5'.'0'.'pSum' 63
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'5'.'0'.'minNAmount' 368
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'5'.'0'.'minPAmount' 404
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'5'.'0'.'grossMarginHa' -694
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 115
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 357
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 12
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 94
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 279
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -509
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' -2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1201
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'5'.'0'.'nSum' 102
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 308
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2211
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'7'.'0'.'nSum' 96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'7'.'0'.'minNAmount' 258
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1213
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 39
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 47
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -355
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 184
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -490
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 98
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 266
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -538
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 145
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 440
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 604
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'7'.'0'.'nSum' 88
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'7'.'0'.'minNAmount' 229
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 37
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'7'.'0'.'nSum' 118
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'7'.'0'.'pSum' 63
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'7'.'0'.'minNAmount' 340
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'7'.'0'.'minPAmount' 356
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'7'.'0'.'grossMarginHa' -678
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 115
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 329
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 28
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 94
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 251
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -494
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' -2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1202
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'7'.'0'.'nSum' 102
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 281
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2227
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'12'.'0'.'nSum' 96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'12'.'0'.'minNAmount' 189
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1252
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 39
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -319
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 115
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -451
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 98
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 197
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -498
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 145
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 371
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 644
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'12'.'0'.'nSum' 88
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'12'.'0'.'minNAmount' 160
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'12'.'0'.'nSum' 118
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'12'.'0'.'pSum' 63
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'12'.'0'.'minNAmount' 271
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'12'.'0'.'minPAmount' 235
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'12'.'0'.'grossMarginHa' -639
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 115
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 260
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 67
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 94
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 182
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -454
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' -2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1206
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'12'.'0'.'nSum' 102
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 211
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2267
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'15'.'0'.'nSum' 96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'15'.'0'.'minNAmount' 148
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1276
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 39
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -317
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 73
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -427
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 98
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 155
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -475
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 145
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 329
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 667
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'15'.'0'.'nSum' 88
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'15'.'0'.'minNAmount' 118
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 100
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'15'.'0'.'nSum' 118
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'15'.'0'.'pSum' 63
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'15'.'0'.'minNAmount' 229
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'15'.'0'.'minPAmount' 163
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'15'.'0'.'grossMarginHa' -615
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 115
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 218
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 91
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 94
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 140
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -430
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' -2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1208
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'15'.'0'.'nSum' 102
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 170
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2290
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'20'.'0'.'nSum' 96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'20'.'0'.'minNAmount' 78
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1315
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 39
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -320
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -399
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 98
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 86
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -454
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 145
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 260
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 706
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'20'.'0'.'nSum' 88
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'20'.'0'.'minNAmount' 49
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 139
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'20'.'0'.'nSum' 118
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'20'.'0'.'pSum' 63
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'20'.'0'.'minNAmount' 160
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'20'.'0'.'minPAmount' 42
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'20'.'0'.'grossMarginHa' -576
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 115
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 149
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 126
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 94
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 71
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -411
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' -2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1211
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'20'.'0'.'nSum' 102
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 100
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2330
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'25'.'0'.'nSum' 96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'25'.'0'.'minNAmount' 9
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1349
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 39
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -324
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -400
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 98
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 16
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -442
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 145
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 190
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 730
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'25'.'0'.'nSum' 88
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'25'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 166
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'25'.'0'.'nSum' 118
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'25'.'0'.'pSum' 63
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'25'.'0'.'minNAmount' 90
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'25'.'0'.'grossMarginHa' -553
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 115
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 79
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 139
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 94
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 1
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -399
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' -2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1215
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'25'.'0'.'nSum' 102
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 31
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2364
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'30'.'0'.'nSum' 96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1349
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 39
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -328
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 76
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -404
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 98
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -440
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 145
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 121
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 742
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'30'.'0'.'nSum' 88
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 163
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'30'.'0'.'nSum' 118
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'30'.'0'.'pSum' 63
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'30'.'0'.'minNAmount' 21
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterraps'.'30'.'0'.'grossMarginHa' -540
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 115
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 10
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 151
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 94
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -401
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' -2
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1219
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'30'.'0'.'nSum' 102
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 '9f7e7bdf-919e-450c-ab20-1998696397a3'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2369
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'0'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'0'.'0'.'minNAmount' 541
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 688
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 75
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 278
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -487
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 114
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 422
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -624
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 541
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -681
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 201
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 744
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 366
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'0'.'0'.'nSum' 132
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'0'.'0'.'minNAmount' 489
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'0'.'0'.'nSum' 168
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'0'.'0'.'pSum' 63
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'0'.'0'.'minNAmount' 622
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'0'.'0'.'minPAmount' 525
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'0'.'0'.'grossMarginHa' -822
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 161
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 596
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 15
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 138
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 511
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -633
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 20
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 74
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1265
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'0'.'0'.'nSum' 148
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 548
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2561
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'5'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'5'.'0'.'minNAmount' 471
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 722
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 75
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 208
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -453
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 114
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 353
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -590
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 471
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -647
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 201
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 675
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 400
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'5'.'0'.'nSum' 132
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'5'.'0'.'minNAmount' 420
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 180
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'5'.'0'.'nSum' 168
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'5'.'0'.'pSum' 63
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'5'.'0'.'minNAmount' 553
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'5'.'0'.'minPAmount' 404
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'5'.'0'.'grossMarginHa' -788
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 161
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 527
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 49
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 138
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 442
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -599
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 20
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1246
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'5'.'0'.'nSum' 148
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 479
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2595
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'7'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'7'.'0'.'minNAmount' 444
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 737
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 75
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 181
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -438
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 114
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 325
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -575
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 444
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -632
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 201
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 647
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 415
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'7'.'0'.'nSum' 132
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'7'.'0'.'minNAmount' 392
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 195
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'7'.'0'.'nSum' 168
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'7'.'0'.'pSum' 63
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'7'.'0'.'minNAmount' 525
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'7'.'0'.'minPAmount' 356
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'7'.'0'.'grossMarginHa' -773
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 161
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 499
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 65
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 138
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 414
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -584
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 20
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1246
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'7'.'0'.'nSum' 148
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 451
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2610
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'12'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'12'.'0'.'minNAmount' 374
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 775
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 75
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 111
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -400
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 114
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 256
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -538
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 374
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -594
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 201
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 578
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 452
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'12'.'0'.'nSum' 132
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'12'.'0'.'minNAmount' 322
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 233
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'12'.'0'.'nSum' 168
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'12'.'0'.'pSum' 63
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'12'.'0'.'minNAmount' 456
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'12'.'0'.'minPAmount' 235
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'12'.'0'.'grossMarginHa' -736
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 161
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 430
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 102
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 138
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 345
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -547
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 20
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1251
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'12'.'0'.'nSum' 148
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 382
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2647
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'15'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'15'.'0'.'minNAmount' 333
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 797
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 75
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 70
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -390
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 114
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 214
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -515
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 333
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -572
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 201
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 536
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 475
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'15'.'0'.'nSum' 132
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'15'.'0'.'minNAmount' 281
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 255
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'15'.'0'.'nSum' 168
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'15'.'0'.'pSum' 63
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'15'.'0'.'minNAmount' 414
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'15'.'0'.'minPAmount' 163
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'15'.'0'.'grossMarginHa' -713
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 161
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 388
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 125
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 138
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 303
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -524
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 20
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1254
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'15'.'0'.'nSum' 148
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 340
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2670
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'20'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'20'.'0'.'minNAmount' 263
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 835
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 75
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -378
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 114
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 145
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -489
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 263
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -553
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 201
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 467
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 512
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'20'.'0'.'nSum' 132
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'20'.'0'.'minNAmount' 212
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 292
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'20'.'0'.'nSum' 168
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'20'.'0'.'pSum' 63
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'20'.'0'.'minNAmount' 345
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'20'.'0'.'minPAmount' 42
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'20'.'0'.'grossMarginHa' -676
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 161
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 319
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 158
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 138
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 234
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -507
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 20
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1260
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'20'.'0'.'nSum' 148
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 271
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2707
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'25'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'25'.'0'.'minNAmount' 194
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 867
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 75
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -383
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 114
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 76
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -479
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 194
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -543
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 201
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 398
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 534
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'25'.'0'.'nSum' 132
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'25'.'0'.'minNAmount' 142
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 321
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'25'.'0'.'nSum' 168
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'25'.'0'.'pSum' 63
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'25'.'0'.'minNAmount' 276
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'25'.'0'.'grossMarginHa' -655
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 161
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 250
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 168
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 138
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 164
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -496
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 20
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1266
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'25'.'0'.'nSum' 148
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 201
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2740
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'30'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'30'.'0'.'minNAmount' 125
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 877
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 75
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -389
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 114
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 6
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -469
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 146
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 125
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -533
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 201
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 328
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 544
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'30'.'0'.'nSum' 132
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'30'.'0'.'minNAmount' 73
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 331
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'30'.'0'.'nSum' 168
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'30'.'0'.'pSum' 63
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'30'.'0'.'minNAmount' 206
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterraps'.'30'.'0'.'grossMarginHa' -645
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 161
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 180
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 179
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 138
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 95
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -486
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 20
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1272
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'30'.'0'.'nSum' 148
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 132
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2750
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'0'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'0'.'0'.'minNAmount' 541
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1076
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 75
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 278
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -454
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 114
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 422
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -592
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 541
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -648
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 201
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 744
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' -9
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'0'.'0'.'nSum' 132
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'0'.'0'.'minNAmount' 489
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 1087
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'0'.'0'.'nSum' 168
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'0'.'0'.'pSum' 63
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'0'.'0'.'minNAmount' 622
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'0'.'0'.'minPAmount' 525
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'0'.'0'.'grossMarginHa' -789
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 607
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' -106
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 138
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 511
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -601
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 20
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 74
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1237
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'0'.'0'.'nSum' 148
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 548
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2564
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'5'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'5'.'0'.'minNAmount' 471
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1112
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 75
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 208
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -419
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 114
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 353
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -557
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 471
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -613
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 201
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 675
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 27
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'5'.'0'.'nSum' 132
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'5'.'0'.'minNAmount' 420
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 1122
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'5'.'0'.'nSum' 168
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'5'.'0'.'pSum' 63
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'5'.'0'.'minNAmount' 553
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'5'.'0'.'minPAmount' 404
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'5'.'0'.'grossMarginHa' -754
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 538
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' -71
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 138
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 442
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -565
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 20
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 5
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1217
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'5'.'0'.'nSum' 148
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 479
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2600
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'7'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'7'.'0'.'minNAmount' 444
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1127
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 75
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 181
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -404
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 114
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 325
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -542
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 444
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -598
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 201
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 647
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 42
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'7'.'0'.'nSum' 132
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'7'.'0'.'minNAmount' 392
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 1137
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'7'.'0'.'nSum' 168
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'7'.'0'.'pSum' 63
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'7'.'0'.'minNAmount' 525
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'7'.'0'.'minPAmount' 356
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'7'.'0'.'grossMarginHa' -739
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 510
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' -56
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 138
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 414
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -550
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 20
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1216
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'7'.'0'.'nSum' 148
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 451
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2615
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'12'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'12'.'0'.'minNAmount' 374
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1165
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 75
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 111
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -366
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 114
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 256
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -504
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 374
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -560
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 201
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 578
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 79
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'12'.'0'.'nSum' 132
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'12'.'0'.'minNAmount' 322
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 1175
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'12'.'0'.'nSum' 168
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'12'.'0'.'pSum' 63
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'12'.'0'.'minNAmount' 456
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'12'.'0'.'minPAmount' 235
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'12'.'0'.'grossMarginHa' -701
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 441
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' -18
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 138
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 345
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -513
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 20
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1221
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'12'.'0'.'nSum' 148
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 382
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2652
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'15'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'15'.'0'.'minNAmount' 333
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1187
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 75
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 70
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -356
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 114
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 214
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -482
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 333
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -538
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 201
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 536
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 102
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'15'.'0'.'nSum' 132
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'15'.'0'.'minNAmount' 281
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 1197
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'15'.'0'.'nSum' 168
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'15'.'0'.'pSum' 63
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'15'.'0'.'minNAmount' 414
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'15'.'0'.'minPAmount' 163
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'15'.'0'.'grossMarginHa' -679
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 399
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 4
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 138
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 303
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -490
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 20
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1225
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'15'.'0'.'nSum' 148
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 340
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2675
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'20'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'20'.'0'.'minNAmount' 263
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1224
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 75
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -345
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 114
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 145
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -456
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 263
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -519
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 201
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 467
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 139
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'20'.'0'.'nSum' 132
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'20'.'0'.'minNAmount' 212
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 1234
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'20'.'0'.'nSum' 168
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'20'.'0'.'pSum' 63
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'20'.'0'.'minNAmount' 345
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'20'.'0'.'minPAmount' 42
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'20'.'0'.'grossMarginHa' -642
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 330
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 38
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 138
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 234
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -473
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 20
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1231
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'20'.'0'.'nSum' 148
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 271
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2712
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'25'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'25'.'0'.'minNAmount' 194
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1256
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 75
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -351
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 114
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 76
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -446
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 194
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -509
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 201
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 398
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 160
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'25'.'0'.'nSum' 132
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'25'.'0'.'minNAmount' 142
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 1263
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'25'.'0'.'nSum' 168
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'25'.'0'.'pSum' 63
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'25'.'0'.'minNAmount' 276
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'25'.'0'.'grossMarginHa' -621
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 261
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 48
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 138
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -463
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 20
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1236
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'25'.'0'.'nSum' 148
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 201
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2745
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'30'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'30'.'0'.'minNAmount' 125
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1266
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 75
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -356
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 114
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 6
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -436
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 146
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 125
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -499
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 201
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 328
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 170
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'30'.'0'.'nSum' 132
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'30'.'0'.'minNAmount' 73
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 1273
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'30'.'0'.'nSum' 168
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'30'.'0'.'pSum' 63
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'30'.'0'.'minNAmount' 206
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterraps'.'30'.'0'.'grossMarginHa' -611
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 164
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 191
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 58
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 138
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 95
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -453
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 20
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1242
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'30'.'0'.'nSum' 148
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 132
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 'aa5973e8-2392-4ca2-a485-7d8e834ded31'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2755
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'0'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'0'.'0'.'minNAmount' 541
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 666
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 75
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 278
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -526
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 114
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 422
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -664
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 541
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -722
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 201
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 744
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 315
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'0'.'0'.'nSum' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'0'.'0'.'minNAmount' 489
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 130
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'0'.'0'.'nSum' 168
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'0'.'0'.'pSum' 63
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'0'.'0'.'minNAmount' 622
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'0'.'0'.'minPAmount' 525
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'0'.'0'.'grossMarginHa' -863
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 161
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 596
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' -30
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 138
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 511
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -674
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 20
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 74
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1300
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'0'.'0'.'nSum' 148
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 548
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2526
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'5'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'5'.'0'.'minNAmount' 471
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 699
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 75
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 208
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -494
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 114
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 353
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -632
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 471
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -689
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 201
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 675
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 347
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'5'.'0'.'nSum' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'5'.'0'.'minNAmount' 420
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 163
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'5'.'0'.'nSum' 168
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'5'.'0'.'pSum' 63
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'5'.'0'.'minNAmount' 553
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'5'.'0'.'minPAmount' 404
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'5'.'0'.'grossMarginHa' -831
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 161
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 527
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 138
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 442
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -641
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 20
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 5
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1282
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'5'.'0'.'nSum' 148
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 479
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2559
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'7'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'7'.'0'.'minNAmount' 444
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 713
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 75
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 181
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -479
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 114
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 325
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -617
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 444
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -674
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 201
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 647
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 362
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'7'.'0'.'nSum' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'7'.'0'.'minNAmount' 392
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 178
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'7'.'0'.'nSum' 168
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'7'.'0'.'pSum' 63
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'7'.'0'.'minNAmount' 525
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'7'.'0'.'minPAmount' 356
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'7'.'0'.'grossMarginHa' -815
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 161
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 499
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 18
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 138
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 414
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -626
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 20
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1281
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'7'.'0'.'nSum' 148
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 451
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2574
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'12'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'12'.'0'.'minNAmount' 374
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 751
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 75
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 111
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -441
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 114
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 256
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -579
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 374
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -636
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 201
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 578
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 399
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'12'.'0'.'nSum' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'12'.'0'.'minNAmount' 322
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 216
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'12'.'0'.'nSum' 168
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'12'.'0'.'pSum' 63
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'12'.'0'.'minNAmount' 456
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'12'.'0'.'minPAmount' 235
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'12'.'0'.'grossMarginHa' -778
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 161
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 430
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 55
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 138
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 345
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -589
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 20
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1287
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'12'.'0'.'nSum' 148
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 382
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2611
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'15'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'15'.'0'.'minNAmount' 333
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 774
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 75
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 70
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -431
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 114
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 214
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -556
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 333
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -614
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 201
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 536
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 422
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'15'.'0'.'nSum' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'15'.'0'.'minNAmount' 281
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 238
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'15'.'0'.'nSum' 168
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'15'.'0'.'pSum' 63
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'15'.'0'.'minNAmount' 414
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'15'.'0'.'minPAmount' 163
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'15'.'0'.'grossMarginHa' -755
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 161
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 388
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 78
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 138
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 303
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -566
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 20
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1290
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'15'.'0'.'nSum' 148
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 340
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2634
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'20'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'20'.'0'.'minNAmount' 263
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 811
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 75
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -418
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 114
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 145
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -530
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 263
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -595
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 201
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 467
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 459
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'20'.'0'.'nSum' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'20'.'0'.'minNAmount' 212
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 275
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'20'.'0'.'nSum' 168
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'20'.'0'.'pSum' 63
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'20'.'0'.'minNAmount' 345
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'20'.'0'.'minPAmount' 42
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'20'.'0'.'grossMarginHa' -718
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 161
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 319
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 112
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 138
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 234
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -549
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 20
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1296
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'20'.'0'.'nSum' 148
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 271
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2671
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'25'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'25'.'0'.'minNAmount' 194
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 843
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 75
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -424
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 114
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 76
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -520
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 194
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -585
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 201
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 398
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 481
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'25'.'0'.'nSum' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'25'.'0'.'minNAmount' 142
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 304
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'25'.'0'.'nSum' 168
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'25'.'0'.'pSum' 63
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'25'.'0'.'minNAmount' 276
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'25'.'0'.'grossMarginHa' -697
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 161
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 250
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 122
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 138
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 164
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -538
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 20
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1301
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'25'.'0'.'nSum' 148
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 201
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2704
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'30'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'30'.'0'.'minNAmount' 125
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 853
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 75
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -430
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 114
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 6
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -509
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 146
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 125
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -575
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 201
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 328
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 491
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'30'.'0'.'nSum' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'30'.'0'.'minNAmount' 73
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 314
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'30'.'0'.'nSum' 168
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'30'.'0'.'pSum' 63
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'30'.'0'.'minNAmount' 206
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterraps'.'30'.'0'.'grossMarginHa' -687
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 161
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 180
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 138
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 95
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -528
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 20
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1307
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'30'.'0'.'nSum' 148
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 132
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 'af3d2471-1e40-4c82-b332-0147a237b3dd'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2715
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'0'.'0'.'nSum' 106
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'0'.'0'.'minNAmount' 393
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1437
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 49
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 181
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -424
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 86
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 319
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -560
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 108
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 400
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -607
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 155
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 574
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 125
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'0'.'0'.'nSum' 98
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'0'.'0'.'minNAmount' 363
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 1533
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'0'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'0'.'0'.'pSum' 63
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'0'.'0'.'minNAmount' 474
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'0'.'0'.'minPAmount' 525
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'0'.'0'.'grossMarginHa' -746
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 474
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 147
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 104
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 385
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -563
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 8
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 30
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1220
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'0'.'0'.'nSum' 112
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 415
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2796
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'5'.'0'.'nSum' 106
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'5'.'0'.'minNAmount' 323
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1474
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 49
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 112
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -387
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 86
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 249
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -523
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 108
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 331
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -571
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 155
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 505
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 161
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'5'.'0'.'nSum' 98
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'5'.'0'.'minNAmount' 294
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 1569
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'5'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'5'.'0'.'pSum' 63
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'5'.'0'.'minNAmount' 405
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'5'.'0'.'minPAmount' 404
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'5'.'0'.'grossMarginHa' -710
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 405
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 183
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 104
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 316
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -526
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 8
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1206
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'5'.'0'.'nSum' 112
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 345
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2832
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'7'.'0'.'nSum' 106
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'7'.'0'.'minNAmount' 296
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1489
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 49
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 84
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -372
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 86
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 221
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -508
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 108
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 303
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -555
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 155
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 477
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 176
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'7'.'0'.'nSum' 98
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'7'.'0'.'minNAmount' 266
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 1585
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'7'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'7'.'0'.'pSum' 63
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'7'.'0'.'minNAmount' 377
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'7'.'0'.'minPAmount' 356
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'7'.'0'.'grossMarginHa' -694
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 377
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 199
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 104
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 288
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -511
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 8
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1208
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'7'.'0'.'nSum' 112
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 318
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2848
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'12'.'0'.'nSum' 106
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'12'.'0'.'minNAmount' 226
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1528
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 49
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 15
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -334
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 86
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 152
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -469
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 108
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 234
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -517
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 155
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 408
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 215
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'12'.'0'.'nSum' 98
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'12'.'0'.'minNAmount' 197
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 1623
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'12'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'12'.'0'.'pSum' 63
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'12'.'0'.'minNAmount' 308
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'12'.'0'.'minPAmount' 235
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'12'.'0'.'grossMarginHa' -656
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 308
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 237
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 104
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 219
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -473
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 8
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1212
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'12'.'0'.'nSum' 112
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 248
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2886
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'15'.'0'.'nSum' 106
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'15'.'0'.'minNAmount' 185
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1550
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 49
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -328
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 86
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 111
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -447
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 108
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 192
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -494
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 155
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 366
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 238
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'15'.'0'.'nSum' 98
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'15'.'0'.'minNAmount' 155
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 1646
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'15'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'15'.'0'.'pSum' 63
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'15'.'0'.'minNAmount' 266
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'15'.'0'.'minPAmount' 163
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'15'.'0'.'grossMarginHa' -633
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 266
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 260
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 104
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 177
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -449
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 8
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1215
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'15'.'0'.'nSum' 112
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 207
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2909
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'20'.'0'.'nSum' 106
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'20'.'0'.'minNAmount' 115
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1588
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 49
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -333
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 86
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 41
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -420
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 108
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 123
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -475
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 155
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 297
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 275
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'20'.'0'.'nSum' 98
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'20'.'0'.'minNAmount' 86
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 1683
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'20'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'20'.'0'.'pSum' 63
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'20'.'0'.'minNAmount' 197
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'20'.'0'.'minPAmount' 42
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'20'.'0'.'grossMarginHa' -595
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 197
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 294
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 104
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 108
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -432
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 8
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1220
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'20'.'0'.'nSum' 112
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 137
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2947
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'25'.'0'.'nSum' 106
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'25'.'0'.'minNAmount' 46
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1621
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 49
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -338
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 86
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -414
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 108
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 53
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -464
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 155
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 227
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 298
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'25'.'0'.'nSum' 98
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'25'.'0'.'minNAmount' 16
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 1713
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'25'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'25'.'0'.'pSum' 63
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'25'.'0'.'minNAmount' 127
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'25'.'0'.'grossMarginHa' -574
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 127
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 305
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 104
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 39
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -421
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 8
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1225
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'25'.'0'.'nSum' 112
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 68
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2980
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'30'.'0'.'nSum' 106
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1628
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 49
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -343
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 86
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -419
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 108
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -455
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 155
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 158
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 308
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'30'.'0'.'nSum' 98
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 1713
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'30'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'30'.'0'.'pSum' 63
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'30'.'0'.'minNAmount' 58
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterraps'.'30'.'0'.'grossMarginHa' -563
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 128
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 58
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 316
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 104
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -415
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 8
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1230
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'30'.'0'.'nSum' 112
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2992
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'0'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'0'.'0'.'minNAmount' 504
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 893
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 65
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 241
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -471
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 104
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 385
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -609
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 504
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -666
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 191
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 707
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 381
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'0'.'0'.'nSum' 122
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'0'.'0'.'minNAmount' 452
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' -40
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'0'.'0'.'nSum' 158
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'0'.'0'.'pSum' 63
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'0'.'0'.'minNAmount' 585
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'0'.'0'.'minPAmount' 525
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'0'.'0'.'grossMarginHa' -806
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 151
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 559
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' -125
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 128
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 474
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -618
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 10
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 37
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1250
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'0'.'0'.'nSum' 138
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 511
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2376
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'5'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'5'.'0'.'minNAmount' 434
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 927
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 65
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 171
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -437
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 104
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 316
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -575
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 434
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -632
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 191
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 638
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 415
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'5'.'0'.'nSum' 122
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'5'.'0'.'minNAmount' 383
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' -6
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'5'.'0'.'nSum' 158
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'5'.'0'.'pSum' 63
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'5'.'0'.'minNAmount' 516
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'5'.'0'.'minPAmount' 404
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'5'.'0'.'grossMarginHa' -773
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 151
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 490
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' -91
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 128
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 405
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -584
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 10
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1237
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'5'.'0'.'nSum' 138
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 442
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2410
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'7'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'7'.'0'.'minNAmount' 407
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 942
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 65
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 144
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -422
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 104
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 288
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -561
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 407
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -617
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 191
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 610
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 430
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'7'.'0'.'nSum' 122
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'7'.'0'.'minNAmount' 355
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 8
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'7'.'0'.'nSum' 158
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'7'.'0'.'pSum' 63
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'7'.'0'.'minNAmount' 488
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'7'.'0'.'minPAmount' 356
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'7'.'0'.'grossMarginHa' -758
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 151
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 462
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' -76
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 128
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 377
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -569
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 10
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1239
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'7'.'0'.'nSum' 138
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 414
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2424
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'12'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'12'.'0'.'minNAmount' 337
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 979
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 65
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 74
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -385
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 104
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 219
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -524
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 337
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -580
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 191
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 541
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 467
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'12'.'0'.'nSum' 122
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'12'.'0'.'minNAmount' 285
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 46
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'12'.'0'.'nSum' 158
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'12'.'0'.'pSum' 63
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'12'.'0'.'minNAmount' 419
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'12'.'0'.'minPAmount' 235
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'12'.'0'.'grossMarginHa' -721
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 151
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 393
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' -39
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 128
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 308
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -532
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 10
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1245
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'12'.'0'.'nSum' 138
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 345
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2461
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'15'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'15'.'0'.'minNAmount' 296
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1001
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 65
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 33
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -376
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 104
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 177
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -501
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 296
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -558
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 191
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 499
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 489
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'15'.'0'.'nSum' 122
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'15'.'0'.'minNAmount' 244
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 67
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'15'.'0'.'nSum' 158
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'15'.'0'.'pSum' 63
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'15'.'0'.'minNAmount' 377
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'15'.'0'.'minPAmount' 163
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'15'.'0'.'grossMarginHa' -699
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 151
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 351
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' -17
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 128
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 266
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -510
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 10
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1249
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'15'.'0'.'nSum' 138
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 303
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2484
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'20'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'20'.'0'.'minNAmount' 226
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1038
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 65
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -373
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 104
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 108
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -476
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 226
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -540
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 191
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 430
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 526
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'20'.'0'.'nSum' 122
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'20'.'0'.'minNAmount' 175
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 104
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'20'.'0'.'nSum' 158
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'20'.'0'.'pSum' 63
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'20'.'0'.'minNAmount' 308
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'20'.'0'.'minPAmount' 42
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'20'.'0'.'grossMarginHa' -662
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 151
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 282
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 16
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 128
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 197
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -494
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 10
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1255
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'20'.'0'.'nSum' 138
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 234
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2520
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'25'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'25'.'0'.'minNAmount' 157
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1070
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 65
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -379
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 104
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 39
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -466
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 157
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -530
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 191
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 361
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 546
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'25'.'0'.'nSum' 122
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'25'.'0'.'minNAmount' 105
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 132
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'25'.'0'.'nSum' 158
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'25'.'0'.'pSum' 63
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'25'.'0'.'minNAmount' 239
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'25'.'0'.'grossMarginHa' -642
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 151
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 213
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 26
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 128
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 127
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -484
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 10
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1262
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'25'.'0'.'nSum' 138
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 164
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2553
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'30'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'30'.'0'.'minNAmount' 88
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1079
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 65
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -386
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 104
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -462
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 136
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 88
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -521
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 191
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 291
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 556
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'30'.'0'.'nSum' 122
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'30'.'0'.'minNAmount' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 142
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'30'.'0'.'nSum' 158
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'30'.'0'.'pSum' 63
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'30'.'0'.'minNAmount' 169
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterraps'.'30'.'0'.'grossMarginHa' -632
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 151
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 143
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 36
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 128
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 58
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -474
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 10
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1268
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'30'.'0'.'nSum' 138
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 95
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2562
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'0'.'0'.'nSum' 106
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'0'.'0'.'minNAmount' 393
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1025
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 49
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 181
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -443
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 86
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 319
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -579
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 108
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 400
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -626
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 155
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 574
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 558
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'0'.'0'.'nSum' 98
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'0'.'0'.'minNAmount' 363
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 634
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'0'.'0'.'nSum' 128
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'0'.'0'.'pSum' 63
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'0'.'0'.'minNAmount' 474
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'0'.'0'.'minPAmount' 525
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'0'.'0'.'grossMarginHa' -765
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 125
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 463
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 127
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 104
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 385
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -582
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 8
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 30
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1235
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'0'.'0'.'nSum' 112
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 415
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 3157
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'5'.'0'.'nSum' 106
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'5'.'0'.'minNAmount' 323
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1060
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 49
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 112
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -407
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 86
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 249
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -543
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 108
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 331
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -591
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 155
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 505
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 593
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'5'.'0'.'nSum' 98
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'5'.'0'.'minNAmount' 294
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 669
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'5'.'0'.'nSum' 128
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'5'.'0'.'pSum' 63
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'5'.'0'.'minNAmount' 405
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'5'.'0'.'minPAmount' 404
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'5'.'0'.'grossMarginHa' -730
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 125
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 394
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 162
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 104
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 316
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -547
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 8
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1223
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'5'.'0'.'nSum' 112
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 345
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 3193
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'7'.'0'.'nSum' 106
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'7'.'0'.'minNAmount' 296
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1075
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 49
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 84
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -392
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 86
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 221
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -528
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 108
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 303
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -576
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 155
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 477
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 608
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'7'.'0'.'nSum' 98
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'7'.'0'.'minNAmount' 266
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 684
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'7'.'0'.'nSum' 128
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'7'.'0'.'pSum' 63
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'7'.'0'.'minNAmount' 377
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'7'.'0'.'minPAmount' 356
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'7'.'0'.'grossMarginHa' -714
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 125
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 366
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 177
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 104
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 288
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -531
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 8
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1224
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'7'.'0'.'nSum' 112
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 318
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 3208
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'12'.'0'.'nSum' 106
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'12'.'0'.'minNAmount' 226
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1114
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 49
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 15
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -353
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 86
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 152
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -490
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 108
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 234
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -537
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 155
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 408
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 647
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'12'.'0'.'nSum' 98
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'12'.'0'.'minNAmount' 197
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 723
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'12'.'0'.'nSum' 128
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'12'.'0'.'pSum' 63
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'12'.'0'.'minNAmount' 308
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'12'.'0'.'minPAmount' 235
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'12'.'0'.'grossMarginHa' -676
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 125
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 297
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 216
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 104
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 219
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -493
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 8
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1229
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'12'.'0'.'nSum' 112
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 248
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 3247
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'15'.'0'.'nSum' 106
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'15'.'0'.'minNAmount' 185
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1137
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 49
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -348
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 86
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 111
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -467
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 108
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 192
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -514
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 155
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 366
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 670
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'15'.'0'.'nSum' 98
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'15'.'0'.'minNAmount' 155
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 746
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'15'.'0'.'nSum' 128
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'15'.'0'.'pSum' 63
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'15'.'0'.'minNAmount' 266
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'15'.'0'.'minPAmount' 163
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'15'.'0'.'grossMarginHa' -653
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 125
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 255
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 239
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 104
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 177
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -470
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 8
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1231
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'15'.'0'.'nSum' 112
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 207
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 3270
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'20'.'0'.'nSum' 106
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'20'.'0'.'minNAmount' 115
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1175
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 49
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -352
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 86
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 41
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -439
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 108
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 123
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -495
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 155
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 297
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 708
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'20'.'0'.'nSum' 98
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'20'.'0'.'minNAmount' 86
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 784
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'20'.'0'.'nSum' 128
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'20'.'0'.'pSum' 63
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'20'.'0'.'minNAmount' 197
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'20'.'0'.'minPAmount' 42
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'20'.'0'.'grossMarginHa' -615
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 125
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 186
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 273
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 104
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 108
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -452
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 8
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1236
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'20'.'0'.'nSum' 112
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 137
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 3308
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'25'.'0'.'nSum' 106
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'25'.'0'.'minNAmount' 46
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1208
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 49
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -357
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 86
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -433
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 108
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 53
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -483
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 155
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 227
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 731
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'25'.'0'.'nSum' 98
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'25'.'0'.'minNAmount' 16
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 814
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'25'.'0'.'nSum' 128
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'25'.'0'.'pSum' 63
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'25'.'0'.'minNAmount' 127
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'25'.'0'.'grossMarginHa' -592
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 125
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 116
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 285
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 104
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 39
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -440
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 8
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1241
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'25'.'0'.'nSum' 112
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 68
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 3342
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'30'.'0'.'nSum' 106
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1215
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 49
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -362
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 86
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -438
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 108
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -474
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 155
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 158
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 742
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'30'.'0'.'nSum' 98
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 814
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'30'.'0'.'nSum' 128
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'30'.'0'.'pSum' 63
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'30'.'0'.'minNAmount' 58
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterraps'.'30'.'0'.'grossMarginHa' -581
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 125
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 47
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 296
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 104
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -435
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 8
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1245
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'30'.'0'.'nSum' 112
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 3354
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'0'.'0'.'nSum' 86
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'0'.'0'.'minNAmount' 319
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 739
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 29
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 107
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -435
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 66
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 244
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -571
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 88
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 326
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -619
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 135
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 500
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 361
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'0'.'0'.'nSum' 78
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'0'.'0'.'minNAmount' 289
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 343
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'0'.'0'.'nSum' 108
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'0'.'0'.'pSum' 63
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'0'.'0'.'minNAmount' 400
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'0'.'0'.'minPAmount' 525
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'0'.'0'.'grossMarginHa' -758
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 105
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 389
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 7
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 84
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 311
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -575
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' -12
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1235
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'0'.'0'.'nSum' 92
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 341
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 2271
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'5'.'0'.'nSum' 86
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'5'.'0'.'minNAmount' 249
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 774
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 29
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 38
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -400
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 66
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 175
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -536
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 88
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 257
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -584
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 135
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 431
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 396
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'5'.'0'.'nSum' 78
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'5'.'0'.'minNAmount' 220
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 378
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'5'.'0'.'nSum' 108
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'5'.'0'.'pSum' 63
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'5'.'0'.'minNAmount' 331
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'5'.'0'.'minPAmount' 404
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'5'.'0'.'grossMarginHa' -723
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 105
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 320
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 42
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 84
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 242
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -540
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' -12
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1232
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'5'.'0'.'nSum' 92
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 271
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2306
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'7'.'0'.'nSum' 86
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'7'.'0'.'minNAmount' 221
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 789
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 29
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 10
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -385
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 66
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 147
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -521
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 88
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 229
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -569
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 135
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 403
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 411
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'7'.'0'.'nSum' 78
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'7'.'0'.'minNAmount' 192
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 393
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'7'.'0'.'nSum' 108
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'7'.'0'.'pSum' 63
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'7'.'0'.'minNAmount' 303
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'7'.'0'.'minPAmount' 356
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'7'.'0'.'grossMarginHa' -708
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 105
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 292
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 57
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 84
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 214
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -525
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' -12
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1234
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'7'.'0'.'nSum' 92
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 244
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2321
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'12'.'0'.'nSum' 86
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'12'.'0'.'minNAmount' 152
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 827
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 29
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -359
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 66
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 78
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -483
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 88
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 160
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -531
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 135
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 334
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 449
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'12'.'0'.'nSum' 78
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'12'.'0'.'minNAmount' 122
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 431
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'12'.'0'.'nSum' 108
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'12'.'0'.'pSum' 63
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'12'.'0'.'minNAmount' 234
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'12'.'0'.'minPAmount' 235
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'12'.'0'.'grossMarginHa' -670
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 105
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 222
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 95
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 84
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 145
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -487
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' -12
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1239
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'12'.'0'.'nSum' 92
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 174
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2359
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'15'.'0'.'nSum' 86
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'15'.'0'.'minNAmount' 111
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 849
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 29
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -359
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 66
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 36
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -460
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 88
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 118
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -509
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 135
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 292
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 471
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'15'.'0'.'nSum' 78
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'15'.'0'.'minNAmount' 81
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 453
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'15'.'0'.'nSum' 108
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'15'.'0'.'pSum' 63
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'15'.'0'.'minNAmount' 192
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'15'.'0'.'minPAmount' 163
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'15'.'0'.'grossMarginHa' -647
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 105
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 181
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 117
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 84
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 103
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -464
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' -12
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1242
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'15'.'0'.'nSum' 92
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 133
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2382
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'20'.'0'.'nSum' 86
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'20'.'0'.'minNAmount' 41
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 887
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 29
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -364
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 66
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -440
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 88
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 49
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -490
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 135
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 223
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 509
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'20'.'0'.'nSum' 78
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'20'.'0'.'minNAmount' 12
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 490
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'20'.'0'.'nSum' 108
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'20'.'0'.'pSum' 63
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'20'.'0'.'minNAmount' 123
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'20'.'0'.'minPAmount' 42
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'20'.'0'.'grossMarginHa' -610
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 105
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 112
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 151
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 84
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 34
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -447
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' -12
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1247
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'20'.'0'.'nSum' 92
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 63
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2419
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'25'.'0'.'nSum' 86
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'25'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 914
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 29
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -370
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 66
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -446
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 88
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -482
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 135
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 153
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 530
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'25'.'0'.'nSum' 78
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'25'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 508
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'25'.'0'.'nSum' 108
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'25'.'0'.'pSum' 63
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'25'.'0'.'minNAmount' 53
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'25'.'0'.'grossMarginHa' -589
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 105
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 42
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 162
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 84
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -443
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' -12
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1253
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'25'.'0'.'nSum' 92
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2452
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'30'.'0'.'nSum' 86
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 908
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 29
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -375
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 66
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -451
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 88
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -488
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 135
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 84
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 541
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'30'.'0'.'nSum' 78
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 502
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'30'.'0'.'nSum' 108
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'30'.'0'.'pSum' 63
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterraps'.'30'.'0'.'grossMarginHa' -580
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 105
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 168
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 84
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -448
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' -12
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1258
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'30'.'0'.'nSum' 92
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 'cc74cf23-840a-4016-a5b6-144b4d228489'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2447
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'0'.'0'.'nSum' 106
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'0'.'0'.'minNAmount' 393
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1451
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 49
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 181
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -441
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 86
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 319
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -577
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 108
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 400
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -625
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 155
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 574
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 101
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'0'.'0'.'nSum' 98
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'0'.'0'.'minNAmount' 363
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 1742
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'0'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'0'.'0'.'pSum' 63
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'0'.'0'.'minNAmount' 474
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'0'.'0'.'minPAmount' 525
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'0'.'0'.'grossMarginHa' -763
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 474
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' 126
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 104
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 385
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -580
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' 8
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 30
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1234
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'0'.'0'.'nSum' 112
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 415
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 3153
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'5'.'0'.'nSum' 106
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'5'.'0'.'minNAmount' 323
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1487
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 49
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 112
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -405
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 86
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 249
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -541
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 108
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 331
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -589
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 155
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 505
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 137
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'5'.'0'.'nSum' 98
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'5'.'0'.'minNAmount' 294
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 1778
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'5'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'5'.'0'.'pSum' 63
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'5'.'0'.'minNAmount' 405
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'5'.'0'.'minPAmount' 404
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'5'.'0'.'grossMarginHa' -727
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 405
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' 162
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 104
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 316
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -544
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' 8
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1221
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'5'.'0'.'nSum' 112
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 345
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 3189
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'7'.'0'.'nSum' 106
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'7'.'0'.'minNAmount' 296
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1502
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 49
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 84
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -390
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 86
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 221
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -526
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 108
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 303
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -573
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 155
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 477
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 152
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'7'.'0'.'nSum' 98
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'7'.'0'.'minNAmount' 266
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 1793
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'7'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'7'.'0'.'pSum' 63
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'7'.'0'.'minNAmount' 377
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'7'.'0'.'minPAmount' 356
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'7'.'0'.'grossMarginHa' -712
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 377
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' 177
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 104
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 288
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -529
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' 8
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1222
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'7'.'0'.'nSum' 112
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 318
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 3204
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'12'.'0'.'nSum' 106
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'12'.'0'.'minNAmount' 226
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1542
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 49
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 15
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -351
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 86
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 152
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -487
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 108
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 234
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -534
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 155
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 408
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 191
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'12'.'0'.'nSum' 98
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'12'.'0'.'minNAmount' 197
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 1832
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'12'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'12'.'0'.'pSum' 63
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'12'.'0'.'minNAmount' 308
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'12'.'0'.'minPAmount' 235
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'12'.'0'.'grossMarginHa' -673
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 308
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' 216
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 104
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 219
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -490
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' 8
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1226
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'12'.'0'.'nSum' 112
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 248
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 3243
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'15'.'0'.'nSum' 106
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'15'.'0'.'minNAmount' 185
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1565
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 49
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -345
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 86
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 111
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -463
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 108
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 192
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -511
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 155
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 366
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 215
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'15'.'0'.'nSum' 98
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'15'.'0'.'minNAmount' 155
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 1856
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'15'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'15'.'0'.'pSum' 63
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'15'.'0'.'minNAmount' 266
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'15'.'0'.'minPAmount' 163
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'15'.'0'.'grossMarginHa' -650
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 266
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 240
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 104
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 177
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -466
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' 8
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1229
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'15'.'0'.'nSum' 112
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 207
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 3267
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'20'.'0'.'nSum' 106
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'20'.'0'.'minNAmount' 115
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1604
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 49
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -349
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 86
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 41
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -436
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 108
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 123
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -491
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 155
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 297
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 253
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'20'.'0'.'nSum' 98
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'20'.'0'.'minNAmount' 86
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 1894
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'20'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'20'.'0'.'pSum' 63
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'20'.'0'.'minNAmount' 197
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'20'.'0'.'minPAmount' 42
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'20'.'0'.'grossMarginHa' -611
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 197
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 274
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 104
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 108
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -448
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' 8
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1233
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'20'.'0'.'nSum' 112
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 137
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 3305
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'25'.'0'.'nSum' 106
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'25'.'0'.'minNAmount' 46
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1637
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 49
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -353
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 86
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -429
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 108
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 53
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -479
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 155
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 227
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 276
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'25'.'0'.'nSum' 98
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'25'.'0'.'minNAmount' 16
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 1924
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'25'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'25'.'0'.'pSum' 63
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'25'.'0'.'minNAmount' 127
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'25'.'0'.'grossMarginHa' -588
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 127
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 286
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 104
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 39
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -436
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' 8
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1237
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'25'.'0'.'nSum' 112
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 68
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 3340
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'30'.'0'.'nSum' 106
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1645
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 49
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -357
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 86
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -433
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 108
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -470
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 155
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 158
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 288
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'30'.'0'.'nSum' 98
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 1925
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'30'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'30'.'0'.'pSum' 63
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'30'.'0'.'minNAmount' 58
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterraps'.'30'.'0'.'grossMarginHa' -577
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 128
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 58
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 298
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 104
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -430
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' 8
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1241
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'30'.'0'.'nSum' 112
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 3352
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'0'.'0'.'nSum' 86
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'0'.'0'.'pSum' 68.96
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'0'.'0'.'minNAmount' 319
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'0'.'0'.'minPAmount' 575
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'0'.'0'.'grossMarginHa' 1097
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'0'.'0'.'nSum' 29
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'0'.'0'.'pSum' 36
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'0'.'0'.'minNAmount' 107
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'0'.'0'.'minPAmount' 300
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'0'.'0'.'grossMarginHa' -406
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'0'.'0'.'nSum' 66
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'0'.'0'.'pSum' 51.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'0'.'0'.'minNAmount' 244
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'0'.'0'.'minPAmount' 427
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'0'.'0'.'grossMarginHa' -542
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'0'.'0'.'nSum' 88
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'0'.'0'.'pSum' 47.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minNAmount' 326
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'0'.'0'.'minPAmount' 393
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'0'.'0'.'grossMarginHa' -589
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'0'.'0'.'nSum' 135
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'0'.'0'.'pSum' 63.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'0'.'0'.'minNAmount' 500
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'0'.'0'.'minPAmount' 527
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'0'.'0'.'grossMarginHa' 11
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'0'.'0'.'nSum' 78
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'0'.'0'.'pSum' 67.1
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'0'.'0'.'minNAmount' 289
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'0'.'0'.'minPAmount' 559
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'0'.'0'.'grossMarginHa' 1122
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'0'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'0'.'0'.'pSum' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'0'.'0'.'minNAmount' 400
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'0'.'0'.'minPAmount' 525
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'0'.'0'.'grossMarginHa' -729
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'0'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'0'.'0'.'pSum' 55.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'0'.'0'.'minNAmount' 400
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'0'.'0'.'minPAmount' 460
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'0'.'0'.'grossMarginHa' -102
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'nSum' 84
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'pSum' 46.4
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minNAmount' 311
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'minPAmount' 387
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'0'.'0'.'grossMarginHa' -545
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'0'.'0'.'nSum' -12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'0'.'0'.'pSum' 5.5
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'0'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'0'.'0'.'minPAmount' 46
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'0'.'0'.'grossMarginHa' -1211
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'0'.'0'.'nSum' 92
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'0'.'0'.'pSum' 69.44
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'0'.'0'.'minNAmount' 341
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'0'.'0'.'minPAmount' 579
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'0'.'0'.'grossMarginHa' 1996
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'5'.'0'.'nSum' 86
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'5'.'0'.'pSum' 68.96
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'5'.'0'.'minNAmount' 249
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'5'.'0'.'minPAmount' 454
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'5'.'0'.'grossMarginHa' 1134
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'5'.'0'.'nSum' 29
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'5'.'0'.'pSum' 36
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'5'.'0'.'minNAmount' 38
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'5'.'0'.'minPAmount' 179
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'5'.'0'.'grossMarginHa' -370
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'5'.'0'.'nSum' 66
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'5'.'0'.'pSum' 51.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'5'.'0'.'minNAmount' 175
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'5'.'0'.'minPAmount' 306
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'5'.'0'.'grossMarginHa' -506
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'5'.'0'.'nSum' 88
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'5'.'0'.'pSum' 47.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minNAmount' 257
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'5'.'0'.'minPAmount' 273
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'5'.'0'.'grossMarginHa' -553
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'5'.'0'.'nSum' 135
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'5'.'0'.'pSum' 63.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'5'.'0'.'minNAmount' 431
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'5'.'0'.'minPAmount' 406
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'5'.'0'.'grossMarginHa' 48
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'5'.'0'.'nSum' 78
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'5'.'0'.'pSum' 67.1
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'5'.'0'.'minNAmount' 220
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'5'.'0'.'minPAmount' 438
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'5'.'0'.'grossMarginHa' 1159
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'5'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'5'.'0'.'pSum' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'5'.'0'.'minNAmount' 331
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'5'.'0'.'minPAmount' 404
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'5'.'0'.'grossMarginHa' -692
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'5'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'5'.'0'.'pSum' 55.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'5'.'0'.'minNAmount' 331
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'5'.'0'.'minPAmount' 339
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'5'.'0'.'grossMarginHa' -66
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'nSum' 84
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'pSum' 46.4
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minNAmount' 242
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'minPAmount' 266
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'5'.'0'.'grossMarginHa' -509
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'5'.'0'.'nSum' -12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'5'.'0'.'pSum' 5.5
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'5'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'5'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'5'.'0'.'grossMarginHa' -1206
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'5'.'0'.'nSum' 92
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'5'.'0'.'pSum' 69.44
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'5'.'0'.'minNAmount' 271
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'5'.'0'.'minPAmount' 458
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'5'.'0'.'grossMarginHa' 2032
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'7'.'0'.'nSum' 86
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'7'.'0'.'pSum' 68.96
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'7'.'0'.'minNAmount' 221
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'7'.'0'.'minPAmount' 406
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'7'.'0'.'grossMarginHa' 1149
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'7'.'0'.'nSum' 29
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'7'.'0'.'pSum' 36
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'7'.'0'.'minNAmount' 10
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'7'.'0'.'minPAmount' 131
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'7'.'0'.'grossMarginHa' -354
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'7'.'0'.'nSum' 66
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'7'.'0'.'pSum' 51.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'7'.'0'.'minNAmount' 147
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'7'.'0'.'minPAmount' 258
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'7'.'0'.'grossMarginHa' -490
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'7'.'0'.'nSum' 88
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'7'.'0'.'pSum' 47.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minNAmount' 229
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'7'.'0'.'minPAmount' 224
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'7'.'0'.'grossMarginHa' -538
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'7'.'0'.'nSum' 135
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'7'.'0'.'pSum' 63.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'7'.'0'.'minNAmount' 403
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'7'.'0'.'minPAmount' 358
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'7'.'0'.'grossMarginHa' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'7'.'0'.'nSum' 78
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'7'.'0'.'pSum' 67.1
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'7'.'0'.'minNAmount' 192
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'7'.'0'.'minPAmount' 390
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'7'.'0'.'grossMarginHa' 1174
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'7'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'7'.'0'.'pSum' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'7'.'0'.'minNAmount' 303
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'7'.'0'.'minPAmount' 356
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'7'.'0'.'grossMarginHa' -677
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'7'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'7'.'0'.'pSum' 55.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'7'.'0'.'minNAmount' 303
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'7'.'0'.'minPAmount' 291
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'7'.'0'.'grossMarginHa' -50
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'nSum' 84
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'pSum' 46.4
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minNAmount' 214
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'minPAmount' 218
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'7'.'0'.'grossMarginHa' -494
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'7'.'0'.'nSum' -12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'7'.'0'.'pSum' 5.5
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'7'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'7'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'7'.'0'.'grossMarginHa' -1208
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'7'.'0'.'nSum' 92
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'7'.'0'.'pSum' 69.44
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'7'.'0'.'minNAmount' 244
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'7'.'0'.'minPAmount' 410
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'7'.'0'.'grossMarginHa' 2047
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'12'.'0'.'nSum' 86
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'12'.'0'.'pSum' 68.96
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'12'.'0'.'minNAmount' 152
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'12'.'0'.'minPAmount' 285
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'12'.'0'.'grossMarginHa' 1187
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'12'.'0'.'nSum' 29
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'12'.'0'.'pSum' 36
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'12'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'12'.'0'.'minPAmount' 10
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'12'.'0'.'grossMarginHa' -329
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'12'.'0'.'nSum' 66
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'12'.'0'.'pSum' 51.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'12'.'0'.'minNAmount' 78
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'12'.'0'.'minPAmount' 137
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'12'.'0'.'grossMarginHa' -452
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'12'.'0'.'nSum' 88
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'12'.'0'.'pSum' 47.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minNAmount' 160
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'12'.'0'.'minPAmount' 103
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'12'.'0'.'grossMarginHa' -500
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'12'.'0'.'nSum' 135
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'12'.'0'.'pSum' 63.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'12'.'0'.'minNAmount' 334
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'12'.'0'.'minPAmount' 237
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'12'.'0'.'grossMarginHa' 101
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'12'.'0'.'nSum' 78
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'12'.'0'.'pSum' 67.1
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'12'.'0'.'minNAmount' 122
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'12'.'0'.'minPAmount' 269
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'12'.'0'.'grossMarginHa' 1212
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'12'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'12'.'0'.'pSum' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'12'.'0'.'minNAmount' 234
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'12'.'0'.'minPAmount' 235
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'12'.'0'.'grossMarginHa' -639
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'12'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'12'.'0'.'pSum' 55.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'12'.'0'.'minNAmount' 234
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'12'.'0'.'minPAmount' 170
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'12'.'0'.'grossMarginHa' -12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'nSum' 84
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'pSum' 46.4
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minNAmount' 145
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'minPAmount' 97
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'12'.'0'.'grossMarginHa' -456
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'12'.'0'.'nSum' -12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'12'.'0'.'pSum' 5.5
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'12'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'12'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'12'.'0'.'grossMarginHa' -1213
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'12'.'0'.'nSum' 92
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'12'.'0'.'pSum' 69.44
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'12'.'0'.'minNAmount' 174
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'12'.'0'.'minPAmount' 289
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'12'.'0'.'grossMarginHa' 2086
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'15'.'0'.'nSum' 86
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'15'.'0'.'pSum' 68.96
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'15'.'0'.'minNAmount' 111
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'15'.'0'.'minPAmount' 212
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'15'.'0'.'grossMarginHa' 1210
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'15'.'0'.'nSum' 29
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'15'.'0'.'pSum' 36
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'15'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'15'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'15'.'0'.'grossMarginHa' -328
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'15'.'0'.'nSum' 66
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'15'.'0'.'pSum' 51.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'15'.'0'.'minNAmount' 36
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'15'.'0'.'minPAmount' 64
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'15'.'0'.'grossMarginHa' -429
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'15'.'0'.'nSum' 88
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'15'.'0'.'pSum' 47.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minNAmount' 118
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'15'.'0'.'minPAmount' 31
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'15'.'0'.'grossMarginHa' -477
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'15'.'0'.'nSum' 135
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'15'.'0'.'pSum' 63.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'15'.'0'.'minNAmount' 292
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'15'.'0'.'minPAmount' 164
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'15'.'0'.'grossMarginHa' 124
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'15'.'0'.'nSum' 78
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'15'.'0'.'pSum' 67.1
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'15'.'0'.'minNAmount' 81
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'15'.'0'.'minPAmount' 197
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'15'.'0'.'grossMarginHa' 1235
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'15'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'15'.'0'.'pSum' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'15'.'0'.'minNAmount' 192
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'15'.'0'.'minPAmount' 163
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'15'.'0'.'grossMarginHa' -616
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'15'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'15'.'0'.'pSum' 55.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'15'.'0'.'minNAmount' 192
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'15'.'0'.'minPAmount' 98
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'15'.'0'.'grossMarginHa' 10
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'nSum' 84
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'pSum' 46.4
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minNAmount' 103
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'minPAmount' 24
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'15'.'0'.'grossMarginHa' -433
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'15'.'0'.'nSum' -12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'15'.'0'.'pSum' 5.5
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'15'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'15'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'15'.'0'.'grossMarginHa' -1215
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'15'.'0'.'nSum' 92
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'15'.'0'.'pSum' 69.44
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'15'.'0'.'minNAmount' 133
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'15'.'0'.'minPAmount' 216
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'15'.'0'.'grossMarginHa' 2108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'20'.'0'.'nSum' 86
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'20'.'0'.'pSum' 68.96
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'20'.'0'.'minNAmount' 41
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'20'.'0'.'minPAmount' 91
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'20'.'0'.'grossMarginHa' 1247
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'20'.'0'.'nSum' 29
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'20'.'0'.'pSum' 36
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'20'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'20'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'20'.'0'.'grossMarginHa' -333
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'20'.'0'.'nSum' 66
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'20'.'0'.'pSum' 51.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'20'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'20'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'20'.'0'.'grossMarginHa' -409
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'20'.'0'.'nSum' 88
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'20'.'0'.'pSum' 47.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minNAmount' 49
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'20'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'20'.'0'.'grossMarginHa' -458
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'20'.'0'.'nSum' 135
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'20'.'0'.'pSum' 63.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'20'.'0'.'minNAmount' 223
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'20'.'0'.'minPAmount' 43
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'20'.'0'.'grossMarginHa' 161
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'20'.'0'.'nSum' 78
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'20'.'0'.'pSum' 67.1
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'20'.'0'.'minNAmount' 12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'20'.'0'.'minPAmount' 76
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'20'.'0'.'grossMarginHa' 1272
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'20'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'20'.'0'.'pSum' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'20'.'0'.'minNAmount' 123
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'20'.'0'.'minPAmount' 42
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'20'.'0'.'grossMarginHa' -579
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'20'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'20'.'0'.'pSum' 55.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'20'.'0'.'minNAmount' 123
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'20'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'20'.'0'.'grossMarginHa' 44
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'nSum' 84
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'pSum' 46.4
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minNAmount' 34
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'20'.'0'.'grossMarginHa' -415
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'20'.'0'.'nSum' -12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'20'.'0'.'pSum' 5.5
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'20'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'20'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'20'.'0'.'grossMarginHa' -1221
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'20'.'0'.'nSum' 92
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'20'.'0'.'pSum' 69.44
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'20'.'0'.'minNAmount' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'20'.'0'.'minPAmount' 95
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'20'.'0'.'grossMarginHa' 2146
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'25'.'0'.'nSum' 86
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'25'.'0'.'pSum' 68.96
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'25'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'25'.'0'.'grossMarginHa' 1275
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'25'.'0'.'nSum' 29
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'25'.'0'.'pSum' 36
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'25'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'25'.'0'.'grossMarginHa' -338
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'25'.'0'.'nSum' 66
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'25'.'0'.'pSum' 51.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'25'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'25'.'0'.'grossMarginHa' -414
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'25'.'0'.'nSum' 88
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'25'.'0'.'pSum' 47.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'25'.'0'.'grossMarginHa' -450
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'25'.'0'.'nSum' 135
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'25'.'0'.'pSum' 63.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'25'.'0'.'minNAmount' 153
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'25'.'0'.'grossMarginHa' 183
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'25'.'0'.'nSum' 78
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'25'.'0'.'pSum' 67.1
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'25'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'25'.'0'.'grossMarginHa' 1289
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'25'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'25'.'0'.'pSum' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'25'.'0'.'minNAmount' 53
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'25'.'0'.'grossMarginHa' -557
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'25'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'25'.'0'.'pSum' 55.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'25'.'0'.'minNAmount' 53
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'25'.'0'.'grossMarginHa' 55
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'nSum' 84
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'pSum' 46.4
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'25'.'0'.'grossMarginHa' -411
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'25'.'0'.'nSum' -12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'25'.'0'.'pSum' 5.5
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'25'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'25'.'0'.'grossMarginHa' -1226
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'25'.'0'.'nSum' 92
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'25'.'0'.'pSum' 69.44
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'25'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'25'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'25'.'0'.'grossMarginHa' 2179
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'30'.'0'.'nSum' 86
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'30'.'0'.'pSum' 68.96
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Mais - Silomais'.'30'.'0'.'grossMarginHa' 1269
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'30'.'0'.'nSum' 29
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'30'.'0'.'pSum' 36
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommerhafer - Futterhafer'.'30'.'0'.'grossMarginHa' -344
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'30'.'0'.'nSum' 66
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'30'.'0'.'pSum' 51.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Sommergerste - Braugerste'.'30'.'0'.'grossMarginHa' -420
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'30'.'0'.'nSum' 88
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'30'.'0'.'pSum' 47.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintertriticale - Futtertriticale'.'30'.'0'.'grossMarginHa' -456
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'30'.'0'.'nSum' 135
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'30'.'0'.'pSum' 63.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'30'.'0'.'minNAmount' 84
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterweizen - Brotweizen'.'30'.'0'.'grossMarginHa' 194
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'30'.'0'.'nSum' 78
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'30'.'0'.'pSum' 67.1
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Zuckerrüben'.'30'.'0'.'grossMarginHa' 1284
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'30'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'30'.'0'.'pSum' 63
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterraps'.'30'.'0'.'grossMarginHa' -549
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'30'.'0'.'nSum' 108
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'30'.'0'.'pSum' 55.2
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Wintergerste - Futtergerste'.'30'.'0'.'grossMarginHa' 64
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'nSum' 84
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'pSum' 46.4
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Winterroggen - Mahl- und Brotroggen'.'30'.'0'.'grossMarginHa' -416
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'30'.'0'.'nSum' -12
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'30'.'0'.'pSum' 5.5
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Erbsen, Markerbsen'.'30'.'0'.'grossMarginHa' -1231
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'30'.'0'.'nSum' 92
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'30'.'0'.'pSum' 69.44
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'30'.'0'.'minNAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'30'.'0'.'minPAmount' 0
 'dc298ebb-1b27-411a-8024-af0623f621c5'.'Stärkekartoffeln'.'30'.'0'.'grossMarginHa' 2174
/;

parameter p_catchCropCosts(curPlots) /
 '027a3aaa-a6a4-4cd1-872a-a9efdef39369' 38.64
 '119f0d98-ec65-4752-802f-3cb0ca4d205f' 39.69
 '2bf8c74f-0fd1-4b51-bb5e-4a8bf6a7eac8' 44.99
 '2d64e2d8-1909-4abf-9c42-71041141645a' 37.87
 '2e6ab89a-ddf1-40a6-8c02-14d0bd7e93c8' 37.59
 '558f9729-9f85-4837-ad21-033762c4ba5d' 40.13
 '5d9c7dc1-513c-4d3b-bc72-83b9e25ace52' 40.9
 '62ffe0b8-d621-436b-a76a-1f44235178e0' 39.27
 '9ce07e77-2a1c-484d-8e74-678cd1d30f5f' 39.11
 '9dc87df6-5113-40c7-9d16-b27f2485faaa' 38.64
 '9f7e7bdf-919e-450c-ab20-1998696397a3' 40.83
 'a9d0ecf3-e61c-486c-90b3-bb1baab35b4d' 44.7
 'aa5973e8-2392-4ca2-a485-7d8e834ded31' 38.43
 'af3d2471-1e40-4c82-b332-0147a237b3dd' 50.16
 'b54a00ad-8fe1-4d1d-8c8c-fbab6a371204' 37.95
 'bc06dfd4-8f54-4b13-a796-2e634cabdc9d' 40.18
 'c3ab0ff2-328b-4f60-8520-a7d2b3607133' 38.3
 'cc74cf23-840a-4016-a5b6-144b4d228489' 39.72
 'ce0201fd-3cd5-4c6f-8755-5a6a0ebd9556' 37.93
 'dc298ebb-1b27-411a-8024-af0623f621c5' 38.41
/;

parameter p_laborReq(crops,halfMonths) /

/;

set man_attr /
amount
n
p
k
minUsagePercent
/;

parameter p_manure(man_attr) /
  "amount" 3000
  "n" 7.8
  "p" 2.9
  "k" 3.9
  "minUsagePercent" 60
/;

parameter p_solid(man_attr) /

/;

