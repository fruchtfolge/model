* -------------------------------
* Fruchtfolge Model - Include file
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2020
* -------------------------------

* Static data
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
$onempty
$offdigit
set curYear(years) / 2020 /;
$setglobal duev2020 "undefined"
scalar manStorage /0 /;
scalar manPriceSpring /0 /;
scalar manPriceAutumn /0 /;
scalar solidStorage /0 /;
scalar solidPriceSpring /0 /;
scalar solidPriceAutumn /0 /;
set curPlots /
'0120ad1f-772e-4430-bdf0-604709b70f7d'
'03894f83-fdf9-4d91-8e38-55a1c47a6320'
'049fd699-12db-432b-8d13-d0a9bbc95873'
'0692e228-8257-4001-8a6d-3aea8e749e7e'
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'
'07a61aca-d40c-495a-b0fd-8b15207280aa'
'0a565e1f-7396-4aeb-a759-a24b6eccef95'
'0b724388-2d57-496c-a27a-97e8be4421e7'
'0e801dfe-dda4-4da0-a9c2-7555400b23be'
'0efeb567-c564-4aa6-a49f-3254421c1478'
'11457a8c-7523-405e-b02a-fab4d8910341'
'1a063d59-3306-4379-9847-4512803bfa51'
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'
'2254083c-6948-42f8-b648-61f38df7e9fa'
'238fb430-4291-4dca-8f99-8d652a0944aa'
'2692654e-151a-439a-9ab0-8e9d30b112b1'
'278c4380-63e8-479e-afbf-890b6dea5c87'
'29608664-7fa7-487d-ba6f-ad24cbe14b6a'
'296e3263-147a-4c8e-95bf-83651f31e7b9'
'29c668f1-a945-421e-a29b-454b21ad9537'
'2f928f60-8888-42a2-a875-a4ebb322a7eb'
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'
'37c35ad4-8588-4554-abb9-8ee1232e3442'
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'
'4f342422-711d-4afa-99dd-cfdd524f89da'
'5046c214-249f-444b-a3bc-80fb9e80b722'
'50c00b36-8d46-43ae-bc8f-d260c964336a'
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'
'52538145-10b4-4954-a8ee-0c68d56f8ef4'
'56cf5dd6-5095-4c8d-961f-68194c78cb95'
'57adb615-1470-4228-9c08-f8cc8bc27bd6'
'57c6eebe-93f4-4ae7-a034-47a1411692c7'
'58a1d807-8c1a-4075-8db4-d230dda3d446'
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'
'6080737a-051e-488c-8b96-0d27a9366093'
'728266df-d91a-4b7a-a46c-77da50a350a3'
'735c0570-831d-4854-964e-7b96a9ee4c93'
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'
'7f04f930-ed01-48ea-9d27-192c608145eb'
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'
'89d58023-e01c-4f7c-ae06-d271a0dcb687'
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'
'93061ffa-9b21-4820-8d18-ceb6e044573c'
'93e7ab36-267d-451f-b4c4-88b3bee31ced'
'94349f85-29cb-4131-9d16-cfec1abe0dbe'
'984e545f-af0a-41a2-ac55-0e2674f41ce0'
'9bfa74c8-562f-491a-ad35-246eee02258b'
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf'
'9fb4fcca-787e-46ad-9fbd-326061939c07'
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'
'bc2b5772-8378-4dba-813d-239c0b403619'
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'
'c7c48460-e817-4af5-ab28-be011d910cf5'
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'
'd613ceef-2722-49f1-8f00-d4ae843e64b9'
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'
'd885d200-ee94-41b0-800c-558b7823aad4'
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'
'd9502654-7f36-47d6-b11d-eb6439df5eac'
'd98ba772-2d1f-4742-a223-7edbc5858fd1'
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'
'ea812f15-8776-4527-a89d-e06185876516'
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'
'f15af41e-28e7-4861-adb2-18b57b7ace66'
'f17585a6-9211-4323-b828-caf379f04cf3'
'f29fa188-a4cc-4495-b488-a01c6a3749e3'
'f3cf2dc7-2538-4d7c-994b-192bd76718b9'
'fbb4eb59-5bee-491f-9a54-3368242d6975'
'ff4e10c7-20ed-491e-9791-c25aad687cdd'

/;

parameter p_plotData(curPlots,plotAttr) /
'0120ad1f-772e-4430-bdf0-604709b70f7d'.size 1.36
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.size 1.44
'049fd699-12db-432b-8d13-d0a9bbc95873'.size 3.69
'0692e228-8257-4001-8a6d-3aea8e749e7e'.size 0.84
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.size 7.66
'07a61aca-d40c-495a-b0fd-8b15207280aa'.size 0.56
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.size 5.12
'0b724388-2d57-496c-a27a-97e8be4421e7'.size 3.85
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.size 3.13
'0efeb567-c564-4aa6-a49f-3254421c1478'.size 9.81
'11457a8c-7523-405e-b02a-fab4d8910341'.size 4.2
'1a063d59-3306-4379-9847-4512803bfa51'.size 1.43
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.size 8.41
'2254083c-6948-42f8-b648-61f38df7e9fa'.size 2.97
'238fb430-4291-4dca-8f99-8d652a0944aa'.size 0.83
'2692654e-151a-439a-9ab0-8e9d30b112b1'.size 0.7
'278c4380-63e8-479e-afbf-890b6dea5c87'.size 5.61
'29608664-7fa7-487d-ba6f-ad24cbe14b6a'.size 0.1
'296e3263-147a-4c8e-95bf-83651f31e7b9'.size 1.23
'29c668f1-a945-421e-a29b-454b21ad9537'.size 2.57
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.size 6.22
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.size 0.91
'37c35ad4-8588-4554-abb9-8ee1232e3442'.size 3
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.size 5.75
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.size 0.28
'4f342422-711d-4afa-99dd-cfdd524f89da'.size 9.23
'5046c214-249f-444b-a3bc-80fb9e80b722'.size 0.4
'50c00b36-8d46-43ae-bc8f-d260c964336a'.size 1.49
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.size 2.5
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.size 2.78
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.size 2.33
'57adb615-1470-4228-9c08-f8cc8bc27bd6'.size 3.15
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.size 1.59
'58a1d807-8c1a-4075-8db4-d230dda3d446'.size 0.03
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.size 2.62
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.size 1.33
'6080737a-051e-488c-8b96-0d27a9366093'.size 5.41
'728266df-d91a-4b7a-a46c-77da50a350a3'.size 2.74
'735c0570-831d-4854-964e-7b96a9ee4c93'.size 4
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.size 1.46
'7f04f930-ed01-48ea-9d27-192c608145eb'.size 2.55
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.size 3.04
'89d58023-e01c-4f7c-ae06-d271a0dcb687'.size 2.97
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.size 4.89
'93061ffa-9b21-4820-8d18-ceb6e044573c'.size 1.03
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.size 1.06
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.size 1.16
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.size 5.71
'9bfa74c8-562f-491a-ad35-246eee02258b'.size 3.92
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf'.size 1.56
'9fb4fcca-787e-46ad-9fbd-326061939c07'.size 0.69
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.size 3.13
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.size 0.88
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.size 2.3
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.size 3.42
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.size 1.17
'bc2b5772-8378-4dba-813d-239c0b403619'.size 3.2
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.size 3.93
'c7c48460-e817-4af5-ab28-be011d910cf5'.size 0.26
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.size 0.79
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.size 3.74
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.size 6.57
'd885d200-ee94-41b0-800c-558b7823aad4'.size 0.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.size 1.64
'd9502654-7f36-47d6-b11d-eb6439df5eac'.size 1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.size 2.27
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.size 16.28
'ea812f15-8776-4527-a89d-e06185876516'.size 1.71
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.size 1.51
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.size 1.41
'f15af41e-28e7-4861-adb2-18b57b7ace66'.size 1.26
'f17585a6-9211-4323-b828-caf379f04cf3'.size 3.77
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.size 1.97
'f3cf2dc7-2538-4d7c-994b-192bd76718b9'.size 0.36
'fbb4eb59-5bee-491f-9a54-3368242d6975'.size 8.42
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.size 0.94

/;

set plots_duevEndangered(curPlots) /

/;

set plots_permPast(curPlots) /
'07a61aca-d40c-495a-b0fd-8b15207280aa' YES
'2254083c-6948-42f8-b648-61f38df7e9fa' YES
'2692654e-151a-439a-9ab0-8e9d30b112b1' YES
'29608664-7fa7-487d-ba6f-ad24cbe14b6a' YES
'5046c214-249f-444b-a3bc-80fb9e80b722' YES
'57adb615-1470-4228-9c08-f8cc8bc27bd6' YES
'58a1d807-8c1a-4075-8db4-d230dda3d446' YES
'89d58023-e01c-4f7c-ae06-d271a0dcb687' YES
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf' YES
'c7c48460-e817-4af5-ab28-be011d910cf5' YES
'f3cf2dc7-2538-4d7c-994b-192bd76718b9' YES

/;

set curCrops /
 ''
 'Zuckerrüben'
 'Erbsen zur Körnergewinnung'
 'Grünland (Dauergrünland)'
 'Silomais (als Hauptfutter)'
 'Wintergerste'
 'Zwiebeln/Lauch'
 'Acker-/Puff-/Pferdebohne'
 'Winterweichweizen'
 'Kleegras'
 'Möhre (auch Futtermöhre)'
 'Kartoffeln'

/;

set cropGroup /
 ''
 'Gattung: Beta (Rüben)'
 'Gattung: Pisum (Erbse)'
 'Dauergrünland'
 'Gattung: Zea (Mais)'
 'Wintergerste'
 'Gattung: Allium (Lauch)'
 'Gattung: Vicia (Wicken)'
 'Winterweizen'
 'Gras oder andere Grünfutterpflanzen'
 'Gattung: Daucus (Möhren)'
 'Art: Solanum tuberosum (Kartoffel)'

/;

set crops_cropGroup(curCrops,cropGroup) /
 ''.''
 'Zuckerrüben'.'Gattung: Beta (Rüben)'
 'Erbsen zur Körnergewinnung'.'Gattung: Pisum (Erbse)'
 'Grünland (Dauergrünland)'.'Dauergrünland'
 'Silomais (als Hauptfutter)'.'Gattung: Zea (Mais)'
 'Wintergerste'.'Wintergerste'
 'Zwiebeln/Lauch'.'Gattung: Allium (Lauch)'
 'Acker-/Puff-/Pferdebohne'.'Gattung: Vicia (Wicken)'
 'Winterweichweizen'.'Winterweizen'
 'Kleegras'.'Gras oder andere Grünfutterpflanzen'
 'Möhre (auch Futtermöhre)'.'Gattung: Daucus (Möhren)'
 'Kartoffeln'.'Art: Solanum tuberosum (Kartoffel)'

/;

parameter p_cropData(curCrops,cropAttr) /
'Zuckerrüben'.maxShare 20
'Erbsen zur Körnergewinnung'.maxShare 16.67
'Grünland (Dauergrünland)'.maxShare 100
'Silomais (als Hauptfutter)'.maxShare 33.33
'Wintergerste'.maxShare 33.33
'Zwiebeln/Lauch'.maxShare 25
'Acker-/Puff-/Pferdebohne'.maxShare 16.67
'Winterweichweizen'.maxShare 33.33
'Kleegras'.maxShare 100
'Möhre (auch Futtermöhre)'.maxShare 20
'Kartoffeln'.maxShare 25

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
grossMarginHa
efaFactor

/;

