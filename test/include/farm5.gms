* -------------------------------
* Fruchtfolge Model - Include file
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2019
* -------------------------------

* Static data
set plotAttr / size /;
set cropAttr / maxShare /;
set symbol / lt,gt /;
set months /jan,feb,mrz,apr,mai,jun,jul,aug,sep,okt,nov,dez/;
set years / 2001*2050 /;
set manAmounts /0,10,15,20,25,30,40,50,60/;
set solidAmounts /'0','10','15','20','25','30'/;
set catchCrop /true, false/;
set autumnFert /true, false/;
$onempty
$offdigit
set curYear(years) / 2020 /;
$setglobal duev2020 "true"
scalar manStorage /750 /;
scalar manPriceSpring /15 /;
scalar manPriceAutumn /30 /;
set curPlots /
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'
 '1f492f11-9c3e-4b11-a541-3760b402dab6'
 '28243ecc-9876-466a-a173-634d90231b51'
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'
 '3d774649-9d76-431a-9677-9220174a4dba'
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'
 '4694007b-51e0-4f3c-84cb-b14cba355c32'
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'
 '5668277b-f921-4fce-8a9a-97671129a6dc'
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'
 '6086fb8f-f0ea-4a26-ae4e-514162290163'
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'
 '7042bb8a-bc40-47b5-984e-4263ba248181'
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'
 '7de7957f-070b-4703-800d-d90b8cd5ed59'
 '923722aa-0abf-414d-a012-7195c217b0c3'
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'
 'a53d5464-768b-41af-b3aa-0ac73317027f'
 'c27c268f-b88a-4593-8ff9-19f03f90b239'
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'
 'de598ccf-06fe-4623-8a85-43eac48557f4'
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'
 'e5786d24-5768-4c02-b11c-a9893905f57d'
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'
 'f27053dc-f06f-47b6-9984-d7d60812ff37'
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'
/;

parameter p_plotData(curPlots,plotAttr) /
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.size 10.04
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.size 0.21
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.size 5.33
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.size 8.41
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.size 0.06
 '28243ecc-9876-466a-a173-634d90231b51'.size 3.6
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.size 2
 '3d774649-9d76-431a-9677-9220174a4dba'.size 0.5
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.size 5.87
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.size 0.4
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.size 3.49
 '5668277b-f921-4fce-8a9a-97671129a6dc'.size 4.01
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.size 0.08
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.size 1.72
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.size 0.15
 '7042bb8a-bc40-47b5-984e-4263ba248181'.size 0.07
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.size 13.63
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.size 0.1
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.size 2.82
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.size 8.29
 '923722aa-0abf-414d-a012-7195c217b0c3'.size 5.73
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.size 0.08
 'a53d5464-768b-41af-b3aa-0ac73317027f'.size 9.11
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.size 0.13
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.size 0.58
 'de598ccf-06fe-4623-8a85-43eac48557f4'.size 9.52
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.size 12.02
 'e5786d24-5768-4c02-b11c-a9893905f57d'.size 11.03
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.size 0.06
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.size 8.98
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.size 5.66
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.size 4.83
/;

set plots_duevEndangered(curPlots) /
 '081fdec1-4459-489f-978b-5d6fa63ca2a4' 'YES'
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1' 'YES'
 '1f492f11-9c3e-4b11-a541-3760b402dab6' 'YES'
 '28243ecc-9876-466a-a173-634d90231b51' 'YES'
 '285ac8d0-34bb-47d8-8427-8a418ef29b43' 'YES'
 '3d774649-9d76-431a-9677-9220174a4dba' 'YES'
 '4694007b-51e0-4f3c-84cb-b14cba355c32' 'YES'
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368' 'YES'
 '5668277b-f921-4fce-8a9a-97671129a6dc' 'YES'
 '5efd8139-d0c9-4c15-b820-7d4ee13be971' 'YES'
 '6086fb8f-f0ea-4a26-ae4e-514162290163' 'YES'
 '7042bb8a-bc40-47b5-984e-4263ba248181' 'YES'
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d' 'YES'
 '7d827f10-2ae8-4409-95a2-1c7120f9985a' 'YES'
 '9dc04f00-9e0a-463e-8933-18223bb9d09f' 'YES'
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e' 'YES'
 'f27053dc-f06f-47b6-9984-d7d60812ff37' 'YES'
/;

set plots_permPast(curPlots) /
 'ca465ee4-6845-41d9-91e3-c7d5aa841934' 'YES'
/;

set curCrops /
 ''
 'Kleegras'
 'Acker-/Puff-/Pferdebohne'
 'Winterweichweizen'
 'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'
 'Silomais (als Hauptfutter)'
 'Winterroggen'
 'Erbsen zur Körnergewinnung'
 'Kartoffeln'
 'Möhre (auch Futtermöhre)'
 'Grünland (Dauergrünland)'
 'Winterraps'
 'Wintergerste'
 'Zuckerrüben'
/;

set cropGroup /
 ''
 'Gras oder andere Grünfutterpflanzen'
 'Gattung: Vicia (Wicken)'
 'Winterweizen'
 'Brachliegendes Land'
 'Gattung: Zea (Mais)'
 'Winterroggen'
 'Gattung: Pisum (Erbse)'
 'Art: Solanum tuberosum (Kartoffel)'
 'Gattung: Daucus (Möhren)'
 'Dauergrünland'
 'Winterraps'
 'Wintergerste'
 'Gattung: Beta (Rüben)'
/;

set crops_cropGroup(curCrops,cropGroup) /
 ''.''
 'Kleegras'.'Gras oder andere Grünfutterpflanzen'
 'Acker-/Puff-/Pferdebohne'.'Gattung: Vicia (Wicken)'
 'Winterweichweizen'.'Winterweizen'
 'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'Brachliegendes Land'
 'Silomais (als Hauptfutter)'.'Gattung: Zea (Mais)'
 'Winterroggen'.'Winterroggen'
 'Erbsen zur Körnergewinnung'.'Gattung: Pisum (Erbse)'
 'Kartoffeln'.'Art: Solanum tuberosum (Kartoffel)'
 'Möhre (auch Futtermöhre)'.'Gattung: Daucus (Möhren)'
 'Grünland (Dauergrünland)'.'Dauergrünland'
 'Winterraps'.'Winterraps'
 'Wintergerste'.'Wintergerste'
 'Zuckerrüben'.'Gattung: Beta (Rüben)'
/;

parameter p_cropData(curCrops,cropAttr) /
'Kleegras'.maxShare 100
'Acker-/Puff-/Pferdebohne'.maxShare 16.67
'Winterweichweizen'.maxShare 33.33
'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.maxShare 100
'Silomais (als Hauptfutter)'.maxShare 33.33
'Winterroggen'.maxShare 33.33
'Erbsen zur Körnergewinnung'.maxShare 16.67
'Kartoffeln'.maxShare 25
'Möhre (auch Futtermöhre)'.maxShare 20
'Grünland (Dauergrünland)'.maxShare 100
'Winterraps'.maxShare 20
'Wintergerste'.maxShare 33.33
'Zuckerrüben'.maxShare 20
/;

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
nSum
pSum
minNAmount
minPAmount
autumnFertm3
grossMarginHa
efaFactor
fixCosts
grossMarginNoCropEff
/;