parameter p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,*) /
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.31
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.53
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.32
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.23
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.23
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.9
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.2
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 4.03
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 111
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.69
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.54
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 3.85
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.33
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 4.19
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.37
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 5.52
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.97
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -35
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.14
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.53
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 5.09
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 18.9
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 13.22
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 25.53
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 4.64
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.85
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.42
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -640
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.15
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.15
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 1.82
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.76
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.34
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 3.53
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 67
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.69
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.57
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 3.89
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.57
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.84
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 4.45
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 3.59
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 5
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 313
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.62
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 3.62
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.09
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 2.57
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.13
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.98
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -553
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.29
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 15.6
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 81.87
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 82.89
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 81.17
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 6.79
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 73.7
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 12.51
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -386
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.9
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 5.06
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.52
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 4.2
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 6.3
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 6.46
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 28.16
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.32
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 3.69
'0120ad1f-772e-4430-bdf0-604709b70f7d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6028
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.34
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.34
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.38
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.83
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.26
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 2.45
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.36
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 4.61
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 93
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.79
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.64
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 4.86
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.39
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 4.66
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.54
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 6.44
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.46
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -56
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 8.28
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 5.86
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 6.51
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 21.32
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 17.21
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 31.74
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 4.95
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 4.47
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.75
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -735
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.22
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.18
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 2.3
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 3.1
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.51
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 3.98
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 50
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.79
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.67
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 4.92
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.67
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 2.32
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 5.01
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 4.05
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 6.04
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 288
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.7
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 4.9
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 4.11
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 3.31
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.33
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 4.59
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -588
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.33
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 17.37
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 89.53
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 90.26
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 89.2
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 7.98
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 79.91
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 14.29
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -435
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.13
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 5.95
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 3.17
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 5.36
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 8.04
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 7.92
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 31.42
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.41
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 4.16
'03894f83-fdf9-4d91-8e38-55a1c47a6320'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5971
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.55
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 9.12
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 3.58
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 21.53
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 7.34
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 506
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.61
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.07
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 5.67
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.55
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 9.82
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.11
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 11.62
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.08
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -144
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 12.29
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 3.45
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.47
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 41.36
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 10
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 46.53
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 11.76
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 7.38
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 4.9
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -437
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.61
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.1
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 5.71
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.1
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 2.75
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 10.14
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 8.56
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 8.84
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 383
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.45
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 5.36
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 4.89
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 4.43
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.41
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 9.2
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -495
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.91
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 9.35
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 3.33
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 5.16
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 7.74
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 10.09
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 66.81
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.39
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 8.54
'049fd699-12db-432b-8d13-d0a9bbc95873'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5010
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.19
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.74
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.21
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.29
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.14
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.08
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 1.37
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 2.45
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 114
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.42
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.34
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 2.19
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.21
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 2.55
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 0.83
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 3.28
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.12
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -27
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.4
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.67
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.02
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 11.47
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 7.71
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 14.62
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 2.89
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 2.32
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.52
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -613
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.42
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.36
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 2.21
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.36
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.04
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 2.69
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 2.18
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 2.9
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 323
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.37
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 1.91
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.66
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.4
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.67
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 2.39
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -535
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.19
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 9.73
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 50.18
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 50.87
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 49.65
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 4.09
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 45.05
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 7.59
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -376
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.19
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 3.04
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 1.48
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 2.4
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 3.6
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 3.77
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 17.08
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.18
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 2.26
'0692e228-8257-4001-8a6d-3aea8e749e7e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6049
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.88
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 57.88
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 19.77
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 107.48
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 25.43
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 296
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 4.56
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.73
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 27.03
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 2.3
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 24.46
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 8
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 35.99
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 13.46
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -223
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 32.16
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 16.9
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 19.8
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 101.66
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 51.68
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 209.09
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 24.13
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 19.53
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 13
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -691
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 4.56
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.96
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 27.55
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 3.96
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 12.84
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 26.6
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 23.49
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 32.1
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 289
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 3.82
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 38.55
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 31.44
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 24.32
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 7.62
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 27.65
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -661
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.76
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 81.25
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 480.36
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 490.25
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 473.96
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 36.23
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 434.98
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 82.42
'070bb748-ea48-4216-82cc-18bd4a2ea2c3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -432
'07a61aca-d40c-495a-b0fd-8b15207280aa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.83
'07a61aca-d40c-495a-b0fd-8b15207280aa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 1.83
'07a61aca-d40c-495a-b0fd-8b15207280aa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 1.57
'07a61aca-d40c-495a-b0fd-8b15207280aa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 1.85
'07a61aca-d40c-495a-b0fd-8b15207280aa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 1.35
'07a61aca-d40c-495a-b0fd-8b15207280aa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'sep' 0.02
'07a61aca-d40c-495a-b0fd-8b15207280aa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 572
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.84
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.46
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.75
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.95
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.67
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 2.2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 7.4
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 11.03
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1121
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.84
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.46
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.75
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.95
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.67
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 2.2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 7.4
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 11.03
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1010
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.84
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.46
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.75
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.95
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.67
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 2.2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 7.4
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 11.03
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1010
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 11.49
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.34
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.34
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 9.48
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 3.85
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 3.73
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 7.67
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 106
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 11.49
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.34
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.34
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 9.48
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 3.85
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 3.73
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 7.67
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -5
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 11.49
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.34
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.34
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 9.48
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 3.85
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 3.73
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 7.67
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -5
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.44
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 12.02
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 4.6
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 29.19
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 9.84
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 494
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.44
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 12.02
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 4.6
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 29.19
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 9.84
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 383
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.44
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 12.02
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 4.6
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 29.19
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 9.84
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 383
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2.14
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.46
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 7.01
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.77
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 13.1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 4.1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 15.2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.81
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 194
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 14.42
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.26
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.45
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 54.59
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 6.28
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 60.81
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 15.83
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 9.37
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 5.95
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -326
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 14.42
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 2.26
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 3.45
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 54.59
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 6.28
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 60.81
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 15.83
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 9.37
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 5.95
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -436
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 14.42
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 2.26
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 3.45
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 54.59
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 6.28
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 60.81
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 15.83
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 9.37
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 5.95
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -436
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 11.51
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.36
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 3.2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 8.23
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 4.01
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 11.29
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 50
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 11.51
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.36
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 3.2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 8.23
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 4.01
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 11.29
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -61
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 11.51
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.36
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 3.2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 8.23
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 4.01
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 11.29
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -61
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2.14
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.5
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 7.05
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.5
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 3.37
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 13.48
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 11.45
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 11.14
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 499
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.94
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 7.25
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 6.63
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 6.02
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 3.19
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 12.35
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -491
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.94
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 7.25
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 6.63
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 6.02
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 3.19
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 12.35
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -602
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.94
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 7.25
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 6.63
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 6.02
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 3.19
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 12.35
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -602
'0a565e1f-7396-4aeb-a759-a24b6eccef95'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.74
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.42
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.73
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 4.84
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.57
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 4.11
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 5.85
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 10.02
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 139
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.83
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.32
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 9.37
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.74
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 11.14
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.57
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 14.25
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 4.85
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -17
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 15.53
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 7.85
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 9.09
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 48.33
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 23.2
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 66.01
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 12.37
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 9.27
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 5.52
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -514
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.83
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.38
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 9.49
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.38
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 4.53
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 11.77
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 9.55
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 12.46
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 333
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.65
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 9.93
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 8.48
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 7.04
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.97
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 10.65
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -546
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.63
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 37.56
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 222.06
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 226.38
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 218.73
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 15.81
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 205.72
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 32.44
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -307
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.49
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 12.16
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 5.56
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 9.22
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 13.82
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 14.99
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 75.67
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.71
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 9.5
'0b724388-2d57-496c-a27a-97e8be4421e7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6083
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.63
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.12
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.62
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 4.35
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.49
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 3.74
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 4.85
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 8.54
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1073
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.63
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.12
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.62
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 4.35
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.49
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 3.74
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 4.85
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 8.54
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 957
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.63
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.12
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.62
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 4.35
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.49
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 3.74
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 4.85
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 8.54
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 957
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.98
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.27
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.27
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 6.86
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 2.83
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 2.48
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 5.41
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 140
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 10.98
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.27
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.27
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 6.86
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 2.83
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 2.48
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 5.41
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 24
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 10.98
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.27
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.27
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 6.86
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 2.83
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 2.48
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 5.41
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 24
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.57
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 13.59
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 5.06
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 27.25
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 7.54
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 595
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.57
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 13.59
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 5.06
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 27.25
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 7.54
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 479
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.57
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 13.59
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 5.06
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 27.25
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 7.54
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 479
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.53
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.12
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 8.15
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.64
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 9.28
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.99
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 12.04
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 4.2
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -24
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 13.78
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 7.68
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 8.78
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 40.73
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 22.7
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 56.15
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 10.23
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 7.99
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 4.82
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1335
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 13.78
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 7.68
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 8.78
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 40.73
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 22.7
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 56.15
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 10.23
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 7.99
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 4.82
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1220
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 13.78
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 7.68
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 8.78
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 40.73
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 22.7
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 56.15
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 10.23
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 7.99
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 4.82
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1220
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.37
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 8.41
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 7.16
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 5.92
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.5
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 8.88
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -552
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.37
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 8.41
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 7.16
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 5.92
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 2.5
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 8.88
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -667
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.37
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 8.41
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 7.16
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 5.92
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 2.5
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 8.88
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -667
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.54
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 32.16
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 183.31
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 186.45
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 181.01
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 13.78
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 168.33
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 27.25
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2899
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.54
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 32.16
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 183.31
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 186.45
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 181.01
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 13.78
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 168.33
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 27.25
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2784
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.54
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 32.16
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 183.31
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 186.45
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 181.01
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 13.78
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 168.33
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 27.25
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2784
'0e801dfe-dda4-4da0-a9c2-7555400b23be'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 1.31
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 16.3
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 1.77
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 6.73
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 1.15
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 4.96
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 13.05
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 19.3
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1129
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 1.31
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 16.3
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 1.77
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 6.73
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 1.15
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 4.96
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 13.05
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 19.3
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1019
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 1.31
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 16.3
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 1.77
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 6.73
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 1.15
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 4.96
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 13.05
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 19.3
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1019
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 24.95
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.75
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.75
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 17.98
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 7.09
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 6.47
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 14.73
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 166
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 24.95
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.75
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.75
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 17.98
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 7.09
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 6.47
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 14.73
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 56
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 24.95
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.75
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.75
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 17.98
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 7.09
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 6.47
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 14.73
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 56
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.92
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 37.93
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 12.45
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 81.98
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 20.75
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 612
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.92
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 37.93
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 12.45
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 81.98
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 20.75
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 502
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.92
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 37.93
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 12.45
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 81.98
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 20.75
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 502
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 4.07
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.13
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 18.14
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 1.83
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 24.85
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 7.6
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 30.03
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 9.22
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 10
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 23.55
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 3.35
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 5.3
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 105.78
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 10.35
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 152.13
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 28.74
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 18.15
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 9.29
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1541
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 23.55
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 3.35
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 5.3
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 105.78
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 10.35
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 152.13
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 28.74
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 18.15
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 9.29
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1430
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 23.55
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 3.35
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 5.3
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 105.78
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 10.35
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 152.13
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 28.74
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 18.15
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 9.29
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1430
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 3.71
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 25.94
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 21.98
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 18.02
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 6.5
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 24.42
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -542
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 3.71
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 25.94
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 21.98
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 18.02
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 6.5
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 24.42
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -652
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 3.71
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 25.94
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 21.98
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 18.02
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 6.5
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 24.42
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -652
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.5
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 72.74
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 533.43
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 548.8
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 519.77
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 28.62
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 516.33
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 72.74
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3028
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.5
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 72.74
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 533.43
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 548.8
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 519.77
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 28.62
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 516.33
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 72.74
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2917
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.5
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 72.74
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 533.43
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 548.8
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 519.77
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 28.62
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 516.33
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 72.74
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2917
'0efeb567-c564-4aa6-a49f-3254421c1478'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.73
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 8.4
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.62
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.71
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.57
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 2.09
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 6.21
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 9.48
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1114
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.73
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 8.4
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.62
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.71
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.57
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 2.09
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 6.21
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 9.48
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1002
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.73
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 8.4
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.62
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.71
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.57
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 2.09
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 6.21
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 9.48
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1002
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.81
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.28
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.28
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 7.95
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 3.25
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 3.14
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 6.41
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 167
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.81
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.28
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.28
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 7.95
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 3.25
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 3.14
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 6.41
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 56
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.81
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.28
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.28
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 7.95
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 3.25
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 3.14
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 6.41
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 56
'11457a8c-7523-405e-b02a-fab4d8910341'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.84
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 9.82
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 3.84
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 23.73
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 8.19
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 675
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.84
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 9.82
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 3.84
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 23.73
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 8.19
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 563
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.84
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 9.82
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 3.84
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 23.73
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 8.19
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 563
'11457a8c-7523-405e-b02a-fab4d8910341'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.8
'11457a8c-7523-405e-b02a-fab4d8910341'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.21
'11457a8c-7523-405e-b02a-fab4d8910341'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 6
'11457a8c-7523-405e-b02a-fab4d8910341'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.63
'11457a8c-7523-405e-b02a-fab4d8910341'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 10.97
'11457a8c-7523-405e-b02a-fab4d8910341'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.46
'11457a8c-7523-405e-b02a-fab4d8910341'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 12.83
'11457a8c-7523-405e-b02a-fab4d8910341'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.27
'11457a8c-7523-405e-b02a-fab4d8910341'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 20
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 13.01
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.88
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.96
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 45.89
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 8.22
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 50.85
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 13.23
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 8.03
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 5.3
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1543
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 13.01
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 2.88
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 3.96
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 45.89
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 8.22
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 50.85
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 13.23
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 8.03
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 5.3
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1432
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 13.01
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 2.88
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 3.96
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 45.89
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 8.22
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 50.85
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 13.23
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 8.03
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 5.3
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1432
'11457a8c-7523-405e-b02a-fab4d8910341'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.83
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.29
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 2.75
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 6.92
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 3.38
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 9.46
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 109
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.83
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.29
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 2.75
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 6.92
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 3.38
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 9.46
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -2
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.83
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.29
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 2.75
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 6.92
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 3.38
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 9.46
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -2
'11457a8c-7523-405e-b02a-fab4d8910341'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.62
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 5.79
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 5.33
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 4.87
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.67
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 10.3
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -491
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.62
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 5.79
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 5.33
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 4.87
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 2.67
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 10.3
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -602
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.62
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 5.79
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 5.33
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 4.87
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 2.67
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 10.3
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -602
'11457a8c-7523-405e-b02a-fab4d8910341'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.57
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 36.82
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 228.84
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 235.47
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 222.99
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 13.23
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 215.49
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 31.52
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3007
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.57
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 36.82
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 228.84
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 235.47
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 222.99
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 13.23
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 215.49
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 31.52
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2896
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.57
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 36.82
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 228.84
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 235.47
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 222.99
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 13.23
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 215.49
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 31.52
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2896
'11457a8c-7523-405e-b02a-fab4d8910341'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.34
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.29
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.37
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.8
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.25
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 2.42
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.34
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 4.57
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1018
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.34
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 5.29
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.37
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.8
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.25
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 2.42
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 2.34
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 4.57
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 899
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.34
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 5.29
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.37
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.8
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.25
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 2.42
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 2.34
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 4.57
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 899
'1a063d59-3306-4379-9847-4512803bfa51'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.37
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 7.93
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 3.02
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 14.89
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 3.96
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 564
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.37
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 7.93
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 3.02
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 14.89
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 3.96
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 446
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.37
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 7.93
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 3.02
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 14.89
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 3.96
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 446
'1a063d59-3306-4379-9847-4512803bfa51'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.78
'1a063d59-3306-4379-9847-4512803bfa51'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.62
'1a063d59-3306-4379-9847-4512803bfa51'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 4.8
'1a063d59-3306-4379-9847-4512803bfa51'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.38
'1a063d59-3306-4379-9847-4512803bfa51'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 4.63
'1a063d59-3306-4379-9847-4512803bfa51'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.53
'1a063d59-3306-4379-9847-4512803bfa51'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 6.38
'1a063d59-3306-4379-9847-4512803bfa51'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.43
'1a063d59-3306-4379-9847-4512803bfa51'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -61
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 8.21
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 5.8
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 6.44
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 21.14
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 17.02
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 31.39
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 4.91
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 4.43
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.73
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -793
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 8.21
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 5.8
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 6.44
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 21.14
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 17.02
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 31.39
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 4.91
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 4.43
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 2.73
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -912
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 8.21
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 5.8
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 6.44
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 21.14
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 17.02
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 31.39
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 4.91
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 4.43
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 2.73
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -912
'1a063d59-3306-4379-9847-4512803bfa51'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.78
'1a063d59-3306-4379-9847-4512803bfa51'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.66
'1a063d59-3306-4379-9847-4512803bfa51'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 4.86
'1a063d59-3306-4379-9847-4512803bfa51'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.66
'1a063d59-3306-4379-9847-4512803bfa51'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 2.3
'1a063d59-3306-4379-9847-4512803bfa51'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 4.97
'1a063d59-3306-4379-9847-4512803bfa51'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 4.01
'1a063d59-3306-4379-9847-4512803bfa51'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 5.98
'1a063d59-3306-4379-9847-4512803bfa51'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 420
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.69
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 4.84
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 4.05
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 3.27
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.32
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 4.54
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -587
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.69
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 4.84
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 4.05
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 3.27
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.32
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 4.54
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -706
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.69
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 4.84
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 4.05
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 3.27
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.32
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 4.54
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -706
'1a063d59-3306-4379-9847-4512803bfa51'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.32
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 17.23
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 88.83
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 89.57
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 88.5
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 7.91
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 79.31
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 14.16
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -479
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.32
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 17.23
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 88.83
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 89.57
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 88.5
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 7.91
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 79.31
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 14.16
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -598
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.32
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 17.23
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 88.83
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 89.57
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 88.5
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 7.91
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 79.31
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 14.16
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -598
'1a063d59-3306-4379-9847-4512803bfa51'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.11
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 5.89
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 3.13
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 5.3
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 7.95
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 7.84
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 31.16
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.41
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 4.12
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5597
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.11
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 5.89
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 3.13
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 5.3
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 7.95
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 7.84
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 31.16
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.41
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 4.12
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5478
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.11
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 5.89
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 3.13
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 5.3
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 7.95
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 7.84
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 31.16
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.41
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 4.12
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5478
'1a063d59-3306-4379-9847-4512803bfa51'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 1.17
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 13.86
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 1.49
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 5.12
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.99
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 3.64
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 11.38
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 16.44
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 187
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 3.42
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.61
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 13.57
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 1.51
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 21.04
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 6.46
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 24.75
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 7
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 18
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 20.08
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.16
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.78
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 88.87
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 5.96
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 114.42
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 24.83
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 15.08
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 7.99
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -325
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 19.84
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.67
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 6.24
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 13.17
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 6.26
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 17.84
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 111
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 3.42
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.7
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 13.74
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 2.7
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 6.44
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 21.87
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 18.11
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 19.15
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 373
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 3.13
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 17.78
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 15.39
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 13.02
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 5.32
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 20.25
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -519
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.29
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 62.29
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 450.74
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 463.97
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 438.53
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 23.5
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 436.69
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 60.18
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -193
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.05
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 18.39
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 6.17
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 9
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 13.51
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 19.01
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 147.22
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.73
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 17.02
'1be68d96-6c2f-40f2-a4bc-5e97c492c885'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6188
'2254083c-6948-42f8-b648-61f38df7e9fa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.25
'2254083c-6948-42f8-b648-61f38df7e9fa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 9.34
'2254083c-6948-42f8-b648-61f38df7e9fa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 8.02
'2254083c-6948-42f8-b648-61f38df7e9fa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 9.45
'2254083c-6948-42f8-b648-61f38df7e9fa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 6.8
'2254083c-6948-42f8-b648-61f38df7e9fa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'sep' 0.09
'2254083c-6948-42f8-b648-61f38df7e9fa'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 579
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.2
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.74
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.15
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.5
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 1.38
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 2.74
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1027
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.2
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 1.74
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.15
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 1.5
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 1.38
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 2.74
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 908
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.2
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 1.74
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.15
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 1.5
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 1.38
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 2.74
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 908
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.7
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.11
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.11
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 2.05
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 0.86
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 0.72
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 1.63
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 50
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.7
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.11
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.11
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 2.05
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 0.86
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 0.72
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 1.63
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -69
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.7
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.11
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.11
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 2.05
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 0.86
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 0.72
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 1.63
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -69
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.84
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 4.75
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 1.84
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 8.79
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 2.35
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 359
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.84
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 4.75
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 1.84
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 8.79
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 2.35
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 240
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.84
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 4.75
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 1.84
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 8.79
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 2.35
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 240
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.46
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.39
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 2.92
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 2.73
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 0.91
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 3.8
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.46
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 110
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.09
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 3.74
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.13
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 12.64
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 10.89
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 18.76
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 2.9
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 2.69
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.67
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -776
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 5.09
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 3.74
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 4.13
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 12.64
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 10.89
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 18.76
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 2.9
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 2.69
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 1.67
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -895
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 5.09
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 3.74
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 4.13
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 12.64
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 10.89
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 18.76
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 2.9
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 2.69
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 1.67
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -895
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.71
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.12
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 1.39
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 1.82
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 0.89
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 2.33
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -17
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.71
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.12
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 1.39
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 1.82
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 0.89
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 2.33
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -136
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.71
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.12
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 1.39
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 1.82
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 0.89
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 2.33
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -136
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.46
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.41
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 2.95
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.41
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.38
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 2.94
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 2.37
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 3.59
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 401
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.41
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 2.86
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 2.4
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.93
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.78
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 2.69
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -591
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.41
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 2.86
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 2.4
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 1.93
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 0.78
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 2.69
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -710
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.41
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 2.86
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 2.4
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 1.93
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 0.78
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 2.69
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -710
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.22
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 10.44
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 52.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 52.56
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 52.15
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 4.83
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 46.28
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 8.44
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -460
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.22
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 10.44
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 52.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 52.56
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 52.15
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 4.83
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 46.28
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 8.44
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -579
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.22
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 10.44
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 52.25
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 52.56
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 52.15
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 4.83
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 46.28
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 8.44
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -579
'238fb430-4291-4dca-8f99-8d652a0944aa'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'2692654e-151a-439a-9ab0-8e9d30b112b1'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.21
'2692654e-151a-439a-9ab0-8e9d30b112b1'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.91
'2692654e-151a-439a-9ab0-8e9d30b112b1'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 2.53
'2692654e-151a-439a-9ab0-8e9d30b112b1'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 3.62
'2692654e-151a-439a-9ab0-8e9d30b112b1'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 2.17
'2692654e-151a-439a-9ab0-8e9d30b112b1'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'sep' 0.03
'2692654e-151a-439a-9ab0-8e9d30b112b1'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 476
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 1.04
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 15.19
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 1.2
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 7.62
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.84
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 6.42
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 8.31
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 14.73
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -40
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 1.04
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 15.19
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 1.2
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 7.62
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.84
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 6.42
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 8.31
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 14.73
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -155
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 1.04
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 15.19
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 1.2
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 7.62
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.84
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 6.42
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 8.31
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 14.73
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -155
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.71
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 28.53
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 10.07
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 56.27
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 14.26
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 583
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.71
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 28.53
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 10.07
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 56.27
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 14.26
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 468
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.71
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 28.53
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 10.07
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 56.27
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 14.26
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 468
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2.76
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 15.43
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 1.23
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 16.46
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 5.27
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 21.8
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 7.84
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 224
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2.76
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.23
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 15.68
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 2.23
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 7.42
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 17.57
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 14.32
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 19.51
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 329
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 2.46
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 18.49
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 15.47
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 12.44
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 4.59
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 16.36
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -578
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 2.46
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 18.49
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 15.47
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 12.44
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 4.59
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 16.36
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -693
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 2.46
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 18.49
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 15.47
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 12.44
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 4.59
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 16.36
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -693
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.01
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 53.06
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 327.33
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 333.69
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 322.52
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 23.12
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 304.58
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 48.96
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -390
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.01
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 53.06
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 327.33
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 333.69
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 322.52
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 23.12
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 304.58
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 48.96
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -506
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.01
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 53.06
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 327.33
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 333.69
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 322.52
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 23.12
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 304.58
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 48.96
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -506
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.38
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 18.18
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 8.61
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 14.34
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 21.51
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 22.88
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 113.18
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 1.13
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 13.96
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3420
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.38
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 18.18
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 8.61
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 14.34
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 21.51
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 22.88
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 113.18
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 1.13
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 13.96
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 3305
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.38
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 18.18
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 8.61
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 14.34
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 21.51
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 22.88
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 113.18
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 1.13
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 13.96
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 3305
'278c4380-63e8-479e-afbf-890b6dea5c87'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'29608664-7fa7-487d-ba6f-ad24cbe14b6a'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.22
'29608664-7fa7-487d-ba6f-ad24cbe14b6a'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 0.36
'29608664-7fa7-487d-ba6f-ad24cbe14b6a'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 0.31
'29608664-7fa7-487d-ba6f-ad24cbe14b6a'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 0.41
'29608664-7fa7-487d-ba6f-ad24cbe14b6a'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 0.27
'29608664-7fa7-487d-ba6f-ad24cbe14b6a'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 533
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.26
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.25
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.24
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.23
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.19
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 0.98
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 1.96
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 3.26
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 142
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.57
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.42
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 2.18
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.24
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 3.46
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.11
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 4.19
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.16
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.36
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.31
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 2.75
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 14.97
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 6.59
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 16.65
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 4.16
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 2.83
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.04
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -466
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.41
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.12
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 1.01
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.22
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.1
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 2.98
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 96
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.57
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.43
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 2.19
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.43
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.03
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 3.58
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 3.02
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 3.28
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 358
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.51
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 1.69
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.56
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.44
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.85
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.21
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -494
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.23
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 13.18
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 70.34
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 71.94
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 68.96
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 4.94
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 63.86
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 10.24
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -305
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.58
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 3.66
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 1.48
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 2.29
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 3.43
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 4.11
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 23.29
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.17
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 3.12
'296e3263-147a-4c8e-95bf-83651f31e7b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6133
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.66
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.27
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.27
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 6.07
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 2.53
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 2.13
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 4.89
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 59
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 10.66
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.27
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.27
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 6.07
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 2.53
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 2.13
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 4.89
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -59
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 10.66
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.27
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.27
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 6.07
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 2.53
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 2.13
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 4.89
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -59
'29c668f1-a945-421e-a29b-454b21ad9537'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.36
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 14.21
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 5.27
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 26.99
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 7.05
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 366
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.36
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 14.21
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 5.27
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 26.99
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 7.05
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 248
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.36
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 14.21
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 5.27
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 26.99
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 7.05
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 248
'29c668f1-a945-421e-a29b-454b21ad9537'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'29c668f1-a945-421e-a29b-454b21ad9537'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.37
'29c668f1-a945-421e-a29b-454b21ad9537'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.05
'29c668f1-a945-421e-a29b-454b21ad9537'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 8.3
'29c668f1-a945-421e-a29b-454b21ad9537'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.63
'29c668f1-a945-421e-a29b-454b21ad9537'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 8.15
'29c668f1-a945-421e-a29b-454b21ad9537'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.67
'29c668f1-a945-421e-a29b-454b21ad9537'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 11.17
'29c668f1-a945-421e-a29b-454b21ad9537'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 4.22
'29c668f1-a945-421e-a29b-454b21ad9537'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 122
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 13.35
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 8.93
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 9.98
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 36.51
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 26.39
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 55.53
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 8.6
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 7.48
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 4.52
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -680
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 13.35
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 8.93
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 9.98
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 36.51
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 26.39
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 55.53
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 8.6
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 7.48
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 4.52
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -798
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 13.35
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 8.93
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 9.98
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 36.51
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 26.39
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 55.53
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 8.6
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 7.48
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 4.52
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -798
'29c668f1-a945-421e-a29b-454b21ad9537'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.68
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.28
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 3.93
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 5.38
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 2.61
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 6.97
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -7
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 10.68
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.28
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 3.93
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 5.38
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 2.61
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 6.97
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -125
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 10.68
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.28
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 3.93
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 5.38
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 2.61
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 6.97
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -125
'29c668f1-a945-421e-a29b-454b21ad9537'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'29c668f1-a945-421e-a29b-454b21ad9537'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.37
'29c668f1-a945-421e-a29b-454b21ad9537'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.11
'29c668f1-a945-421e-a29b-454b21ad9537'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 8.42
'29c668f1-a945-421e-a29b-454b21ad9537'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.11
'29c668f1-a945-421e-a29b-454b21ad9537'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 4
'29c668f1-a945-421e-a29b-454b21ad9537'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 8.75
'29c668f1-a945-421e-a29b-454b21ad9537'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 7.09
'29c668f1-a945-421e-a29b-454b21ad9537'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 10.39
'29c668f1-a945-421e-a29b-454b21ad9537'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 414
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.22
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 8.85
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 7.4
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 5.95
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.32
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 8.06
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -588
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.22
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 8.85
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 7.4
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 5.95
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 2.32
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 8.06
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -706
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.22
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 8.85
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 7.4
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 5.95
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 2.32
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 8.06
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -706
'29c668f1-a945-421e-a29b-454b21ad9537'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.51
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 29.06
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 157.26
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 159.04
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 156.28
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 13.26
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 141.99
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 24.76
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -402
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.51
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 29.06
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 157.26
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 159.04
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 156.28
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 13.26
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 141.99
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 24.76
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -519
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.51
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 29.06
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 157.26
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 159.04
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 156.28
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 13.26
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 141.99
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 24.76
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -519
'29c668f1-a945-421e-a29b-454b21ad9537'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.98
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 29.74
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 10.36
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 59.78
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 15.21
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 584
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.98
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 29.74
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 10.36
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 59.78
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 15.21
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 469
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.98
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 29.74
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 10.36
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 59.78
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 15.21
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 469
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2.96
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.17
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 15.88
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 1.24
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 17.77
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 5.64
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 23.13
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 8.11
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 208
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 21.73
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 9.74
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 11.52
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 75.89
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 29.85
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 115.57
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 19.25
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 14.21
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 7.97
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -850
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 21.73
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 9.74
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 11.52
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 75.89
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 29.85
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 115.57
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 19.25
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 14.21
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 7.97
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -965
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 21.73
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 9.74
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 11.52
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 75.89
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 29.85
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 115.57
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 19.25
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 14.21
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 7.97
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -965
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2.96
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.3
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 16.12
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 2.3
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 7.66
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 18.9
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 15.4
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 20.38
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 317
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 2.65
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 19.45
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 16.32
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 13.19
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 4.89
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 17.56
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -569
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 2.65
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 19.45
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 16.32
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 13.19
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 4.89
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 17.56
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -683
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 2.65
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 19.45
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 16.32
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 13.19
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 4.89
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 17.56
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -683
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.65
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 18.9
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 8.59
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 14.24
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 21.36
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 23.33
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 122.59
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 1.13
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 14.9
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3113
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.65
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 18.9
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 8.59
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 14.24
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 21.36
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 23.33
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 122.59
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 1.13
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 14.9
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2999
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.65
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 18.9
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 8.59
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 14.24
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 21.36
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 23.33
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 122.59
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 1.13
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 14.9
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2999
'2f928f60-8888-42a2-a875-a4ebb322a7eb'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.79
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 3.43
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 1.39
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 6.92
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 2.12
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 455
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.45
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.36
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 2.28
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.22
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 2.74
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 0.89
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 3.5
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.17
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -182
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.66
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.74
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.11
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 12.26
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 7.93
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 15.41
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 3.12
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 2.46
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.62
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -656
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.45
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.38
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 2.3
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.38
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.08
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 2.88
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 2.34
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 3.06
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 338
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.4
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 1.97
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.72
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.47
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.72
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 2.56
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -531
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.2
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 10.42
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 54.06
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 54.86
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 53.43
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 4.34
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 48.62
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 8.13
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -413
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.27
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 3.22
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 1.53
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 2.49
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 3.74
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 3.96
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 18.34
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.19
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 2.43
'31ff61f1-466d-4bef-80db-fea4f3dcd4a1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 4899
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.52
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.21
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.21
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 5.88
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 2.42
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 2.32
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 4.71
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 162
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 7.52
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.21
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.21
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 5.88
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 2.42
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 2.32
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 4.71
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 50
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 7.52
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.21
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.21
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 5.88
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 2.42
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 2.32
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 4.71
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 50
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.11
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 7.26
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.92
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 17.13
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 6
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 671
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.11
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 7.26
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 2.92
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 17.13
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 6
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 559
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.11
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 7.26
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 2.92
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 17.13
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 6
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 559
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.33
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.9
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 4.68
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.47
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 8.08
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.57
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 9.59
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.54
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 13
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.68
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 3.36
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.25
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 34.19
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 9.72
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 38.03
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 9.71
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 6.18
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 4.23
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1500
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 10.68
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 3.36
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 4.25
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 34.19
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 9.72
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 38.03
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 9.71
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 6.18
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 4.23
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1388
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 10.68
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 3.36
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 4.25
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 34.19
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 9.72
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 38.03
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 9.71
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 6.18
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 4.23
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1388
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.53
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.22
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 2.16
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 5.14
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 2.52
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 6.96
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 104
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 7.53
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.22
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 2.16
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 5.14
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 2.52
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 6.96
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -8
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 7.53
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.22
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 2.16
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 5.14
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 2.52
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 6.96
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -8
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.19
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 4.16
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.83
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 3.51
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.98
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 7.55
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -493
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.19
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 4.16
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 3.83
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 3.51
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.98
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 7.55
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -605
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.19
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 4.16
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 3.83
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 3.51
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.98
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 7.55
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -605
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.43
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 28.45
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 166.51
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 170.98
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 162.69
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 10.43
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 154.65
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 23.45
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2978
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.43
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 28.45
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 166.51
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 170.98
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 162.69
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 10.43
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 154.65
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 23.45
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2865
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.43
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 28.45
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 166.51
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 170.98
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 162.69
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 10.43
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 154.65
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 23.45
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2865
'37c35ad4-8588-4554-abb9-8ee1232e3442'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 1.08
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 15.85
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 1.26
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 8.08
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.87
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 6.81
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 8.52
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 15.34
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1060
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 1.08
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 15.85
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 1.26
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 8.08
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.87
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 6.81
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 8.52
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 15.34
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 944
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 1.08
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 15.85
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 1.26
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 8.08
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.87
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 6.81
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 8.52
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 15.34
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 944
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.94
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 30.58
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 10.76
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 59.8
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 14.98
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 572
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.94
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 30.58
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 10.76
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 59.8
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 14.98
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 457
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.94
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 30.58
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 10.76
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 59.8
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 14.98
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 457
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2.88
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.22
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 16.37
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 1.32
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 17.02
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 5.46
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 22.77
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 8.28
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -38
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 22.39
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 11.68
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 13.5
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 73.09
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 34.89
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 116.41
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 18.03
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 14.01
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 8.02
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -604
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 22.39
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 11.68
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 13.5
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 73.09
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 34.89
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 116.41
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 18.03
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 14.01
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 8.02
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -720
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 22.39
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 11.68
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 13.5
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 73.09
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 34.89
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 116.41
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 18.03
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 14.01
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 8.02
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -720
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2.88
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.34
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 16.61
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 2.34
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 7.85
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 18.21
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 14.88
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 20.49
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 446
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 2.55
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 19.87
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 16.57
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 13.26
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 4.8
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 17.08
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -585
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 2.55
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 19.87
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 16.57
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 13.26
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 4.8
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 17.08
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -701
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 2.55
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 19.87
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 16.57
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 13.26
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 4.8
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 17.08
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -701
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.07
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 54.91
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 337.67
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 344.1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 332.86
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 24.11
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 313.58
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 51.05
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -365
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.07
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 54.91
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 337.67
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 344.1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 332.86
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 24.11
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 313.58
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 51.05
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -480
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.07
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 54.91
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 337.67
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 344.1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 332.86
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 24.11
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 313.58
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 51.05
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -480
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.61
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 18.99
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 9.11
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 15.19
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 22.79
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 24.06
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 117.25
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 1.2
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 14.5
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5675
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.61
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 18.99
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 9.11
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 15.19
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 22.79
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 24.06
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 117.25
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 1.2
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 14.5
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5559
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.61
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 18.99
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 9.11
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 15.19
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 22.79
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 24.06
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 117.25
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 1.2
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 14.5
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5559
'3c665152-1a7d-4591-b14d-e21b8d7a9c3e'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.06
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.83
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 0.33
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.05
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 0.46
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 0.78
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1071
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.06
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.83
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 0.33
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.05
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 0.46
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 0.78
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 957
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.06
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.83
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 0.33
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.05
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 0.46
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 0.78
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 957
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.84
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.03
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.03
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 0.6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 0.25
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 0.23
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 0.47
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 148
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.84
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.03
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.03
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 0.6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 0.25
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 0.23
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 0.47
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 34
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.84
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.03
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.03
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 0.6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 0.25
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 0.23
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 0.47
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 34
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.24
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 0.77
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 0.34
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 1.66
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 0.6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 659
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.24
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 0.77
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 0.34
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 1.66
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 0.6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 544
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.24
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 0.77
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 0.34
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 1.66
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 0.6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 544
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.13
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.11
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 0.56
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 0.81
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 0.99
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 0.29
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.38
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 0.69
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 0.8
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 3.57
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 1.94
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 4.02
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 0.97
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 0.7
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 0.51
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1370
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.38
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 0.69
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 0.8
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 3.57
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 1.94
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 4.02
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 0.97
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 0.7
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 0.51
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1256
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.38
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 0.69
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 0.8
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 3.57
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 1.94
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 4.02
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 0.97
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 0.7
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 0.51
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1256
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.84
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.03
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 0.52
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 0.69
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 89
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.84
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.03
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 0.52
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 0.69
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.84
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.03
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 0.52
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 0.26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 0.69
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -26
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.12
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 0.4
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 0.37
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 0.34
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.2
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 0.75
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -498
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.12
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 0.4
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 0.37
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 0.34
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 0.2
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 0.75
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -613
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.12
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 0.4
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 0.37
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 0.34
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 0.2
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 0.75
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -613
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 3.22
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 16.35
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 16.66
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 16.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 1.23
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 14.64
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 2.43
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2892
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 3.22
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 16.35
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 16.66
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 16.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 1.23
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 14.64
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 2.43
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2778
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 3.22
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 16.35
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 16.66
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 16.07
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 1.23
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 14.64
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 2.43
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2778
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.4
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 0.91
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 0.39
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 0.6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 0.91
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 1.04
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 5.43
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.04
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 0.74
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6108
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.4
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 0.91
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 0.39
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 0.6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 0.91
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 1.04
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 5.43
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.04
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 0.74
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5993
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.4
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 0.91
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 0.39
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 0.6
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 0.91
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 1.04
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 5.43
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.04
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 0.74
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5993
'491dd1aa-a19f-44c4-9eb4-ab1db0366232'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 1.28
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 16.17
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 1.72
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 6.8
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 1.11
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 5.07
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 12.42
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 18.63
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 182
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 3.88
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.02
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 17.56
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 1.78
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 23.66
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 7.27
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 28.75
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 8.92
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 8
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 23.07
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.1
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 5.99
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 100.42
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 12.32
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 143.6
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 27.19
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 17.35
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 8.98
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -361
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 24.16
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.8
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 8.15
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 14.89
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 7.03
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 20.07
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 103
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 3.88
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.15
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 17.82
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 3.15
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 8.35
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 24.83
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 20.38
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 23.34
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 361
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 3.53
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 24.26
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 20.58
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 16.9
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 6.2
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 23.18
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -542
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.48
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 69.7
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 503.59
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 517.74
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 490.97
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 27.53
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 486.08
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 68.93
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -211
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.83
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 21.55
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 7.97
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 12.12
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 18.17
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 23.54
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 166.58
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.99
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 19.03
'4f342422-711d-4afa-99dd-cfdd524f89da'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6162
'5046c214-249f-444b-a3bc-80fb9e80b722'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.83
'5046c214-249f-444b-a3bc-80fb9e80b722'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 1.43
'5046c214-249f-444b-a3bc-80fb9e80b722'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 1.24
'5046c214-249f-444b-a3bc-80fb9e80b722'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 1.58
'5046c214-249f-444b-a3bc-80fb9e80b722'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 1.06
'5046c214-249f-444b-a3bc-80fb9e80b722'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'sep' 0.01
'5046c214-249f-444b-a3bc-80fb9e80b722'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 539
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.31
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.84
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.28
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.42
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.23
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.15
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.36
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 3.89
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 145
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.68
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.5
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 2.58
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.28
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 4.16
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.34
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 5.02
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.38
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.29
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.59
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.11
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 17.94
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 7.44
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 19.92
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 5
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.37
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.41
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -453
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.05
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.13
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 1.19
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.67
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.32
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 3.58
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 97
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.68
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.51
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 2.59
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.51
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.23
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 4.3
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 3.63
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 3.91
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 360
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.61
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 2.03
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.88
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.73
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.02
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.86
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -493
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.26
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 15.66
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 84.77
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 86.78
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 83.08
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 5.85
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 77.25
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 12.28
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -296
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.86
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 4.33
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 1.72
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 2.67
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 4.01
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 4.85
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 28.04
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.2
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 3.75
'50c00b36-8d46-43ae-bc8f-d260c964336a'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6138
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.49
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.26
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.42
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.43
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.37
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 2.02
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 3.87
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 6.34
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1072
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.49
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.26
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.42
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.43
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.37
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 2.02
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 3.87
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 6.34
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 959
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.49
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.26
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.42
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.43
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.37
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 2.02
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 3.87
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 6.34
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 959
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.84
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 7.17
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.84
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 15.92
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 5.25
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 672
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.84
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 7.17
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 2.84
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 15.92
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 5.25
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 559
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.84
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 7.17
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 2.84
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 15.92
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 5.25
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 559
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.14
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.79
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 4.64
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.43
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 6.97
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.23
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 8.48
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.47
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -4
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.91
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.92
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 29.97
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 11.95
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 35.04
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 8.21
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 5.61
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 3.74
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -512
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.91
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 4.1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 4.92
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 29.97
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 11.95
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 35.04
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 8.21
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 5.61
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 3.74
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -625
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.91
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 4.1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 4.92
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 29.97
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 11.95
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 35.04
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 8.21
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 5.61
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 3.74
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -625
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.14
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.81
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 4.67
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.81
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 2.24
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 7.25
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 6.03
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 6.83
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 487
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.03
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 4.16
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.74
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 3.31
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.75
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 6.5
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -506
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.03
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 4.16
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 3.74
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 3.31
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.75
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 6.5
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -619
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.03
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 4.16
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 3.74
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 3.31
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.75
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 6.5
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -619
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.38
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 24.91
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 141.47
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 144.78
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 138.75
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 9.59
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 130.35
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 20.28
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -331
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.38
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 24.91
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 141.47
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 144.78
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 138.75
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 9.59
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 130.35
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 20.28
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -444
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.38
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 24.91
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 141.47
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 144.78
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 138.75
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 9.59
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 130.35
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 20.28
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -444
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.94
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 7.19
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.91
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 4.66
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 6.99
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 8.26
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 47.09
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.35
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 6.12
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5757
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.94
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 7.19
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 2.91
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 4.66
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 6.99
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 8.26
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 47.09
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.35
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 6.12
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5643
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.94
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 7.19
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 2.91
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 4.66
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 6.99
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 8.26
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 47.09
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.35
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 6.12
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5643
'517bcd1e-a8a1-47b1-bd46-346087c6d25d'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.17
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 10.05
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 3.85
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 20.99
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 6.25
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 461
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.31
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.93
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 6.25
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.52
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 8
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.57
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 10.07
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.27
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -170
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.31
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.97
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 6.32
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.97
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 3.02
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 8.41
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 6.86
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 8.6
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 351
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.18
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 6.06
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 5.27
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 4.48
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.08
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 7.54
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -529
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.45
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 28.12
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 160.06
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 163.23
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 157.57
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 11.5
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 147.28
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 23.31
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -356
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.34
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 8.7
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 3.86
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 6.37
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 9.55
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 10.54
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 54.08
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.49
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 6.93
'52538145-10b4-4954-a8ee-0c68d56f8ef4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 4935
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.73
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 19.01
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 7.03
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 33.78
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 8.46
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 275
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.54
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.29
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 10.11
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.81
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 8.31
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.82
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 12.7
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 5.05
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -257
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 15.22
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 11.83
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 13.05
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 37.72
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 34.97
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 70.04
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 8.08
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 8.11
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 5.33
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -959
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.54
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.37
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 10.28
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.37
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 4.81
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 9.09
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 7.89
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 11.97
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 250
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.29
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 11.94
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 9.76
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 7.57
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.64
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 9.22
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -672
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.64
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 31.35
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 155.89
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 156.57
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 156.14
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 15.22
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 135.86
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 28.17
'56cf5dd6-5095-4c8d-961f-68194c78cb95'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -582
'57adb615-1470-4228-9c08-f8cc8bc27bd6'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.78
'57adb615-1470-4228-9c08-f8cc8bc27bd6'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 11.59
'57adb615-1470-4228-9c08-f8cc8bc27bd6'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 10.02
'57adb615-1470-4228-9c08-f8cc8bc27bd6'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 13.59
'57adb615-1470-4228-9c08-f8cc8bc27bd6'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 8.5
'57adb615-1470-4228-9c08-f8cc8bc27bd6'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'sep' 0.11
'57adb615-1470-4228-9c08-f8cc8bc27bd6'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 520
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.34
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.81
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.34
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.2
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.25
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.85
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.54
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 4.45
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 125
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.77
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.59
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 3.87
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.35
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 4.72
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.53
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 6.01
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -19
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.62
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.28
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.88
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 20.93
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 12.46
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 26.55
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 5.36
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 4.14
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.67
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -566
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.77
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.61
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 3.9
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.61
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.85
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 4.97
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 4.04
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 5.23
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 331
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.69
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 3.51
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.05
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 2.59
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.23
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 4.42
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -531
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.31
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 17.42
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 93.46
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 95.01
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 92.27
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 7.23
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 84.77
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 13.91
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -347
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.1
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 5.4
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.52
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 4.14
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 6.21
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 6.65
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 31.71
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.31
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 4.15
'57c6eebe-93f4-4ae7-a034-47a1411692c7'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6070
'58a1d807-8c1a-4075-8db4-d230dda3d446'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.06
'58a1d807-8c1a-4075-8db4-d230dda3d446'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 0.11
'58a1d807-8c1a-4075-8db4-d230dda3d446'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 0.09
'58a1d807-8c1a-4075-8db4-d230dda3d446'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 0.12
'58a1d807-8c1a-4075-8db4-d230dda3d446'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 0.08
'58a1d807-8c1a-4075-8db4-d230dda3d446'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 538
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.51
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.03
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.4
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.09
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.38
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.69
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 4.03
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 6.43
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -19
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.51
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.03
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.4
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.09
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.38
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 1.69
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 4.03
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 6.43
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -131
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.51
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.03
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.4
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.09
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.38
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 1.69
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 4.03
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 6.43
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -131
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.85
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 6.28
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.56
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 14.81
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 5.26
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 680
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.85
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 6.28
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 2.56
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 14.81
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 5.26
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 568
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.85
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 6.28
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 2.56
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 14.81
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 5.26
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 568
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.17
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.77
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 4.1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.39
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 7.11
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.27
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 8.46
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.24
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 240
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.58
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 3.14
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.94
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 30.16
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 9.34
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 33.38
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 8.55
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 5.49
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 3.82
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -764
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.58
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 3.14
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 3.94
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 30.16
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 9.34
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 33.38
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 8.55
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 5.49
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 3.82
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -876
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.58
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 3.14
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 3.94
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 30.16
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 9.34
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 33.38
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 8.55
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 5.49
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 3.82
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -876
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.17
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.8
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 4.13
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.8
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.99
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 7.34
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 6.21
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 6.45
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 356
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.05
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 3.55
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.28
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 3.02
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.74
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 6.63
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -492
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.05
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 3.55
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 3.28
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 3.02
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.74
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 6.63
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -604
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.05
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 3.55
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 3.28
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 3.02
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.74
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 6.63
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -604
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.98
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 6.99
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.58
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 4.01
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 6.02
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 7.65
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 48.13
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.3
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 6.3
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3190
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.98
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 6.99
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 2.58
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 4.01
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 6.02
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 7.65
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 48.13
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.3
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 6.3
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 3078
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.98
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 6.99
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 2.58
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 4.01
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 6.02
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 7.65
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 48.13
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.3
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 6.3
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 3078
'5b0f98dd-5548-40cf-8a5c-5f75316dc82c'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.3
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.41
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.31
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.15
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.22
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.83
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.15
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 3.92
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1055
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.3
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.41
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.31
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.15
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.22
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 1.83
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 2.15
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 3.92
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 938
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.3
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.41
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.31
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.15
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.22
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 1.83
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 2.15
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 3.92
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 938
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.98
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.14
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.14
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 3.04
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 1.26
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 1.1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 2.37
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 133
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.98
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.14
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.14
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 3.04
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 1.26
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 1.1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 2.37
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 16
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.98
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.14
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.14
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 3.04
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 1.26
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 1.1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 2.37
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 16
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.18
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 5.83
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.28
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 11.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 3.27
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 594
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.18
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 5.83
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 2.28
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 11.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 3.27
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 477
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.18
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 5.83
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 2.28
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 11.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 3.27
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 477
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.67
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.53
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 3.71
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.32
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 4.09
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.33
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 5.36
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.9
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -33
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.95
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.37
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.91
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 18.41
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 12.74
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 24.67
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 4.54
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.74
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.36
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1259
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.95
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 4.37
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 4.91
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 18.41
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 12.74
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 24.67
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 4.54
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 3.74
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 2.36
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1143
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.95
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 4.37
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 4.91
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 18.41
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 12.74
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 24.67
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 4.54
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 3.74
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 2.36
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1143
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.99
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.15
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 1.76
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.69
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.31
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 3.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 68
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.99
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.15
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 1.76
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 2.69
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 1.31
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 3.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -49
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.99
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.15
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 1.76
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 2.69
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 1.31
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 3.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -49
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.6
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 3.47
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 2.97
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 2.47
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.87
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -550
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.6
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 3.47
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 2.97
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 2.47
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 3.87
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -667
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.6
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 3.47
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 2.97
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 2.47
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 3.87
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -667
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.28
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 15.23
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 79.91
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 80.93
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 79.19
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 6.59
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 71.95
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 12.18
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2850
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.28
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 15.23
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 79.91
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 80.93
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 79.19
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 6.59
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 71.95
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 12.18
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2734
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.28
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 15.23
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 79.91
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 80.93
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 79.19
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 6.59
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 71.95
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 12.18
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2734
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.85
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 4.91
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 4.05
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 6.08
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 6.25
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 27.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.31
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 3.6
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6032
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.85
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 4.91
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 2.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 4.05
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 6.08
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 6.25
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 27.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.31
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 3.6
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5916
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.85
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 4.91
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 2.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 4.05
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 6.08
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 6.25
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 27.44
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.31
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 3.6
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5916
'5d77eeed-ef89-4330-9a3a-65f4f5ffdfbd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'6080737a-051e-488c-8b96-0d27a9366093'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.9
'6080737a-051e-488c-8b96-0d27a9366093'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 11.25
'6080737a-051e-488c-8b96-0d27a9366093'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.92
'6080737a-051e-488c-8b96-0d27a9366093'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 4.37
'6080737a-051e-488c-8b96-0d27a9366093'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.72
'6080737a-051e-488c-8b96-0d27a9366093'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 3.45
'6080737a-051e-488c-8b96-0d27a9366093'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 7.83
'6080737a-051e-488c-8b96-0d27a9366093'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 12.12
'6080737a-051e-488c-8b96-0d27a9366093'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 168
'6080737a-051e-488c-8b96-0d27a9366093'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2.34
'6080737a-051e-488c-8b96-0d27a9366093'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.69
'6080737a-051e-488c-8b96-0d27a9366093'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 9.64
'6080737a-051e-488c-8b96-0d27a9366093'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.94
'6080737a-051e-488c-8b96-0d27a9366093'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 14.36
'6080737a-051e-488c-8b96-0d27a9366093'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 4.51
'6080737a-051e-488c-8b96-0d27a9366093'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 17.28
'6080737a-051e-488c-8b96-0d27a9366093'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 5.06
'6080737a-051e-488c-8b96-0d27a9366093'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 9
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 16.59
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.74
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 6.08
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 60.63
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 13.75
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 75.07
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 16.72
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 10.8
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 6.38
'6080737a-051e-488c-8b96-0d27a9366093'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -382
'6080737a-051e-488c-8b96-0d27a9366093'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 14.24
'6080737a-051e-488c-8b96-0d27a9366093'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.43
'6080737a-051e-488c-8b96-0d27a9366093'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 4.47
'6080737a-051e-488c-8b96-0d27a9366093'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 9.12
'6080737a-051e-488c-8b96-0d27a9366093'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 4.4
'6080737a-051e-488c-8b96-0d27a9366093'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 12.18
'6080737a-051e-488c-8b96-0d27a9366093'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 102
'6080737a-051e-488c-8b96-0d27a9366093'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'6080737a-051e-488c-8b96-0d27a9366093'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2.34
'6080737a-051e-488c-8b96-0d27a9366093'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.74
'6080737a-051e-488c-8b96-0d27a9366093'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 9.73
'6080737a-051e-488c-8b96-0d27a9366093'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.74
'6080737a-051e-488c-8b96-0d27a9366093'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 4.63
'6080737a-051e-488c-8b96-0d27a9366093'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 14.95
'6080737a-051e-488c-8b96-0d27a9366093'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 12.36
'6080737a-051e-488c-8b96-0d27a9366093'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 13.8
'6080737a-051e-488c-8b96-0d27a9366093'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 363
'6080737a-051e-488c-8b96-0d27a9366093'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 2.13
'6080737a-051e-488c-8b96-0d27a9366093'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 10.55
'6080737a-051e-488c-8b96-0d27a9366093'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 9.25
'6080737a-051e-488c-8b96-0d27a9366093'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 7.95
'6080737a-051e-488c-8b96-0d27a9366093'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 3.63
'6080737a-051e-488c-8b96-0d27a9366093'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 13.6
'6080737a-051e-488c-8b96-0d27a9366093'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -515
'6080737a-051e-488c-8b96-0d27a9366093'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.81
'6080737a-051e-488c-8b96-0d27a9366093'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 45.89
'6080737a-051e-488c-8b96-0d27a9366093'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 297.12
'6080737a-051e-488c-8b96-0d27a9366093'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 304.96
'6080737a-051e-488c-8b96-0d27a9366093'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 290.23
'6080737a-051e-488c-8b96-0d27a9366093'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 17.62
'6080737a-051e-488c-8b96-0d27a9366093'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 281.66
'6080737a-051e-488c-8b96-0d27a9366093'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 40.97
'6080737a-051e-488c-8b96-0d27a9366093'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -233
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.4
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 13.76
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 5.22
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 8.13
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 12.2
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 15.24
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 98.45
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.63
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 12.05
'6080737a-051e-488c-8b96-0d27a9366093'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6157
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 11.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.27
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.27
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 6.45
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 2.68
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 2.26
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 5.2
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 60
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 11.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.27
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.27
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 6.45
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 2.68
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 2.26
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 5.2
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -58
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 11.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.27
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.27
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 6.45
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 2.68
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 2.26
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 5.2
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -58
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.51
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 15.13
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 5.6
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 28.78
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 7.5
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 366
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.51
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 15.13
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 5.6
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 28.78
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 7.5
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 249
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.51
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 15.13
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 5.6
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 28.78
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 7.5
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 249
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.46
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.11
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 8.79
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.66
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 8.65
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.83
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 11.86
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 4.47
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 123
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 14.03
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 9.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 10.39
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 38.69
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 27.45
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 59.01
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 9.13
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 7.9
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 4.76
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -672
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 14.03
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 9.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 10.39
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 38.69
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 27.45
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 59.01
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 9.13
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 7.9
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 4.76
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -790
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 14.03
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 9.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 10.39
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 38.69
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 27.45
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 59.01
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 9.13
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 7.9
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 4.76
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -790
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 11.31
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 4.16
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 5.72
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 2.77
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 7.41
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -6
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 11.31
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 4.16
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 5.72
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 2.77
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 7.41
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -124
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 11.31
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 4.16
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 5.72
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 2.77
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 7.41
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -124
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.46
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.18
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 8.92
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.18
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 4.23
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 9.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 7.53
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 11.01
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 415
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 9.44
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 7.89
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 6.34
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.46
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 8.57
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -588
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 9.44
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 7.89
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 6.34
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 2.46
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 8.57
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -706
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.29
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 9.44
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 7.89
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 6.34
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 2.46
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 8.57
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -706
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.54
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 30.68
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 167.26
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 169.24
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 166.15
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 13.98
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 151.28
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 26.28
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -397
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.54
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 30.68
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 167.26
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 169.24
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 166.15
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 13.98
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 151.28
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 26.28
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -514
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.54
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 30.68
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 167.26
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 169.24
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 166.15
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 13.98
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 151.28
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 26.28
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -514
'728266df-d91a-4b7a-a46c-77da50a350a3'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.83
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 12.46
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.89
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 6.45
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.65
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 5.55
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 6.17
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 11.5
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 120
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2.07
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.57
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 12.18
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.92
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 12.29
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.99
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 16.67
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 6.19
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -41
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 18.21
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 11.06
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 12.51
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 53.9
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 32.87
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 83.7
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 12.97
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 10.72
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 6.31
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -613
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 15.71
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.41
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 5.76
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 8.06
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 3.89
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 10.54
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 63
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2.07
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.66
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 12.36
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.66
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 5.87
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 13.18
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 10.72
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 15.29
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 305
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.84
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 13.78
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 11.51
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 9.24
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 3.48
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 12.23
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -587
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.75
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 41.74
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 239.87
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 243.49
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 237.49
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 18.74
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 219.58
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 37.04
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -361
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.04
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 14.44
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 7.23
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 12.27
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 18.4
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 18.8
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 83.82
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.96
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 10.66
'735c0570-831d-4854-964e-7b96a9ee4c93'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6019
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.3
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.77
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.27
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.39
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.23
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.12
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.32
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 3.81
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 144
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.67
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.49
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 2.52
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.28
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 4.08
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.31
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 4.92
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.35
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.18
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.55
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.06
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 17.58
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 7.31
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 19.5
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 4.91
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.3
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.37
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -454
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.97
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.13
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 1.17
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.62
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.29
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 3.51
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 97
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.67
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.5
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 2.53
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.5
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.2
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 4.22
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 3.56
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 3.83
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 360
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.6
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 1.98
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.84
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.69
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.78
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -493
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.26
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 15.37
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 83.09
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 85.06
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 81.43
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 5.74
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 75.69
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 12.05
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -297
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.84
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 4.26
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 1.69
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 2.62
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 3.93
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 4.75
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 27.48
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.19
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 3.67
'7d3bd4f6-1f40-4ec5-9522-f35cc5d4141f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6138
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.53
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.58
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.51
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 3.58
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.4
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 3.07
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 4
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 7.05
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1070
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.53
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 7.58
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.51
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 3.58
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.4
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 3.07
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 4
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 7.05
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 955
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.53
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 7.58
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.51
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 3.58
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.4
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 3.07
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 4
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 7.05
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 955
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 8.92
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.23
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.23
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 5.61
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 2.32
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 2.05
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 4.4
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 75
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 8.92
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.23
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.23
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 5.61
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 2.32
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 2.05
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 4.4
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -40
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 8.92
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.23
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.23
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 5.61
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 2.32
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 2.05
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 4.4
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -40
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 10.66
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 4.04
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 21.45
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 6.08
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 421
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 10.66
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 4.04
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 21.45
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 6.08
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 306
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 10.66
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 4.04
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 21.45
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 6.08
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 306
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.25
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.92
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 6.56
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.53
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 7.58
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.45
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 9.8
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.38
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 148
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 11.65
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 6.6
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 7.52
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 33.46
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 19.42
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 44.97
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 8.43
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 6.6
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 4.06
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -566
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 11.65
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 6.6
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 7.52
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 33.46
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 19.42
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 44.97
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 8.43
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 6.6
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 4.06
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -682
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 11.65
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 6.6
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 7.52
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 33.46
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 19.42
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 44.97
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 8.43
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 6.6
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 4.06
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -682
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.25
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.96
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 6.63
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.96
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 3.16
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 8.03
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 6.49
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 8.68
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 445
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.12
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 6.5
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 5.56
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 4.63
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.03
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 7.21
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -546
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.12
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 6.5
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 5.56
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 4.63
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 2.03
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 7.21
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -661
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.12
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 6.5
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 5.56
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 4.63
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 2.03
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 7.21
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -661
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.45
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 26.87
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 149.75
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 152.23
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 147.93
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 11.44
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 136.88
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 22.3
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -341
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.45
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 26.87
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 149.75
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 152.23
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 147.93
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 11.44
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 136.88
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 22.3
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -456
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.45
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 26.87
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 149.75
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 152.23
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 147.93
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 11.44
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 136.88
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 22.3
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -456
'7f04f930-ed01-48ea-9d27-192c608145eb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.57
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 5.95
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 2.45
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 2.35
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 4.77
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 163
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 7.57
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 5.95
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 2.45
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 2.35
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 4.77
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 50
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 7.57
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 5.95
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 2.45
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 2.35
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 4.77
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 50
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.13
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 7.3
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.94
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 17.26
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 6.07
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 672
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.13
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 7.3
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 2.94
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 17.26
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 6.07
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 560
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.13
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 7.3
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 2.94
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 17.26
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 6.07
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 560
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.34
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.9
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 4.69
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.47
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 8.17
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.6
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 9.69
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.55
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 14
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.74
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 3.32
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 34.54
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 9.58
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 38.33
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 9.83
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 6.23
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 4.27
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1503
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 10.74
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 3.32
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 4.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 34.54
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 9.58
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 38.33
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 9.83
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 6.23
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 4.27
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1391
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 10.74
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 3.32
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 4.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 34.54
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 9.58
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 38.33
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 9.83
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 6.23
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 4.27
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1391
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 4.18
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.85
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 3.53
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 7.63
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -492
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 4.18
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 3.85
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 3.53
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 2
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 7.63
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -604
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.21
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 4.18
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 3.85
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 3.53
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 2
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 7.63
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -604
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.44
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 28.73
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 168.53
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 173.09
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 164.63
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 10.51
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 156.62
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 23.71
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2979
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.44
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 28.73
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 168.53
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 173.09
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 164.63
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 10.51
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 156.62
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 23.71
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2867
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.44
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 28.73
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 168.53
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 173.09
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 164.63
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 10.51
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 156.62
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 23.71
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2867
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.35
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 7.92
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.86
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 4.44
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 6.65
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 8.58
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 55.44
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.33
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 7.2
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6165
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.35
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 7.92
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 2.86
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 4.44
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 6.65
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 8.58
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 55.44
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.33
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 7.2
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 6053
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.35
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 7.92
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 2.86
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 4.44
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 6.65
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 8.58
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 55.44
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.33
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 7.2
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 6053
'8426f1c8-60e8-4b27-8149-18b5e2b7d9d9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'89d58023-e01c-4f7c-ae06-d271a0dcb687'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.25
'89d58023-e01c-4f7c-ae06-d271a0dcb687'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 9.34
'89d58023-e01c-4f7c-ae06-d271a0dcb687'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 8.02
'89d58023-e01c-4f7c-ae06-d271a0dcb687'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 9.45
'89d58023-e01c-4f7c-ae06-d271a0dcb687'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 6.8
'89d58023-e01c-4f7c-ae06-d271a0dcb687'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'sep' 0.09
'89d58023-e01c-4f7c-ae06-d271a0dcb687'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 579
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.82
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.19
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.72
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.88
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.65
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 2.16
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 7.1
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 10.64
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 176
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2.06
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.4
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 6.73
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.73
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 12.57
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.94
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 14.6
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.66
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 22
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 14.08
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.39
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.56
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 52.38
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 6.71
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 58.16
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 15.19
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 9.03
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 5.8
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -330
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 11.07
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.34
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 3.08
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 7.9
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 3.85
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 10.84
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 112
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2.06
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.43
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 6.77
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.43
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 3.24
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 12.93
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 10.99
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 10.72
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 380
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.86
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 6.83
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 6.26
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 5.7
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 3.05
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 11.84
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -491
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.76
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 11.28
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 3.64
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 5.4
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 8.1
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 11.56
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 86.11
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.41
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 10.79
'8ef6ae90-29ab-4683-8841-6404a1c13d9c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6193
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.23
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.23
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.24
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.48
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.17
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.23
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 1.67
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 2.94
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 120
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.5
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.41
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 2.53
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.25
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 3.08
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 3.93
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.3
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -21
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.18
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.99
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.4
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 13.76
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 8.65
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 17.21
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 3.52
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 2.75
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.81
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -584
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.5
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.42
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 2.55
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.42
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.2
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 3.24
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 2.64
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 3.41
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 329
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.45
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 2.2
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.92
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.64
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.8
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 2.88
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -529
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.22
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 11.67
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 60.96
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 61.9
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 60.22
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 4.83
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 54.93
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 9.13
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -361
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.42
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 3.59
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 1.7
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 2.75
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 4.13
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 4.4
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 20.66
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.21
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 2.73
'93061ffa-9b21-4820-8d18-ceb6e044573c'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6065
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.25
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.98
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.29
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.1
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.19
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.81
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 1.75
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 3.41
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 91
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.58
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.48
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 3.56
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.3
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 3.44
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.13
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 4.72
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.79
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -55
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.24
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.44
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.92
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 15.78
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 12.97
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 23.05
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 3.67
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.32
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.06
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -741
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.57
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.14
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 1.69
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.28
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.11
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 2.92
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 51
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.58
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.5
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 3.6
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.5
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.69
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 3.69
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 2.97
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 4.43
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 289
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.51
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 3.49
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 2.93
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 2.37
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.97
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.35
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -583
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.26
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 12.98
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 65.98
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 66.48
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 65.75
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 5.94
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 58.73
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 10.51
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -440
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.6
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 4.41
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.35
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 3.96
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 5.93
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 5.85
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 23.1
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.3
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 3.07
'93e7ab36-267d-451f-b4c4-88b3bee31ced'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5971
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.25
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.09
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.23
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.17
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.18
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 0.94
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 1.86
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 3.08
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1084
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.25
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.09
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.23
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 1.17
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.18
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 0.94
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 1.86
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 3.08
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 970
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.25
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.09
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.23
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 1.17
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.18
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 0.94
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 1.86
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 3.08
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 970
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.22
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.11
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.11
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 2.39
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 0.95
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 1.9
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 154
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.22
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.11
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.11
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 2.39
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 0.95
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 1.9
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 41
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.22
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.11
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.11
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 2.39
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 0.95
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 1.9
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 41
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.9
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 2.96
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 1.27
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 6.66
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 2.41
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 667
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.9
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 2.96
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 1.27
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 6.66
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 2.41
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 553
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.9
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 2.96
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 1.27
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 6.66
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 2.41
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 553
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.54
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.41
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 2.07
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.24
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 3.27
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.05
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 3.96
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.09
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.21
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 2.63
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 14.16
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 6.32
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 15.74
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 3.93
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 2.68
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.94
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1424
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 5.09
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 2.21
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 2.63
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 14.16
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 6.32
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 15.74
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 3.93
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 2.68
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 1.94
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1310
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 5.09
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 2.21
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 2.63
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 14.16
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 6.32
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 15.74
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 3.93
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 2.68
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 1.94
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1310
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.22
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.11
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 0.96
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.04
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 2.81
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 95
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.22
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.11
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 0.96
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 2.1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 1.04
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 2.81
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -18
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.22
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.11
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 0.96
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 2.1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 1.04
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 2.81
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -18
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.48
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 1.59
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.47
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.35
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.81
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.03
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -494
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.48
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 1.59
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 1.47
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 1.35
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 0.81
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 3.03
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -608
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.48
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 1.59
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 1.47
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 1.35
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 0.81
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 3.03
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -608
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.22
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 12.48
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 66.41
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 67.92
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 65.12
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 4.69
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 60.24
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 9.69
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2926
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.22
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 12.48
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 66.41
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 67.92
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 65.12
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 4.69
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 60.24
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 9.69
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2812
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.22
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 12.48
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 66.41
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 67.92
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 65.12
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 4.69
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 60.24
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 9.69
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2812
'94349f85-29cb-4131-9d16-cfec1abe0dbe'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 1.03
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 14.74
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 1.12
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 7.18
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.83
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 6.06
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 8.4
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 14.52
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -31
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 1.03
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 14.74
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 1.12
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 7.18
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.83
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 6.06
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 8.4
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 14.52
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -146
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 1.03
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 14.74
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 1.12
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 7.18
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.83
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 6.06
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 8.4
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 14.52
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -146
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.58
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 27.22
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 9.56
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 54.59
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 14.02
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 584
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.58
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 27.22
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 9.56
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 54.59
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 14.02
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 470
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.58
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 27.22
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 9.56
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 54.59
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 14.02
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 470
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2.74
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.98
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 14.77
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 1.12
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 16.46
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 5.25
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 21.48
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 7.57
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 206
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 20.79
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 9.85
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 11.55
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 70.58
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 30.06
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 106.39
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 17.82
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 13.34
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 7.55
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -865
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 20.79
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 9.85
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 11.55
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 70.58
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 30.06
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 106.39
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 17.82
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 13.34
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 7.55
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -979
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 20.79
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 9.85
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 11.55
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 70.58
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 30.06
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 106.39
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 17.82
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 13.34
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 7.55
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -979
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2.74
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 14.99
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 2.1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 7.14
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 17.52
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 14.24
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 19.01
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 315
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 2.46
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 17.68
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 14.86
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 12.03
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 4.53
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 16.21
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -568
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 2.46
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 17.68
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 14.86
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 12.03
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 4.53
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 16.21
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -682
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 2.46
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 17.68
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 14.86
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 12.03
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 4.53
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 16.21
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -682
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.22
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 17.71
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 8.13
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 13.6
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 20.4
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 22.07
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 113.19
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 1.07
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 13.87
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3107
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.22
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 17.71
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 8.13
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 13.6
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 20.4
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 22.07
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 113.19
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 1.07
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 13.87
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2992
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.22
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 17.71
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 8.13
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 13.6
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 20.4
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 22.07
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 113.19
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 1.07
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 13.87
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2992
'984e545f-af0a-41a2-ac55-0e2674f41ce0'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.8
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 11.95
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.84
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 6.08
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.62
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 5.25
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 6.04
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 11.09
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -55
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.8
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 11.95
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.84
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 6.08
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.62
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 5.25
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 6.04
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 11.09
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -171
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.8
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 11.95
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.84
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 6.08
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.62
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 5.25
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 6.04
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 11.09
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -171
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.38
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 20.31
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 7.35
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 39.5
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 10.24
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 580
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.38
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 20.31
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 7.35
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 39.5
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 10.24
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 464
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.38
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 20.31
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 7.35
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 39.5
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 10.24
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 464
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.47
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 11.52
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.85
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 11.93
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.86
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 16.02
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 5.88
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 216
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.56
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 11.69
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.56
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 5.56
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 12.76
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 10.35
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 14.61
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 319
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.78
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 12.88
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 10.79
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 8.71
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 3.34
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 11.77
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -579
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.78
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 12.88
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 10.79
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 8.71
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 3.34
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 11.77
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -696
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.78
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 12.88
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 10.79
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 8.71
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 3.34
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 11.77
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -696
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.71
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 40.47
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 233.5
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 237.16
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 231.03
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 18.01
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 214.18
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 35.68
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -431
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.71
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 40.47
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 233.5
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 237.16
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 231.03
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 18.01
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 214.18
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 35.68
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -547
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.71
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 40.47
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 233.5
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 237.16
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 231.03
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 18.01
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 214.18
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 35.68
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -547
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.86
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 13.85
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 6.84
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 11.61
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 17.42
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 17.93
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 81.25
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.91
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 10.3
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3391
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.86
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 13.85
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 6.84
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 11.61
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 17.42
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 17.93
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 81.25
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.91
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 10.3
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 3275
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.86
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 13.85
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 6.84
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 11.61
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 17.42
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 17.93
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 81.25
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.91
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 10.3
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 3275
'9bfa74c8-562f-491a-ad35-246eee02258b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.16
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 5.47
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 4.72
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 6.04
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 4.03
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'sep' 0.05
'9f0054fb-9407-4fdd-86e6-db8e8a1d58bf'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 543
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.15
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.94
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.15
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 0.76
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.11
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 0.61
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 1.12
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 1.88
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 134
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.32
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.26
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 1.3
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.16
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 1.97
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 0.64
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 2.4
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 0.68
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -2
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.22
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 1.51
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 1.78
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 8.62
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 4.3
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 9.64
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 2.37
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 1.66
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.2
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -497
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.32
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.26
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 1.31
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.26
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 0.61
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 2.04
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 1.72
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 1.91
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 353
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.29
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 0.97
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 0.89
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 0.82
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.49
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 1.82
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -496
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.15
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 7.7
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 39.91
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 40.75
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 39.18
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 2.92
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 35.96
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 5.88
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -324
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.93
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 2.15
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 0.91
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 1.39
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 2.09
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 2.44
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 13.24
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.1
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 1.79
'9fb4fcca-787e-46ad-9fbd-326061939c07'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6119
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.66
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.71
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.62
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 4.85
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.5
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 4.24
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 4.89
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 8.94
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -55
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.66
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.71
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.62
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 4.85
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.5
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 4.24
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 4.89
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 8.94
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -171
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.66
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.71
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.62
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 4.85
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.5
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 4.24
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 4.89
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 8.94
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -171
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.64
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 15.38
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 5.64
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 30.12
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 8.02
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 579
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.64
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 15.38
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 5.64
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 30.12
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 8.02
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 463
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.64
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 15.38
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 5.64
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 30.12
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 8.02
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 463
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.59
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.12
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 9
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.63
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 9.55
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.1
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 12.72
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 4.64
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 193
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 14.48
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 8.73
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 9.89
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 42.2
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 26.31
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 61.56
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 10.28
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 8.43
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 5.04
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -967
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 14.48
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 8.73
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 9.89
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 42.2
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 26.31
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 61.56
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 10.28
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 8.43
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 5.04
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -1083
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 14.48
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 8.73
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 9.89
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 42.2
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 26.31
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 61.56
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 10.28
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 8.43
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 5.04
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -1083
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.59
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.18
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 9.12
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.18
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 4.37
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 10.19
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 8.23
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 11.59
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 300
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.42
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 9.63
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 8.12
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 6.6
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.65
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 9.3
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -570
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.42
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 9.63
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 8.12
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 6.6
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 2.65
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 9.3
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -687
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.42
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 9.63
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 8.12
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 6.6
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 2.65
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 9.3
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -687
'a9ddc3fa-0004-495a-9349-0835e10b0d4b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.09
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 7.3
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.77
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 12.79
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 3.25
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 270
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.59
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.53
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 4.03
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.35
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 3.23
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.1
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 4.96
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -267
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.49
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 5.34
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 5.85
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 15.11
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 15.64
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 27.11
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 3.16
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.34
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.19
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -1049
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.59
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.56
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 4.1
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.56
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.91
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 3.53
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 3.04
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 4.74
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 238
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.5
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 4.49
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.68
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 2.86
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.03
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.55
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -673
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.28
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 12.75
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 60.11
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 60.06
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 60.44
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 6.28
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 51.71
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 11
'ae03de96-d48a-44ac-bf2a-3819ab00a7cb'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -634
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.45
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.52
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.37
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.98
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.34
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.61
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 3.57
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 5.77
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -26
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.45
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 5.52
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.37
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 1.98
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.34
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 1.61
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 3.57
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 5.77
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -138
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.45
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 5.52
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.37
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 1.98
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.34
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 1.61
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 3.57
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 5.77
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -138
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.66
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 5.73
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.35
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 13.27
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 4.68
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 688
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.66
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 5.73
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 2.35
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 13.27
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 4.68
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 576
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.66
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 5.73
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 2.35
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 13.27
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 4.68
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 576
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.04
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.71
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 3.8
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.38
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 6.31
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.02
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 7.56
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.05
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 262
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.04
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.72
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 3.82
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.72
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.83
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 6.53
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 5.51
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 5.85
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 374
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.93
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 3.22
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 2.97
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 2.71
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.55
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 5.88
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -494
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.93
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 3.22
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 2.97
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 2.71
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.55
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 5.88
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -607
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.93
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 3.22
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 2.97
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 2.71
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.55
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 5.88
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -607
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.35
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 22.88
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 129.21
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 132.47
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 126.45
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 8.5
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 118.97
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 18.45
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -353
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.35
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 22.88
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 129.21
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 132.47
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 126.45
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 8.5
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 118.97
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 18.45
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -466
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.35
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 22.88
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 129.21
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 132.47
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 126.45
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 8.5
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 118.97
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 18.45
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -466
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.69
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 6.35
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.42
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 3.79
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 5.69
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 7.04
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 42.67
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.28
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 5.61
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3511
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.69
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 6.35
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 2.42
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 3.79
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 5.69
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 7.04
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 42.67
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.28
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 5.61
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 3398
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.69
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 6.35
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 2.42
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 3.79
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 5.69
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 7.04
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 42.67
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.28
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 5.61
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 3398
'b0b476bd-feb3-4c80-84e2-e6d49f9bfe5b'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.71
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.57
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.73
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 5.33
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.55
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 4.6
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 5.31
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 9.72
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 121
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.74
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.29
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 9.94
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.75
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 10.42
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.38
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 13.91
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 5.08
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -36
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 15.71
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 9.45
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 10.7
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 45.89
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 28.04
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 67.82
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 11.17
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 9.13
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 5.42
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -603
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 13.02
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.34
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 4.7
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 6.83
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 3.3
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 8.85
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 67
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.74
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.36
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 10.08
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.36
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 4.79
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 11.12
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 9
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 12.67
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 311
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.55
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 10.76
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 9.05
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 7.34
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.9
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 10.18
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -573
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.63
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 35.88
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 203.77
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 206.85
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 201.69
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 15.9
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 186.43
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 31.05
'b6e14990-0ee8-4b67-9b67-74a4c5d232bc'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -356
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.54
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.41
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 2.06
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.24
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 3.29
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.06
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 3.98
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.1
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.12
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.2
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 2.62
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 14.24
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 6.28
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 15.78
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 3.96
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 2.7
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.95
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -466
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.23
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.11
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 0.96
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.11
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.04
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 2.83
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 96
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.54
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.42
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 2.07
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.42
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 0.98
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 3.41
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 2.87
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 3.11
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 358
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.48
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 1.58
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.47
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.35
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.81
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.05
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -493
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.22
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 12.57
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 66.92
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 68.46
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 65.61
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 4.71
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 60.72
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 9.76
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -305
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.51
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 3.48
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 1.4
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 2.17
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 3.25
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 3.9
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 22.15
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.16
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 2.98
'b9bbdb17-1add-4925-8f9d-ba1581555ac4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6133
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.89
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 6.69
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 2.75
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 2.5
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 5.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 85
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.89
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 6.69
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 2.75
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 2.5
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 5.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -29
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.89
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 6.69
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 2.75
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 2.5
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 5.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -29
'bc2b5772-8378-4dba-813d-239c0b403619'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.47
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 11.33
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 4.31
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 23.88
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 7.1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 447
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.47
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 11.33
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 4.31
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 23.88
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 7.1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 333
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.47
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 11.33
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 4.31
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 23.88
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 7.1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 333
'bc2b5772-8378-4dba-813d-239c0b403619'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.49
'bc2b5772-8378-4dba-813d-239c0b403619'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.06
'bc2b5772-8378-4dba-813d-239c0b403619'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 6.96
'bc2b5772-8378-4dba-813d-239c0b403619'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.59
'bc2b5772-8378-4dba-813d-239c0b403619'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 9.1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.91
'bc2b5772-8378-4dba-813d-239c0b403619'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 11.37
'bc2b5772-8378-4dba-813d-239c0b403619'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.64
'bc2b5772-8378-4dba-813d-239c0b403619'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 163
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 12.82
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 6.01
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 7.04
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 39.4
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 17.65
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 50.04
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 10.38
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 7.49
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 4.65
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -486
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 12.82
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 6.01
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 7.04
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 39.4
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 17.65
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 50.04
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 10.38
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 7.49
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 4.65
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -600
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 12.82
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 6.01
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 7.04
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 39.4
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 17.65
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 50.04
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 10.38
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 7.49
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 4.65
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -600
'bc2b5772-8378-4dba-813d-239c0b403619'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.9
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.27
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 3.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 5.88
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 2.85
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 7.68
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 25
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.9
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.27
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 3.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 5.88
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 2.85
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 7.68
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -89
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.9
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.27
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 3.26
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 5.88
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 2.85
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 7.68
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -89
'bc2b5772-8378-4dba-813d-239c0b403619'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'bc2b5772-8378-4dba-813d-239c0b403619'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.49
'bc2b5772-8378-4dba-813d-239c0b403619'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 7.04
'bc2b5772-8378-4dba-813d-239c0b403619'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 3.36
'bc2b5772-8378-4dba-813d-239c0b403619'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 9.55
'bc2b5772-8378-4dba-813d-239c0b403619'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 7.8
'bc2b5772-8378-4dba-813d-239c0b403619'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 9.63
'bc2b5772-8378-4dba-813d-239c0b403619'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 463
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.34
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 6.88
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 5.99
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 5.09
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.36
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 8.58
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -527
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.34
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 6.88
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 5.99
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 5.09
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 2.36
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 8.58
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -641
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.34
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 6.88
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 5.99
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 5.09
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 2.36
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 8.58
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -641
'bc2b5772-8378-4dba-813d-239c0b403619'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.51
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 31.45
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 182.81
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 186.64
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 179.74
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 12.75
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 169.06
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 26.39
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -297
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.51
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 31.45
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 182.81
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 186.64
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 179.74
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 12.75
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 169.06
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 26.39
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -411
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.51
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 31.45
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 182.81
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 186.64
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 179.74
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 12.75
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 169.06
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 26.39
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -411
'bc2b5772-8378-4dba-813d-239c0b403619'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.75
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.59
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.75
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 4.92
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.59
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 4.17
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 5.97
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 10.21
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1083
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.75
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 10.59
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.75
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 4.92
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.59
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 4.17
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 5.97
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 10.21
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 968
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.75
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 10.59
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.75
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 4.92
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.59
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 4.17
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 5.97
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 10.21
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 968
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 13.04
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.33
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.33
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 8.37
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 3.43
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 3.04
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 6.62
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 145
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 13.04
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.33
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.33
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 8.37
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 3.43
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 3.04
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 6.62
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 30
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 13.04
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.33
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.33
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 8.37
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 3.43
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 3.04
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 6.62
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 30
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.13
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 16.3
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 6
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 33.23
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 9.19
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 602
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.13
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 16.3
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 6
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 33.23
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 9.19
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 488
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.13
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 16.3
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 6
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 33.23
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 9.19
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 488
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.87
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.35
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 9.57
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.76
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 11.36
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.64
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 14.54
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 4.94
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -17
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 15.75
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 7.93
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 9.18
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 49.25
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 23.42
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 67.43
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 12.61
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 9.44
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 5.6
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1381
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 15.75
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 7.93
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 9.18
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 49.25
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 23.42
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 67.43
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 12.61
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 9.44
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 5.6
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1266
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 15.75
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 7.93
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 9.18
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 49.25
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 23.42
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 67.43
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 12.61
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 9.44
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 5.6
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1266
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 13.05
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.34
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 4.49
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 7.37
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 3.56
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 9.58
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 81
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 13.05
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.34
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 4.49
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 7.37
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 3.56
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 9.58
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -33
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 13.05
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.34
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 4.49
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 7.37
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 3.56
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 9.58
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -33
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.68
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 10.18
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 8.69
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 7.21
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 3.03
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 10.87
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -546
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.68
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 10.18
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 8.69
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 7.21
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 3.03
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 10.87
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -661
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.68
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 10.18
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 8.69
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 7.21
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 3.03
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 10.87
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -661
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.64
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 38.2
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 226.53
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 230.96
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 223.11
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 16.08
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 210
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 33.07
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2927
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.64
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 38.2
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 226.53
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 230.96
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 223.11
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 16.08
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 210
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 33.07
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2812
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.64
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 38.2
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 226.53
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 230.96
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 223.11
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 16.08
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 210
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 33.07
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2812
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.57
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 12.38
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 5.65
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 9.37
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 14.06
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 15.25
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 77.19
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.73
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 9.68
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6083
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.57
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 12.38
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 5.65
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 9.37
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 14.06
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 15.25
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 77.19
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.73
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 9.68
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5969
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.57
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 12.38
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 5.65
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 9.37
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 14.06
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 15.25
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 77.19
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.73
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 9.68
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5969
'c6e4b571-ccae-4a4c-95b5-e46bc87f6261'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'c7c48460-e817-4af5-ab28-be011d910cf5'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.35
'c7c48460-e817-4af5-ab28-be011d910cf5'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 0.84
'c7c48460-e817-4af5-ab28-be011d910cf5'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 0.72
'c7c48460-e817-4af5-ab28-be011d910cf5'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 0.83
'c7c48460-e817-4af5-ab28-be011d910cf5'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 0.62
'c7c48460-e817-4af5-ab28-be011d910cf5'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'sep' 0.01
'c7c48460-e817-4af5-ab28-be011d910cf5'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 579
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.97
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 6.51
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.47
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 11.42
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 2.91
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 272
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.53
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.47
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 3.61
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.3
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 2.89
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 0.99
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 4.45
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.8
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -267
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.84
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.82
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 5.27
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 13.59
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 14.12
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 24.25
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 2.84
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.01
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.97
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -1050
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.53
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.49
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 3.67
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.49
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.71
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 3.17
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 2.72
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 4.25
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 239
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.45
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 4.01
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.28
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 2.55
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.92
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.17
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -672
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.25
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 11.46
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 53.94
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 53.89
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 54.26
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 5.65
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 46.4
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 9.85
'd381795e-0b92-4b06-bbbe-fc1fd3d5dd79'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -634
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.58
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 9.28
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 3.63
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 21.88
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 7.44
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 689
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.58
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 9.28
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 3.63
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 21.88
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 7.44
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 577
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.58
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 9.28
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 3.63
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 21.88
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 7.44
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 577
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.63
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.07
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 5.74
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.55
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 9.95
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.15
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 11.77
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.13
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 268
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.63
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.11
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 5.79
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.11
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 2.79
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 10.27
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 8.67
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 8.95
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 381
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.47
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 5.46
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 4.98
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 4.51
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 2.44
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 9.32
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -495
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.47
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 5.46
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 4.98
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 4.51
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 2.44
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 9.32
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -607
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.47
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 5.46
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 4.98
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 4.51
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 2.44
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 9.32
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -607
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.51
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 33.92
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 205.82
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 211.5
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 200.92
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 12.44
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 192.72
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 28.65
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -320
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.51
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 33.92
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 205.82
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 211.5
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 200.92
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 12.44
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 192.72
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 28.65
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -431
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.51
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 33.92
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 205.82
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 211.5
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 200.92
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 12.44
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 192.72
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 28.65
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -431
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.95
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 9.46
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 3.37
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 5.22
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 7.83
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 10.21
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 67.68
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.39
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 8.65
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3531
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.95
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 9.46
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 3.37
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 5.22
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 7.83
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 10.21
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 67.68
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.39
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 8.65
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 3419
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.95
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 9.46
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 3.37
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 5.22
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 7.83
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 10.21
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 67.68
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.39
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 8.65
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 3419
'd613ceef-2722-49f1-8f00-d4ae843e64b9'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.98
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.24
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.96
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.73
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.8
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.76
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 9.15
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 12.96
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1134
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.98
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 10.24
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.96
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.73
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.8
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 1.76
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 9.15
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 12.96
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1024
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.98
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 10.24
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.96
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.73
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.8
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 1.76
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 9.15
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 12.96
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1024
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 13.17
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.46
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.46
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 11.58
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 4.66
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 4.59
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 9.48
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 112
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 13.17
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.46
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.46
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 11.58
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 4.66
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 4.59
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 9.48
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 3
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 13.17
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.46
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.46
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 11.58
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 4.66
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 4.59
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 9.48
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 3
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.26
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 14.25
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 5.32
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 36.02
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 12.12
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 501
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.26
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 14.25
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 5.32
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 36.02
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 12.12
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 391
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.26
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 14.25
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 5.32
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 36.02
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 12.12
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 391
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 2.63
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.85
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 7.7
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.99
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 16.1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 4.98
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 18.22
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 4.2
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 203
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 15.51
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' -0.02
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 1.25
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 66.76
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' -0.72
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 72.82
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 19.77
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 11.01
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 6.7
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -279
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 15.51
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' -0.02
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 1.25
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 66.76
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' -0.72
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 72.82
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 19.77
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 11.01
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 6.7
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -388
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 15.51
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' -0.02
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 1.25
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 66.76
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' -0.72
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 72.82
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 19.77
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 11.01
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 6.7
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -388
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 13.17
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.46
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 3.48
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 9.99
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 4.85
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 13.94
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 57
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 13.17
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.46
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 3.48
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 9.99
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 4.85
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 13.94
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -52
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 13.17
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.46
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 3.48
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 9.99
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 4.85
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 13.94
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -52
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 2.63
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.89
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 7.76
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.89
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 3.67
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 16.48
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 14.13
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 12.7
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 509
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 2.4
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 8.82
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 8.11
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 7.41
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 3.87
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 15.29
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -486
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 2.4
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 8.82
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 8.11
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 7.41
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 3.87
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 15.29
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -596
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 2.4
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 8.82
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 8.11
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 7.41
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 3.87
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 15.29
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -596
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.9
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 49.94
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 346.66
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 357.85
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 336.18
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 17.16
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 334.31
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 45.83
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -178
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.9
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 49.94
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 346.66
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 357.85
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 336.18
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 17.16
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 334.31
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 45.83
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -288
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.9
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 49.94
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 346.66
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 357.85
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 336.18
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 17.16
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 334.31
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 45.83
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -288
'd69b05cc-f224-4ae0-a051-89b1106fbc6a'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.06
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.83
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 0.33
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.05
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 0.46
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 0.78
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1071
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.06
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.83
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 0.33
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.05
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 0.46
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 0.78
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 957
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.06
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.83
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 0.33
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.05
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 0.46
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 0.78
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 957
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.84
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.03
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.03
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 0.6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 0.25
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 0.23
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 0.47
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 148
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.84
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.03
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.03
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 0.6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 0.25
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 0.23
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 0.47
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 34
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.84
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.03
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.03
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 0.6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 0.25
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 0.23
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 0.47
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 34
'd885d200-ee94-41b0-800c-558b7823aad4'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.24
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 0.77
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 0.34
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 1.66
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 0.6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 659
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.24
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 0.77
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 0.34
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 1.66
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 0.6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 544
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.24
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 0.77
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 0.34
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 1.66
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 0.6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 544
'd885d200-ee94-41b0-800c-558b7823aad4'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.13
'd885d200-ee94-41b0-800c-558b7823aad4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.11
'd885d200-ee94-41b0-800c-558b7823aad4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 0.56
'd885d200-ee94-41b0-800c-558b7823aad4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 0.81
'd885d200-ee94-41b0-800c-558b7823aad4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 0.99
'd885d200-ee94-41b0-800c-558b7823aad4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 0.29
'd885d200-ee94-41b0-800c-558b7823aad4'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.38
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 0.69
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 0.8
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 3.57
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 1.94
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 4.02
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 0.97
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 0.7
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 0.51
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1370
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.38
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 0.69
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 0.8
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 3.57
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 1.94
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 4.02
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 0.97
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 0.7
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 0.51
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1256
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.38
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 0.69
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 0.8
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 3.57
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 1.94
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 4.02
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 0.97
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 0.7
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 0.51
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1256
'd885d200-ee94-41b0-800c-558b7823aad4'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.84
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.03
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 0.52
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 0.69
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 89
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.84
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.03
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 0.52
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 0.69
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.84
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.03
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 0.52
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 0.26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 0.69
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -26
'd885d200-ee94-41b0-800c-558b7823aad4'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.12
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 0.4
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 0.37
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 0.34
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.2
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 0.75
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -498
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.12
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 0.4
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 0.37
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 0.34
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 0.2
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 0.75
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -613
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.12
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 0.4
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 0.37
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 0.34
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 0.2
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 0.75
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -613
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 3.22
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 16.35
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 16.66
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 16.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 1.23
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 14.64
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 2.43
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2892
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 3.22
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 16.35
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 16.66
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 16.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 1.23
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 14.64
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 2.43
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2778
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 3.22
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 16.35
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 16.66
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 16.07
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 1.23
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 14.64
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 2.43
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2778
'd885d200-ee94-41b0-800c-558b7823aad4'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.4
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 0.91
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 0.39
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 0.6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 0.91
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 1.04
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 5.43
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.04
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 0.74
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6108
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.4
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 0.91
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 0.39
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 0.6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 0.91
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 1.04
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 5.43
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.04
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 0.74
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5993
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.4
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 0.91
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 0.39
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 0.6
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 0.91
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 1.04
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 5.43
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.04
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 0.74
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5993
'd885d200-ee94-41b0-800c-558b7823aad4'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.36
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.37
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.55
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.27
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 2.19
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.64
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 4.76
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1059
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.36
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 5.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.37
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.55
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.27
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 2.19
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 2.64
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 4.76
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 943
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.36
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 5.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.37
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.55
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.27
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 2.19
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 2.64
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 4.76
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 943
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.16
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.16
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 3.71
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 1.54
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 1.35
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 2.9
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 134
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.16
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.16
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 3.71
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 1.54
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 1.35
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 2.9
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 18
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.16
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.16
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 3.71
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 1.54
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 1.35
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 2.9
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 18
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.42
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 7.1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.75
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 14.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 4.01
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 596
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.42
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 7.1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 2.75
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 14.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 4.01
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 479
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.42
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 7.1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 2.75
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 14.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 4.01
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 479
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.82
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.64
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 4.49
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.38
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 5
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.63
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 6.53
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.3
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -31
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 8.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 5.08
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 5.73
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 22.39
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 14.86
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 30.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 5.55
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 4.52
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.84
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1277
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 8.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 5.08
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 5.73
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 22.39
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 14.86
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 30.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 5.55
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 4.52
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 2.84
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1161
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 8.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 5.08
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 5.73
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 22.39
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 14.86
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 30.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 5.55
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 4.52
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 2.84
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1161
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.04
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.17
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 2.12
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 3.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.6
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 4.21
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 70
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.04
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.17
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 2.12
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 3.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 1.6
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 4.21
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -46
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.04
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.17
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 2.12
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 3.28
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 1.6
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 4.21
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -46
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.74
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 4.25
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.64
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 3.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.34
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 4.74
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -549
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.74
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 4.25
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 3.64
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 3.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.34
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 4.74
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -666
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.74
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 4.25
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 3.64
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 3.03
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.34
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 4.74
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -666
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.33
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 18.38
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 97.94
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 99.3
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 97
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 7.93
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 88.54
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 14.84
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2861
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.33
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 18.38
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 97.94
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 99.3
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 97
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 7.93
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 88.54
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 14.84
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2745
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.33
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 18.38
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 97.94
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 99.3
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 97
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 7.93
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 88.54
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 14.84
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2745
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.23
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 5.92
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.91
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 4.84
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 7.26
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 7.52
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 33.6
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.37
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 4.39
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6040
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.23
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 5.92
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 2.91
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 4.84
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 7.26
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 7.52
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 33.6
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.37
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 4.39
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5924
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.23
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 5.92
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 2.91
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 4.84
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 7.26
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 7.52
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 33.6
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.37
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 4.39
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5924
'd90523ef-3599-4b1f-901f-dc1b8e1f3923'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.24
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.7
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.27
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.93
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.18
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.66
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 1.65
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 3.18
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1018
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.24
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.7
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.27
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 1.93
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.18
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 1.66
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 1.65
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 3.18
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 900
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.24
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.7
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.27
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 1.93
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.18
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 1.66
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 1.65
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 3.18
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 900
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.96
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 5.26
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.03
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 9.91
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 2.7
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 576
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.96
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 5.26
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 2.03
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 9.91
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 2.7
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 458
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.96
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 5.26
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 2.03
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 9.91
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 2.7
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 458
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.54
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.44
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 3.27
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.28
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 3.22
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.06
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 4.39
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.65
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -58
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 5.82
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.08
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.53
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 14.76
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 11.92
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 21.19
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 3.46
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.09
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.93
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -788
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 5.82
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 4.08
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 4.53
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 14.76
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 11.92
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 21.19
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 3.46
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 3.09
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 1.93
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -906
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 5.82
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 4.08
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 4.53
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 14.76
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 11.92
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 21.19
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 3.46
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 3.09
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 1.93
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -906
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.54
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.46
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 3.31
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.46
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.56
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 3.45
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 2.77
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 4.1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 424
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.48
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 3.16
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 2.66
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 2.17
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.9
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.12
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -577
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.48
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 3.16
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 2.66
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 2.17
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 0.9
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 3.12
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -695
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.48
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 3.16
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 2.66
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 2.17
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 0.9
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 3.12
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -695
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.24
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 12.17
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 61.94
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 62.45
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 61.68
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 5.52
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 55.19
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 9.8
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -478
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.24
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 12.17
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 61.94
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 62.45
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 61.68
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 5.52
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 55.19
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 9.8
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -597
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.24
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 12.17
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 61.94
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 62.45
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 61.68
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 5.52
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 55.19
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 9.8
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -597
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.5
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 4.1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.16
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 3.64
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 5.45
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 5.4
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 21.61
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.28
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 2.87
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5605
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.5
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 4.1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 2.16
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 3.64
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 5.45
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 5.4
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 21.61
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.28
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 2.87
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5487
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.5
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 4.1
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 2.16
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 3.64
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 5.45
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 5.4
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 21.61
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.28
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 2.87
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5487
'd9502654-7f36-47d6-b11d-eb6439df5eac'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.03
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 11.64
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 4.36
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 22.39
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 5.99
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 583
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.03
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 11.64
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 4.36
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 22.39
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 5.99
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 466
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.03
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 11.64
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 4.36
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 22.39
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 5.99
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 466
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.19
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.89
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 6.96
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.52
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 7.1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.32
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 9.59
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.56
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 210
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.19
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.94
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 7.05
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.94
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 3.36
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 7.6
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 6.13
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 8.85
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 313
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.06
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 7.18
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 6.05
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 4.91
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.99
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 6.92
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -576
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.06
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 7.18
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 6.05
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 4.91
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.99
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 6.92
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -693
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.06
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 7.18
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 6.05
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 4.91
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.99
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 6.92
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -693
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.44
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 25.52
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 137.7
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 139.37
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 136.73
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 11.47
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 124.48
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 21.37
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -470
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.44
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 25.52
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 137.7
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 139.37
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 136.73
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 11.47
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 124.48
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 21.37
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -587
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.44
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 25.52
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 137.7
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 139.37
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 136.73
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 11.47
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 124.48
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 21.37
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -587
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.08
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 8.62
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 4.39
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 7.47
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 11.21
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 11.3
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 47.96
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.58
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 6.23
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3368
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.08
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 8.62
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 4.39
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 7.47
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 11.21
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 11.3
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 47.96
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.58
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 6.23
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 3251
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.08
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 8.62
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 4.39
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 7.47
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 11.21
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 11.3
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 47.96
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.58
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 6.23
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 3251
'd98ba772-2d1f-4742-a223-7edbc5858fd1'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 1.44
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 12.56
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 1.74
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.5
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 1.5
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 0.76
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 19.25
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 23.74
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1169
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 1.44
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 12.56
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 1.74
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.5
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 1.5
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 0.76
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 19.25
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 23.74
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1063
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 1.44
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 12.56
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 1.74
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.5
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 1.5
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 0.76
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 19.25
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 23.74
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1063
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 27.56
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.71
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.71
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 24.87
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 9.27
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 8.93
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 21.24
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 125
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 27.56
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.71
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.71
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 24.87
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 9.27
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 8.93
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 21.24
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 19
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 27.56
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.71
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.71
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 24.87
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 9.27
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 8.93
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 21.24
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 19
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 8.99
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 54.55
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 14.78
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 129.46
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 30.2
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 451
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 8.99
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 54.55
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 14.78
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 129.46
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 30.2
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 344
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 8.99
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 54.55
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 14.78
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 129.46
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 30.2
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 344
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 5.74
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.72
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 18.56
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 1.85
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 35.27
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 10.11
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 38.88
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 9.69
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 213
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 34.22
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 0.3
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.28
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 171.61
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 5.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 242.01
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 47.2
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 28.98
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 14.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -324
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 34.22
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 0.3
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 3.28
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 171.61
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 5.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 242.01
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 47.2
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 28.98
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 14.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -430
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 34.22
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 0.3
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 3.28
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 171.61
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 5.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 242.01
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 47.2
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 28.98
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 14.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -430
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 5.74
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.05
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 19.12
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 4.05
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 9.05
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 36.49
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 30.54
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 26.82
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 519
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 5.32
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 41.71
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 35.23
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 28.76
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 8.88
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 35.57
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -532
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 5.32
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 41.71
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 35.23
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 28.76
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 8.88
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 35.57
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -638
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 5.32
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 41.71
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 35.23
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 28.76
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 8.88
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 35.57
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -638
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.3
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 114.08
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 869.28
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 897.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 845.84
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 44.17
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 853.09
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 116.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -185
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.3
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 114.08
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 869.28
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 897.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 845.84
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 44.17
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 853.09
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 116.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -291
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.3
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 114.08
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 869.28
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 897.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 845.84
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 44.17
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 853.09
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 116.37
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -291
'e11041cd-76f7-4012-b2a3-16c2956e3d8d'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.4
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.19
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.43
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 3.25
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.3
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 2.83
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.78
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 5.39
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1022
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.4
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.19
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.43
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 3.25
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.3
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 2.83
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 2.78
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 5.39
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 903
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.4
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.19
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.43
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 3.25
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.3
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 2.83
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 2.78
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 5.39
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 903
'ea812f15-8776-4527-a89d-e06185876516'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.61
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 9.4
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 3.55
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 17.73
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 4.71
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 566
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.61
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 9.4
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 3.55
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 17.73
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 4.71
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 448
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.61
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 9.4
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 3.55
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 17.73
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 4.71
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 448
'ea812f15-8776-4527-a89d-e06185876516'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.92
'ea812f15-8776-4527-a89d-e06185876516'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.73
'ea812f15-8776-4527-a89d-e06185876516'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 5.65
'ea812f15-8776-4527-a89d-e06185876516'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.44
'ea812f15-8776-4527-a89d-e06185876516'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 5.49
'ea812f15-8776-4527-a89d-e06185876516'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.81
'ea812f15-8776-4527-a89d-e06185876516'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 7.55
'ea812f15-8776-4527-a89d-e06185876516'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.87
'ea812f15-8776-4527-a89d-e06185876516'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -59
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 9.54
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 6.63
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 7.38
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 24.97
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 19.51
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 37.17
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 5.83
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 5.2
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 3.19
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -776
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 9.54
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 6.63
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 7.38
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 24.97
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 19.51
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 37.17
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 5.83
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 5.2
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 3.19
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -895
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 9.54
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 6.63
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 7.38
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 24.97
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 19.51
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 37.17
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 5.83
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 5.2
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 3.19
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -895
'ea812f15-8776-4527-a89d-e06185876516'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.92
'ea812f15-8776-4527-a89d-e06185876516'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.76
'ea812f15-8776-4527-a89d-e06185876516'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 5.72
'ea812f15-8776-4527-a89d-e06185876516'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.76
'ea812f15-8776-4527-a89d-e06185876516'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 2.71
'ea812f15-8776-4527-a89d-e06185876516'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 5.9
'ea812f15-8776-4527-a89d-e06185876516'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 4.77
'ea812f15-8776-4527-a89d-e06185876516'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 7.06
'ea812f15-8776-4527-a89d-e06185876516'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 422
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.82
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 5.76
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 4.83
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 3.9
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.56
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 5.4
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -586
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.82
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 5.76
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 4.83
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 3.9
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.56
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 5.4
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -704
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.82
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 5.76
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 4.83
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 3.9
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.56
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 5.4
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -704
'ea812f15-8776-4527-a89d-e06185876516'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.37
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 20.23
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 105.69
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 106.66
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 105.21
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 9.26
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 94.66
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 16.76
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -469
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.37
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 20.23
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 105.69
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 106.66
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 105.21
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 9.26
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 94.66
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 16.76
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -587
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.37
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 20.23
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 105.69
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 106.66
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 105.21
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 9.26
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 94.66
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 16.76
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -587
'ea812f15-8776-4527-a89d-e06185876516'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.46
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 6.92
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 3.64
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 6.19
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 9.28
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 9.19
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 37.05
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.48
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 4.88
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5604
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.46
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 6.92
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 3.64
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 6.19
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 9.28
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 9.19
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 37.05
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.48
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 4.88
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5486
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.46
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 6.92
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 3.64
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 6.19
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 9.28
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 9.19
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 37.05
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.48
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 4.88
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5486
'ea812f15-8776-4527-a89d-e06185876516'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.31
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.93
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.28
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 1.48
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.23
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.2
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.39
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 3.96
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1086
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.31
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.93
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.28
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 1.48
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.23
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 1.2
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 2.39
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 3.96
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 973
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.31
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.93
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.28
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 1.48
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.23
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 1.2
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 2.39
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 3.96
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 973
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.17
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.13
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.13
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 3.1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 1.29
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 1.22
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 2.46
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 155
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.17
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.13
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.13
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 3.1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 1.29
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 1.22
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 2.46
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 41
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.17
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.13
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.13
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 3.1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 1.29
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 1.22
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 2.46
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 41
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.15
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 3.92
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 1.64
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 8.84
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 3.13
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 665
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.15
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 3.92
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 1.64
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 8.84
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 3.13
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 551
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.15
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 3.92
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 1.64
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 8.84
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 3.13
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 551
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.43
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 2.73
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 3.26
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 18.29
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 7.83
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 20.52
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 5.07
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.45
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.45
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1432
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.43
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 2.73
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 3.26
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 18.29
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 7.83
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 20.52
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 5.07
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 3.45
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 2.45
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 1319
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.43
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 2.73
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 3.26
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 18.29
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 7.83
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 20.52
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 5.07
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 3.45
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 2.45
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 1319
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.18
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.14
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 1.25
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.72
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.34
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 3.64
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 96
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.18
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.14
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 1.25
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 2.72
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 1.34
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 3.64
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -18
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.18
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.14
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 1.25
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 2.72
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 1.34
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 3.64
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -18
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.7
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.52
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 2.7
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.52
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.28
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 4.39
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 3.69
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 4.04
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -61
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.62
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 2.15
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.98
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.81
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.05
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.93
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -496
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.62
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 2.15
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 1.98
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 1.81
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.05
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 3.93
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -610
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.62
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 2.15
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 1.98
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 1.81
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.05
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 3.93
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -610
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.27
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 15.89
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 86.08
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 88.08
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 84.41
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 5.99
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 78.44
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 12.49
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2933
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.27
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 15.89
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 86.08
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 88.08
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 84.41
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 5.99
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 78.44
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 12.49
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2820
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.27
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 15.89
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 86.08
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 88.08
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 84.41
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 5.99
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 78.44
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 12.49
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2820
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.89
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 4.44
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 1.79
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 2.79
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 4.19
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 5.01
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 28.53
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.21
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 3.8
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 6134
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.89
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 4.44
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 1.79
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 2.79
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 4.19
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 5.01
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 28.53
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.21
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 3.8
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 6020
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.89
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 4.44
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 1.79
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 2.79
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 4.19
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 5.01
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 28.53
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.21
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 3.8
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 6020
'ee4d68eb-dadf-4bee-827f-b5b2714fcb86'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.75
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.6
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 4.5
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.37
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 4.49
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.48
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 6.1
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 2.28
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -49
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.88
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 5.41
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 6.02
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 20.45
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 15.83
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 29.49
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 4.83
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 4.25
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.63
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -703
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.75
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.63
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 4.56
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.63
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 2.15
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 4.81
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 3.87
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 5.67
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 296
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.67
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 4.45
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 3.75
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 3.04
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.26
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 4.36
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -576
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.31
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 16.71
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 86.7
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 87.52
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 86.25
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 7.56
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 77.63
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 13.62
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -418
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.04
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 5.63
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.94
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 4.96
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 7.43
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 7.41
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 30.23
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.38
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 3.98
'efe81bfe-50a9-4be9-aeaa-c510a5ae3b0f'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5990
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.28
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.23
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.3
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 2.08
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.21
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 1.77
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 2.05
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 3.75
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 110
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.28
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.23
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.3
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 2.08
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.21
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 1.77
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 2.05
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 3.75
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -7
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.28
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.23
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.3
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 2.08
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.21
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 1.77
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 2.05
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 3.75
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -7
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.78
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'apr' 0.14
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'mai' 0.14
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'jul' 2.89
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'aug' 1.2
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'sep' 1.05
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'okt' 2.26
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -157
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.78
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'apr' 0.14
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'mai' 0.14
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'jul' 2.89
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'aug' 1.2
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'sep' 1.05
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'okt' 2.26
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -274
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.78
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'apr' 0.14
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'mai' 0.14
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'jul' 2.89
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'aug' 1.2
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'sep' 1.05
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'okt' 2.26
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -274
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Erbsen zur Körnergewinnung'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.12
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 5.62
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 2.19
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 10.97
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 3.13
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 80
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.12
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 5.62
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 2.19
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 10.97
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 3.13
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -36
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.12
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 5.62
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 2.19
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 10.97
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 3.13
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -36
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.64
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.51
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 3.58
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.31
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 3.89
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 1.27
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 5.12
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 1.82
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -35
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.67
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 4.25
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 4.77
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 17.56
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 12.39
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 23.66
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 4.31
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 3.58
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 2.26
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -1343
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.67
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 4.25
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 4.77
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 17.56
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 12.39
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 23.66
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 4.31
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 3.58
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 2.26
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -1460
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.67
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 4.25
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 4.77
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 17.56
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 12.39
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 23.66
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 4.31
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 3.58
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 2.26
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -1460
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.78
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'apr' 0.14
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'mai' 1.69
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'aug' 2.56
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'sep' 1.25
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'okt' 3.27
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -216
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.78
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'apr' 0.14
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'mai' 1.69
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'aug' 2.56
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'sep' 1.25
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'okt' 3.27
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -332
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 2
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.78
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'apr' 0.14
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'mai' 1.69
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'aug' 2.56
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'sep' 1.25
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'okt' 3.27
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -332
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Acker-/Puff-/Pferdebohne'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 2
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.64
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.53
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 3.61
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.53
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 1.71
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 4.13
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 3.33
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 4.64
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 95
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.57
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 3.34
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 2.86
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 2.37
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.05
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 3.69
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -553
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.57
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 3.34
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 2.86
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 2.37
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.05
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 3.69
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -669
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.57
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 3.34
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 2.86
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 2.37
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.05
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 3.69
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -669
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.27
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 14.53
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 75.93
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 76.87
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 75.3
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 6.32
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 68.29
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 11.62
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -1583
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.27
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 14.53
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 75.93
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 76.87
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 75.3
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 6.32
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 68.29
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 11.62
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -1700
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.27
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 14.53
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 75.93
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 76.87
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 75.3
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 6.32
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 68.29
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 11.62
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -1700
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.77
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 4.71
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 2.35
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 3.91
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 5.87
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 6.01
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 26.11
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.3
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 3.43
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 2351
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.77
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 4.71
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 2.35
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 3.91
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 5.87
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 6.01
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 26.11
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.3
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 3.43
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2234
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.77
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 4.71
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 2.35
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 3.91
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 5.87
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 6.01
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 26.11
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.3
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 3.43
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2234
'f15af41e-28e7-4861-adb2-18b57b7ace66'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.77
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 11.32
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.74
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 5.67
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.6
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 4.93
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 5.81
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 10.56
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -50
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.77
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 11.32
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.74
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 5.67
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.6
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 4.93
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 5.81
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 10.56
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -166
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.77
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 11.32
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.74
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 5.67
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.6
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 4.93
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 5.81
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 10.56
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -166
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 3.16
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 18.79
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 6.81
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 36.87
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 9.67
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 576
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 3.16
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 18.79
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 6.81
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 36.87
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 9.67
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 460
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 3.16
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 18.79
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 6.81
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 36.87
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 9.67
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 460
'f17585a6-9211-4323-b828-caf379f04cf3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.9
'f17585a6-9211-4323-b828-caf379f04cf3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.35
'f17585a6-9211-4323-b828-caf379f04cf3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 10.76
'f17585a6-9211-4323-b828-caf379f04cf3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.75
'f17585a6-9211-4323-b828-caf379f04cf3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 11.4
'f17585a6-9211-4323-b828-caf379f04cf3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 3.69
'f17585a6-9211-4323-b828-caf379f04cf3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 15.19
'f17585a6-9211-4323-b828-caf379f04cf3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 5.53
'f17585a6-9211-4323-b828-caf379f04cf3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 194
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 16.61
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 9.67
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 11.01
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 50
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 29.23
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 74.32
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 12.23
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 9.88
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 5.82
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -948
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 16.61
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 9.67
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 11.01
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 50
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 29.23
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 74.32
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 12.23
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 9.88
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 5.82
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -1064
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 16.61
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 9.67
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 11.01
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 50
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 29.23
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 74.32
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 12.23
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 9.88
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 5.82
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -1064
'f17585a6-9211-4323-b828-caf379f04cf3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.9
'f17585a6-9211-4323-b828-caf379f04cf3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.42
'f17585a6-9211-4323-b828-caf379f04cf3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 10.9
'f17585a6-9211-4323-b828-caf379f04cf3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 1.42
'f17585a6-9211-4323-b828-caf379f04cf3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 5.22
'f17585a6-9211-4323-b828-caf379f04cf3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 12.17
'f17585a6-9211-4323-b828-caf379f04cf3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 9.86
'f17585a6-9211-4323-b828-caf379f04cf3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 13.79
'f17585a6-9211-4323-b828-caf379f04cf3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 301
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 1.7
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 11.9
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 10
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 8.1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 3.17
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 11.17
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -573
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 1.7
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 11.9
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 10
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 8.1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 3.17
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 11.17
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -689
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 1.7
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 11.9
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 10
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 8.1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 3.17
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 11.17
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -689
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.61
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 13.11
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 6.4
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 10.92
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 16.37
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 16.94
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 77.55
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.85
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 9.83
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3068
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.61
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 13.11
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 6.4
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 10.92
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 16.37
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 16.94
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 77.55
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.85
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 9.83
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2952
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.61
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 13.11
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 6.4
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 10.92
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 16.37
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 16.94
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 77.55
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.85
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 9.83
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2952
'f17585a6-9211-4323-b828-caf379f04cf3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.45
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.96
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.45
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 3.63
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.34
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 3.19
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 3.18
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 6.14
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -74
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.45
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.96
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.45
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 3.63
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.34
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 3.19
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 3.18
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 6.14
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -192
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.45
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.96
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.45
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 3.63
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.34
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 3.19
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 3.18
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 6.14
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -192
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.8
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 10.73
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 4.01
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 20.39
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 5.4
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 558
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.8
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 10.73
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 4.01
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 20.39
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 5.4
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 440
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.8
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 10.73
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 4.01
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 20.39
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 5.4
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 440
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 1.06
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.79
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 6.39
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.46
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 6.29
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 2.07
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 8.63
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 3.26
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 177
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 10.62
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 7.24
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 8.08
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 28.47
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 21.64
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 42.52
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 6.68
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 5.89
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 3.6
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -1061
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 10.62
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 7.24
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 8.08
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 28.47
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 21.64
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 42.52
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 6.68
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 5.89
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 3.6
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -1179
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 10.62
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 7.24
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 8.08
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 28.47
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 21.64
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 42.52
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 6.68
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 5.89
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 3.6
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -1179
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 1.06
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.83
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 6.47
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.83
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 3.09
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 6.75
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 5.46
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 8.05
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 282
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.94
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 6.63
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 5.56
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 4.48
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 1.79
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 6.19
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -586
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.94
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 6.63
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 5.56
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 4.48
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 1.79
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 6.19
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -704
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.94
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 6.63
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 5.56
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 4.48
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 1.79
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 6.19
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -704
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.75
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 7.82
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 4.07
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 6.98
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 10.47
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 10.41
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 42.48
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.54
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 5.57
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3016
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.75
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 7.82
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 4.07
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 6.98
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 10.47
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 10.41
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 42.48
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.54
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 5.57
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 2898
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.75
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 7.82
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 4.07
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 6.98
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 10.47
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 10.41
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 42.48
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.54
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 5.57
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 2898
'f29fa188-a4cc-4495-b488-a01c6a3749e3'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'f3cf2dc7-2538-4d7c-994b-192bd76718b9'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.49
'f3cf2dc7-2538-4d7c-994b-192bd76718b9'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'mai' 1.16
'f3cf2dc7-2538-4d7c-994b-192bd76718b9'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jun' 1
'f3cf2dc7-2538-4d7c-994b-192bd76718b9'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'jul' 1.15
'f3cf2dc7-2538-4d7c-994b-192bd76718b9'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'aug' 0.85
'f3cf2dc7-2538-4d7c-994b-192bd76718b9'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'sep' 0.01
'f3cf2dc7-2538-4d7c-994b-192bd76718b9'.'Grünland (Dauergrünland)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 579
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 1.22
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 15.73
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 1.57
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 6.71
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 1.04
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 5.14
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 11.52
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 17.59
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1101
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 1.22
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 15.73
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 1.57
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 6.71
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 1.04
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 5.14
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 11.52
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 17.59
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 990
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 1.22
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 15.73
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 1.57
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 6.71
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 1.04
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 5.14
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 11.52
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 17.59
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 990
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 6.14
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 32.72
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 11.1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 69.9
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 18.14
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 630
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 6.14
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 32.72
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 11.1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 69.9
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 18.14
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 519
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 6.14
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 32.72
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 11.1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 69.9
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 18.14
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 519
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 3.59
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.74
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 16.5
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 1.6
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 21.94
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 6.79
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 26.83
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 8.42
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 22.29
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 5.03
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 6.84
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 92.86
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 14.92
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 131.51
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 25.03
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 16.23
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 8.56
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -435
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 22.29
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 5.03
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 6.84
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 92.86
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 14.92
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 131.51
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 25.03
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 16.23
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 8.56
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -547
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 22.29
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 5.03
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 6.84
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 92.86
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 14.92
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 131.51
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 25.03
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 16.23
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 8.56
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -547
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 3.59
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.91
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 16.79
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 2.91
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 7.88
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 23.04
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 18.88
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 22.02
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 488
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 3.27
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 21.88
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 18.59
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 15.31
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 5.76
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 21.4
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -541
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 3.27
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 21.88
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 18.59
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 15.31
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 5.76
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 21.4
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -653
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 3.27
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 21.88
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 18.59
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 15.31
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 5.76
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 21.4
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -653
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.35
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 65.33
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 461.65
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 474.2
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 450.54
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 25.98
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 443.76
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 63.55
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -265
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.35
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 65.33
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 461.65
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 474.2
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 450.54
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 25.98
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 443.76
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 63.55
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -376
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.35
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 65.33
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 461.65
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 474.2
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 450.54
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 25.98
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 443.76
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 63.55
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -376
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 7.5
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 20.51
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 7.87
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 12.13
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 18.19
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 22.81
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 153.47
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.98
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 17.78
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5778
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 7.5
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 20.51
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 7.87
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 12.13
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 18.19
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 22.81
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 153.47
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.98
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 17.78
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5666
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 7.5
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 20.51
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 7.87
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 12.13
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 18.19
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 22.81
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 153.47
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.98
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 17.78
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5666
'fbb4eb59-5bee-491f-9a54-3368242d6975'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'feb' 0.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mrz' 2.55
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'apr' 0.19
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'mai' 0.97
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'jul' 0.15
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'aug' 0.77
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'sep' 1.51
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'okt' 2.52
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 475
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'feb' 0.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mrz' 2.55
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'apr' 0.19
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'mai' 0.97
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'jul' 0.15
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'aug' 0.77
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'sep' 1.51
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'okt' 2.52
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 362
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'feb' 0.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mrz' 2.55
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'apr' 0.19
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'mai' 0.97
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'jul' 0.15
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'aug' 0.77
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'sep' 1.51
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'okt' 2.52
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 362
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zuckerrüben'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.74
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'apr' 2.4
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'mai' 1.04
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'sep' 5.37
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'okt' 1.96
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 685
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.74
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'apr' 2.4
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'mai' 1.04
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'sep' 5.37
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'okt' 1.96
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 571
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.74
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'apr' 2.4
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'mai' 1.04
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'sep' 5.37
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'okt' 1.96
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 571
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Silomais (als Hauptfutter)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'feb' 0.44
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.34
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'apr' 1.69
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'mai' 0.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'jul' 2.66
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'aug' 0.86
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'sep' 3.22
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'okt' 0.89
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Wintergerste'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 255
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mrz' 4.23
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'apr' 1.88
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'mai' 2.23
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jun' 11.55
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'jul' 5.34
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'aug' 12.81
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'sep' 3.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'okt' 2.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'nov' 1.6
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -538
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mrz' 4.23
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'apr' 1.88
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'mai' 2.23
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jun' 11.55
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'jul' 5.34
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'aug' 12.81
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'sep' 3.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'okt' 2.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'nov' 1.6
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -652
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mrz' 4.23
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'apr' 1.88
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'mai' 2.23
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jun' 11.55
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'jul' 5.34
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'aug' 12.81
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'sep' 3.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'okt' 2.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'nov' 1.6
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -652
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Zwiebeln/Lauch'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'feb' 0.44
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.34
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'apr' 1.7
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'mai' 0.34
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'jun' 0.8
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'aug' 2.75
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'sep' 2.32
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'okt' 2.53
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Winterweichweizen'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 487
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'apr' 0.39
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jun' 1.27
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'jul' 1.18
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'aug' 1.09
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'sep' 0.65
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'okt' 2.46
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -494
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'apr' 0.39
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jun' 1.27
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'jul' 1.18
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'aug' 1.09
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'sep' 0.65
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'okt' 2.46
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -607
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'apr' 0.39
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jun' 1.27
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'jul' 1.18
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'aug' 1.09
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'sep' 0.65
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'okt' 2.46
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -607
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kleegras'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mrz' 0.19
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'apr' 10.27
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'mai' 54
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jun' 55.21
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'jul' 52.97
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'aug' 3.86
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'sep' 48.84
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'okt' 7.91
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' -358
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mrz' 0.19
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'apr' 10.27
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'mai' 54
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jun' 55.21
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'jul' 52.97
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'aug' 3.86
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'sep' 48.84
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'okt' 7.91
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' -472
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mrz' 0.19
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'apr' 10.27
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'mai' 54
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jun' 55.21
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'jul' 52.97
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'aug' 3.86
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'sep' 48.84
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'okt' 7.91
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' -472
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Möhre (auch Futtermöhre)'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.24
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'apr' 2.85
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'mai' 1.17
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jun' 1.79
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'jul' 2.69
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'aug' 3.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'sep' 17.88
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'okt' 0.13
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'nov' 2.41
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 5753
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mrz' 1.24
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'apr' 2.85
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'mai' 1.17
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jun' 1.79
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'jul' 2.69
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'aug' 3.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'sep' 17.88
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'okt' 0.13
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'nov' 2.41
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'grossMarginHa' 5640
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'false'.'efaFactor' 1
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mrz' 1.24
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'apr' 2.85
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'mai' 1.17
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jun' 1.79
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'jul' 2.69
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'aug' 3.2
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'sep' 17.88
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'okt' 0.13
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'nov' 2.41
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'grossMarginHa' 5640
'ff4e10c7-20ed-491e-9791-c25aad687cdd'.'Kartoffeln'.'0'.'0'.'0'.'true'.'true'.'efaFactor' 1

/;

set man_attr /
amount
n
p
k
minUsagePercent

/;

parameter p_manure(man_attr) /

/;

parameter p_solid(man_attr) /

/;