parameter p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,*) /
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'jan' 1.68
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'feb' 6.65
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'mrz' 4.65
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'apr' 6.53
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'mai' 1.12
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'jul' 37.81
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'aug' 21.78
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'okt' 2.97
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'nSum' 153
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'pSum' 61.2
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'minNAmount' 378
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'minPAmount' 31
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'autumnFertm3' 0
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'grossMarginHa' 605
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'efaFactor' 0
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'fixCosts' 351.12
 'e0e6fecf-6140-4c57-bb30-d524f01f60dd'.'Winterraps'.'25'.'0'.'false'.'false'.'grossMarginNoCropEff' 485
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'nSum' -80
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'pSum' 0
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'minNAmount' 0
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'minPAmount' 0
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'grossMarginHa' -422
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'efaFactor' 1
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'fixCosts' 360.25
 'e8f441d4-9c3d-4bf5-b9c2-eed2698ab906'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' -422
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'jan' 1.49
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'feb' 5.79
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'mrz' 4.28
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'apr' 6.56
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'mai' 1.2
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'jul' 33.51
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'aug' 20.04
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'sep' 7.93
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'okt' 3.24
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'nSum' 93
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'pSum' 61.2
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'minNAmount' 193
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'minPAmount' 127
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'autumnFertm3' 29.41176470588235
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'grossMarginHa' 572
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'efaFactor' 0
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'fixCosts' 360.39
 '00933ddd-d46d-47d5-86dd-d492f0bd92ad'.'Winterraps'.'20'.'0'.'false'.'true'.'grossMarginNoCropEff' 452
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'mrz' 0.43
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'apr' 1.8
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'mai' 0.74
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'sep' 3.65
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'okt' 1.15
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'nSum' 86
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'pSum' 70.08
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'minNAmount' 319
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'minPAmount' 584
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'autumnFertm3' 0
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'grossMarginHa' 379
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'efaFactor' 1
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'fixCosts' 557.22
 '3d774649-9d76-431a-9677-9220174a4dba'.'Silomais (als Hauptfutter)'.'0'.'0'.'true'.'false'.'grossMarginNoCropEff' 238
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'feb' 0.81
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'mrz' 0.57
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'apr' 2.02
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'mai' 0.32
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'aug' 4.91
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'sep' 7.43
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'okt' 1.88
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'nSum' 81
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'pSum' 53.6
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'minNAmount' 300
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'minPAmount' 447
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginHa' 583
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'efaFactor' 0
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'fixCosts' 411.66
 '6086fb8f-f0ea-4a26-ae4e-514162290163'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 583
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'feb' 0.93
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'mrz' 0.64
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'apr' 2.32
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'mai' 0.35
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'aug' 5.67
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'sep' 8.58
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'okt' 2.17
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'nSum' 81
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'pSum' 53.6
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'minNAmount' 300
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'minPAmount' 447
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'autumnFertm3' 0
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'grossMarginHa' 584
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'efaFactor' 0
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'fixCosts' 409.72
 '285ac8d0-34bb-47d8-8427-8a418ef29b43'.'Winterroggen'.'0'.'0'.'false'.'true'.'grossMarginNoCropEff' 584
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'feb' 0.09
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'mrz' 0.23
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'apr' 0.5
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'mai' 0.21
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'jun' 0.31
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'jul' 0.47
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'aug' 0.54
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'sep' 2.9
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'okt' 0.02
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'nov' 0.4
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'nSum' 101
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'pSum' 63.84
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'minNAmount' 185
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'minPAmount' 53
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'autumnFertm3' 0
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'grossMarginHa' 3020
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'efaFactor' 0
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'fixCosts' 881.74
 '638f9f47-3b9f-4ad8-b0d9-8a5d97e55c7d'.'Kartoffeln'.'25'.'0'.'false'.'false'.'grossMarginNoCropEff' 2482
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'feb' 0.72
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'mrz' 8.93
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'apr' 0.61
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'mai' 3.37
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'jul' 0.56
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'aug' 2.75
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'sep' 5.99
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'okt' 9.47
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'nSum' 75
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'pSum' 64.1
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'minNAmount' 278
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'minPAmount' 534
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'autumnFertm3' 0
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'grossMarginHa' 971
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'efaFactor' 1
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'fixCosts' 369.15
 '5668277b-f921-4fce-8a9a-97671129a6dc'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'grossMarginNoCropEff' 761
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'feb' 1.59
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'mrz' 1.06
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'apr' 3.96
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'mai' 0.56
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'aug' 9.66
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'sep' 14.57
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'okt' 3.73
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'nSum' 81
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'pSum' 53.6
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'minNAmount' 300
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'minPAmount' 447
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginHa' -157
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'efaFactor' 0
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'fixCosts' 401.19
 '4a7fc5e1-447e-4fea-9ae5-66eb82570368'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 588
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'feb' 1.61
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'mrz' 1.05
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'apr' 3.66
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'mai' 0.54
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'aug' 9.68
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'sep' 14.49
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'okt' 3.45
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'nSum' 41
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'pSum' 53.6
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'minNAmount' 152
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'minPAmount' 447
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginHa' 715
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'efaFactor' 0
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'fixCosts' 394.57
 '28243ecc-9876-466a-a173-634d90231b51'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 631
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'mrz' 15.62
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'apr' 1.11
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'mai' 4.41
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'aug' 11.97
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'sep' 5.76
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'okt' 16.89
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'nSum' 10
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'pSum' 45.6
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'minNAmount' 37
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'minPAmount' 380
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'grossMarginHa' 83
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'efaFactor' 1
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'fixCosts' 331.21
 '7de7957f-070b-4703-800d-d90b8cd5ed59'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 20
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'nSum' -80
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'pSum' 0
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'minNAmount' 0
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'minPAmount' 0
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'grossMarginHa' -422
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'efaFactor' 1
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'fixCosts' 360.25
 '036d6c9a-ebc5-4956-8bc7-558988e94db8'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' -422
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'feb' 3.36
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'mrz' 2.52
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'apr' 12.37
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'mai' 2.52
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'jun' 5.84
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'aug' 21.41
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'sep' 17.86
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'okt' 17.98
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'nSum' 131
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'pSum' 62.4
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'minNAmount' 485
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'minPAmount' 520
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'grossMarginHa' 304
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'efaFactor' 0
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'fixCosts' 410.55
 '19a9b3fa-94ae-40b9-aea0-db27e91732b1'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 380
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'feb' 0.93
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'mrz' 11.32
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'apr' 0.91
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'mai' 4.26
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'jul' 0.74
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'aug' 3.36
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'sep' 8.13
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'okt' 12.45
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'nSum' 75
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'pSum' 64.1
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'minNAmount' 278
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'minPAmount' 534
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'autumnFertm3' 0
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'grossMarginHa' 915
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'efaFactor' 1
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'fixCosts' 354.24
 'f27053dc-f06f-47b6-9984-d7d60812ff37'.'Zuckerrüben'.'0'.'0'.'true'.'false'.'grossMarginNoCropEff' 774
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'mrz' 5.53
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'apr' 19.17
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'mai' 6.62
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'sep' 50.23
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'okt' 16.05
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'nSum' 126
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'pSum' 70.08
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'minNAmount' 467
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'minPAmount' 584
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'grossMarginHa' 389
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'efaFactor' 0
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'fixCosts' 494.56
 'a53d5464-768b-41af-b3aa-0ac73317027f'.'Silomais (als Hauptfutter)'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 389
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'feb' 4.32
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'mrz' 7.56
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'apr' 16.47
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'mai' 2.65
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'jun' 2.55
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'jul' 3.83
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'aug' 12.25
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'sep' 153.33
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'okt' 0.23
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'nov' 17.61
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'nSum' 121
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'pSum' 63.84
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'minNAmount' 259
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'minPAmount' 53
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'autumnFertm3' 0
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'grossMarginHa' 2997
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'efaFactor' 0
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'fixCosts' 728.85
 'de598ccf-06fe-4623-8a85-43eac48557f4'.'Kartoffeln'.'25'.'0'.'false'.'false'.'grossMarginNoCropEff' 2636
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'nSum' -80
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'pSum' 0
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'minNAmount' 0
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'minPAmount' 0
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'grossMarginHa' -422
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'efaFactor' 1
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'fixCosts' 360.25
 'c27c268f-b88a-4593-8ff9-19f03f90b239'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' -422
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'nSum' -80
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'pSum' 0
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'minNAmount' 0
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'minPAmount' 0
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'autumnFertm3' 0
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'grossMarginHa' -538
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'efaFactor' 2
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'fixCosts' 360.25
 '5efd8139-d0c9-4c15-b820-7d4ee13be971'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'grossMarginNoCropEff' -538
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'nSum' -80
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'pSum' 0
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'minNAmount' 0
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'minPAmount' 0
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'autumnFertm3' 0
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'grossMarginHa' -538
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'efaFactor' 2
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'fixCosts' 360.25
 '9dc04f00-9e0a-463e-8933-18223bb9d09f'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'grossMarginNoCropEff' -538
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'feb' 3.53
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'mrz' 2.52
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'apr' 7.24
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'mai' 1.38
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'aug' 20.97
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'sep' 30.5
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'okt' 6.51
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'nSum' 91
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'pSum' 53.6
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'minNAmount' 337
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'minPAmount' 447
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginHa' 611
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'efaFactor' 0
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'fixCosts' 359.39
 'e90095e3-6bbb-4a66-8ebc-eb9a3b95c82e'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 611
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'feb' 0.4
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'mrz' 0.21
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'apr' 0.99
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'mai' 0.16
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'jun' 0.44
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'aug' 1.25
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'sep' 1.03
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'okt' 1.29
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'nSum' 131
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'pSum' 62.4
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'minNAmount' 410
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'minPAmount' 328
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'autumnFertm3' 0
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'grossMarginHa' 72
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'efaFactor' 0
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'fixCosts' 506.27
 '4694007b-51e0-4f3c-84cb-b14cba355c32'.'Winterweichweizen'.'10'.'0'.'false'.'false'.'grossMarginNoCropEff' 352
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'feb' 4.74
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'mrz' 3.07
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'apr' 12.68
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'mai' 3.07
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'jun' 6.11
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'aug' 30.09
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'sep' 25.5
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'okt' 20.48
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'nSum' 131
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'pSum' 62.4
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'minNAmount' 485
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'minPAmount' 520
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'grossMarginHa' 337
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'efaFactor' 0
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'fixCosts' 369.78
 '74c2f48d-a1a4-448c-ae66-5f8d9093768d'.'Winterweichweizen'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 413
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'jan' 0.54
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'feb' 0.76
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'mrz' 1.25
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'apr' 3.31
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'mai' 0.49
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'jul' 12.16
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'aug' 8.39
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'okt' 2.41
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'nSum' 113
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'pSum' 61.2
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'minNAmount' 419
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'minPAmount' 510
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'grossMarginHa' 296
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'efaFactor' 0
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'fixCosts' 393.59
 '7d827f10-2ae8-4409-95a2-1c7120f9985a'.'Winterraps'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 357
 '7042bb8a-bc40-47b5-984e-4263ba248181'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'nSum' -80
 '7042bb8a-bc40-47b5-984e-4263ba248181'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'pSum' 0
 '7042bb8a-bc40-47b5-984e-4263ba248181'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'minNAmount' 0
 '7042bb8a-bc40-47b5-984e-4263ba248181'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'minPAmount' 0
 '7042bb8a-bc40-47b5-984e-4263ba248181'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'autumnFertm3' 0
 '7042bb8a-bc40-47b5-984e-4263ba248181'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'grossMarginHa' -538
 '7042bb8a-bc40-47b5-984e-4263ba248181'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'efaFactor' 2
 '7042bb8a-bc40-47b5-984e-4263ba248181'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'fixCosts' 360.25
 '7042bb8a-bc40-47b5-984e-4263ba248181'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'grossMarginNoCropEff' -538
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'nSum' -80
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'pSum' 0
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'minNAmount' 0
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'minPAmount' 0
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'autumnFertm3' 0
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'grossMarginHa' -538
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'efaFactor' 2
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'fixCosts' 360.25
 '1f492f11-9c3e-4b11-a541-3760b402dab6'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'true'.'false'.'grossMarginNoCropEff' -538
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'feb' 2.32
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'mrz' 1.59
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'apr' 5.54
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'mai' 0.85
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'aug' 14.01
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'sep' 20.93
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'okt' 5.14
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'nSum' 81
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'pSum' 53.6
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'minNAmount' 300
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'minPAmount' 447
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginHa' 724
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'efaFactor' 0
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'fixCosts' 387.48
 '081fdec1-4459-489f-978b-5d6fa63ca2a4'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 598
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'mrz' 0.8
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'mai' 1.86
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'jun' 1.6
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'jul' 1.85
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'aug' 1.37
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'sep' 0.02
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'pSum' 0
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'minNAmount' 0
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'minPAmount' 0
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'grossMarginHa' 382
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'efaFactor' 0
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'fixCosts' 406.22
 'ca465ee4-6845-41d9-91e3-c7d5aa841934'.'Grünland (Dauergrünland)'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 235
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'feb' 2.04
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'mrz' 1.34
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'apr' 3.93
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'mai' 0.68
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'aug' 12.11
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'sep' 17.85
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'okt' 3.68
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'nSum' 75
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'pSum' 53.6
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'minNAmount' 278
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'minPAmount' 447
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginHa' 743
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'efaFactor' 0
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'fixCosts' 379.41
 'f6ba6cbc-ee48-4566-ada8-fd8ab97a5c09'.'Winterroggen'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 617
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'mrz' 12.81
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'apr' 0.8
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'mai' 3.75
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'aug' 9.16
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'sep' 4.45
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'okt' 12.69
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'nSum' 10
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'pSum' 45.6
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'minNAmount' 37
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'minPAmount' 380
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'grossMarginHa' 71
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'efaFactor' 1
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'fixCosts' 347.57
 '40954f92-8be0-4fa5-8baf-9f0f11cf8f29'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' 8
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'nSum' -80
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'pSum' 0
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'minNAmount' 0
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'minPAmount' 0
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'autumnFertm3' 0
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'grossMarginHa' -422
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'efaFactor' 1
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'fixCosts' 360.25
 '7a462832-b8da-49a7-8a7f-34afe0c8eefd'.'Pufferstreifen ÖVF AL (inkl. Feldrand ÖVF)'.'0'.'0'.'false'.'false'.'grossMarginNoCropEff' -422
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'feb' 3.13
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'mrz' 4.24
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'apr' 13.18
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'mai' 4.52
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'sep' 31.66
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'okt' 10.77
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'nSum' 136
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'pSum' 70.08
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'minNAmount' 277
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'minPAmount' 9
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'autumnFertm3' 0
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'grossMarginHa' 683
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'efaFactor' 0
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'fixCosts' 545.14
 '923722aa-0abf-414d-a012-7195c217b0c3'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'grossMarginNoCropEff' 503
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'feb' 5.22
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'mrz' 6.97
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'apr' 22.04
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'mai' 6.31
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'sep' 58.91
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'okt' 18.54
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'nSum' 136
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'pSum' 70.08
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'minNAmount' 277
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'minPAmount' 9
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'autumnFertm3' 0
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'grossMarginHa' 695
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'efaFactor' 0
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'fixCosts' 524.85
 'e5786d24-5768-4c02-b11c-a9893905f57d'.'Silomais (als Hauptfutter)'.'30'.'0'.'false'.'false'.'grossMarginNoCropEff' 515
/;

parameter p_laborReq(curCrops,months) /

/;

set constraints /
 'Kartoffeln < 10ha'
 'Acker-/Puff-/Pferdebohne + Erbsen zur Körnergewinnung > 12.5ha'
 'Winterroggen < 30ha'
 'Winterweichweizen < 30ha'
 'Möhre (auch Futtermöhre) < 10ha'
 'Zuckerrüben < 10ha'
 'Silomais (als Hauptfutter) < 30ha'
/;

parameter p_constraint(constraints,curCrops,curCrops) /
 'Kartoffeln < 10ha'.'Kartoffeln'.'' 10
 'Acker-/Puff-/Pferdebohne + Erbsen zur Körnergewinnung > 12.5ha'.'Acker-/Puff-/Pferdebohne'.'Erbsen zur Körnergewinnung' 12.5
 'Winterroggen < 30ha'.'Winterroggen'.'' 30
 'Winterweichweizen < 30ha'.'Winterweichweizen'.'' 30
 'Möhre (auch Futtermöhre) < 10ha'.'Möhre (auch Futtermöhre)'.'' 10
 'Zuckerrüben < 10ha'.'Zuckerrüben'.'' 10
 'Silomais (als Hauptfutter) < 30ha'.'Silomais (als Hauptfutter)'.'' 30
/;

set constraints_lt(constraints,symbol) /
 'Kartoffeln < 10ha'.lt YES
 'Winterroggen < 30ha'.lt YES
 'Winterweichweizen < 30ha'.lt YES
 'Möhre (auch Futtermöhre) < 10ha'.lt YES
 'Zuckerrüben < 10ha'.lt YES
 'Silomais (als Hauptfutter) < 30ha'.lt YES
/;

set man_attr /
amount
n
p
k
minUsagePercent
/;

parameter p_manure(man_attr) /
  "amount" 1500
  "n" 5.1
  "p" 2.3
  "k" 5.5
  "minUsagePercent" 50
/;

parameter p_solid(man_attr) /

/;

