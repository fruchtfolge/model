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
'Tonlehme (tl)'
/;

set plots /
 '142b282c-70f6-4a71-a0ef-b60f9017c166'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'
 '7e5757ff-0a1a-4299-993d-fab074ae7467'
 '45bb013d-222f-4738-9354-46e23fac6b0c'
 'b2de5686-b651-4035-b8f6-97ee80a0b110'
 'cade4554-92d8-495b-948d-1e59c080099d'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'
 '8808643e-5e7e-45f2-8a91-58c0754928c2'
 '26875e25-e974-4391-904d-47662820d2c6'
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'
 '32db3620-defe-43f6-841d-ebd29108219c'
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'
 'e664c050-f02f-4165-824a-faba7d2a5cc1'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'
 '80743e6f-5226-487d-a1a3-f240e99a1dba'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'
 'a05b8451-38f2-49c8-afe2-57dc321da584'
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'
 '0573e79b-7d00-49f0-9d85-7c528974e57d'
 '3ad46ade-90c4-45b5-a505-4048252dfc85'
 '8025333b-987e-43fb-af48-f8bfa17d9a92'
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'
 '3b0adc41-6120-4df5-a389-617de43c17f4'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'
 'a263e85f-e017-4456-b4da-261eb83c1cd7'
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'
 '9087c111-1c8e-4fab-a270-785555349b95'
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'
 '671ded41-9b32-457f-9186-11237522ca6c'
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'
 '4bd8d58c-2eac-454c-8725-41882dda1170'
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'
 '6129000d-e007-4959-bdad-5e3fae67e598'
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'
 'f1c1554f-819a-49c8-a35d-8449f5768667'
 'f0316474-6f27-4164-aad7-a11f322a5080'
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'
 '3985d59d-715e-4b5c-8e31-7979689469bd'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'
 '62fb5a21-939a-439d-8348-e134b70bff23'
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'
 'acb91b9a-1bb1-4604-be84-439a5116862e'
 '140984ad-78d2-4e64-986f-f6f7c128e71a'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'
 'f23d1831-1095-4926-96dd-07b6c21bd74a'
 '89b99db3-c177-4225-8f04-5899034fc6b1'
 '4e579f14-c47a-4738-8c90-8d0357a31c65'
 '0441de5f-309a-4e36-9faf-62e4a297da63'
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'
 'c974a15d-7964-47cc-8de8-9f21661a5c02'
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'
 'f71cd45c-f6f5-43bb-a253-48006a95a081'
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'
 'c88a9439-294f-425e-bb92-2e5113cb610f'
 'c0577fd9-927a-4f38-9638-ecf000ec4199'
 '37580f62-a22c-4385-9761-7c33923ce398'
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'
 '3c682187-2323-417f-a3ca-f70683e000ca'
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'
/;

set curPlots(plots) /
 '142b282c-70f6-4a71-a0ef-b60f9017c166'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'
 '7e5757ff-0a1a-4299-993d-fab074ae7467'
 '45bb013d-222f-4738-9354-46e23fac6b0c'
 'b2de5686-b651-4035-b8f6-97ee80a0b110'
 'cade4554-92d8-495b-948d-1e59c080099d'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'
 '8808643e-5e7e-45f2-8a91-58c0754928c2'
 '26875e25-e974-4391-904d-47662820d2c6'
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'
 '32db3620-defe-43f6-841d-ebd29108219c'
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'
 'e664c050-f02f-4165-824a-faba7d2a5cc1'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'
 '80743e6f-5226-487d-a1a3-f240e99a1dba'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'
 'a05b8451-38f2-49c8-afe2-57dc321da584'
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'
 '0573e79b-7d00-49f0-9d85-7c528974e57d'
 '3ad46ade-90c4-45b5-a505-4048252dfc85'
 '8025333b-987e-43fb-af48-f8bfa17d9a92'
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'
 '3b0adc41-6120-4df5-a389-617de43c17f4'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'
 'a263e85f-e017-4456-b4da-261eb83c1cd7'
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'
 '9087c111-1c8e-4fab-a270-785555349b95'
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'
 '671ded41-9b32-457f-9186-11237522ca6c'
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'
 '4bd8d58c-2eac-454c-8725-41882dda1170'
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'
 '6129000d-e007-4959-bdad-5e3fae67e598'
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'
 'f1c1554f-819a-49c8-a35d-8449f5768667'
 'f0316474-6f27-4164-aad7-a11f322a5080'
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'
 '3985d59d-715e-4b5c-8e31-7979689469bd'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'
 '62fb5a21-939a-439d-8348-e134b70bff23'
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'
 'acb91b9a-1bb1-4604-be84-439a5116862e'
 '140984ad-78d2-4e64-986f-f6f7c128e71a'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'
 'f23d1831-1095-4926-96dd-07b6c21bd74a'
 '89b99db3-c177-4225-8f04-5899034fc6b1'
 '4e579f14-c47a-4738-8c90-8d0357a31c65'
 '0441de5f-309a-4e36-9faf-62e4a297da63'
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'
 'c974a15d-7964-47cc-8de8-9f21661a5c02'
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'
 'f71cd45c-f6f5-43bb-a253-48006a95a081'
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'
 'c88a9439-294f-425e-bb92-2e5113cb610f'
 'c0577fd9-927a-4f38-9638-ecf000ec4199'
 '37580f62-a22c-4385-9761-7c33923ce398'
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'
 '3c682187-2323-417f-a3ca-f70683e000ca'
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'
/;

parameter p_plotData(curPlots,plotAttr) /
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.size 0.32
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.distance 0.25
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.quality 70.5
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.size 0.27
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.distance 0.27
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.quality 70.5
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.size 1.43
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.distance 16.51
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.quality 73.5
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.size 5.61
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.distance 15.86
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.quality 76.5
 '45bb013d-222f-4738-9354-46e23fac6b0c'.size 3.27
 '45bb013d-222f-4738-9354-46e23fac6b0c'.distance 14.75
 '45bb013d-222f-4738-9354-46e23fac6b0c'.quality 76.5
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.size 2.62
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.distance 0.28
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.quality 73.5
 'cade4554-92d8-495b-948d-1e59c080099d'.size 0.36
 'cade4554-92d8-495b-948d-1e59c080099d'.distance 0.14
 'cade4554-92d8-495b-948d-1e59c080099d'.quality 70.5
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.size 2.33
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.distance 10.25
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.quality 76.5
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.size 3.45
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.distance 15.77
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.quality 70.5
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.size 1.53
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.distance 15.77
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.quality 70.5
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.size 6.22
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.distance 14.5
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.quality 70.5
 '26875e25-e974-4391-904d-47662820d2c6'.size 2.8
 '26875e25-e974-4391-904d-47662820d2c6'.distance 0.75
 '26875e25-e974-4391-904d-47662820d2c6'.quality 64.5
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.size 3.72
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.distance 0.85
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.quality 67.5
 '32db3620-defe-43f6-841d-ebd29108219c'.size 1.26
 '32db3620-defe-43f6-841d-ebd29108219c'.distance 0.72
 '32db3620-defe-43f6-841d-ebd29108219c'.quality 67.5
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.size 1.33
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.distance 10.24
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.quality 0
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.size 5.71
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.distance 14.24
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.quality 73.5
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.size 0.57
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.distance 0.26
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.quality 70.5
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.size 9.81
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.distance 10.63
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.quality 70.5
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.size 3.13
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.distance 10.89
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.quality 70.5
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.size 6.08
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.distance 10.28
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.quality 70.5
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.size 1.15
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.distance 0.38
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.quality 67.5
 'a05b8451-38f2-49c8-afe2-57dc321da584'.size 3.13
 'a05b8451-38f2-49c8-afe2-57dc321da584'.distance 14.06
 'a05b8451-38f2-49c8-afe2-57dc321da584'.quality 73.5
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.size 7.66
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.distance 30.3
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.quality 76.5
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.size 2.78
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.distance 6.83
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.quality 70.5
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.size 5.99
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.distance 10.08
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.quality 70.5
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.size 3
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.distance 0.57
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.quality 73.5
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.size 3.42
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.distance 14.61
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.quality 76.5
 '3b0adc41-6120-4df5-a389-617de43c17f4'.size 2.84
 '3b0adc41-6120-4df5-a389-617de43c17f4'.distance 0.45
 '3b0adc41-6120-4df5-a389-617de43c17f4'.quality 70.5
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.size 4.25
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.distance 0.55
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.quality 70.5
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.size 2.49
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.distance 2.75
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.quality 70.5
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.size 2.92
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.distance 2.69
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.quality 70.5
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.size 0.88
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.distance 30.84
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.quality 69
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.size 2.33
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.distance 31.01
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.quality 69
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.size 0.79
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.distance 30.57
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.quality 66
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.size 3.69
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.distance 1.05
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.quality 70.5
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.size 1.98
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.distance 0.65
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.quality 67.5
 '9087c111-1c8e-4fab-a270-785555349b95'.size 7.5
 '9087c111-1c8e-4fab-a270-785555349b95'.distance 10.5
 '9087c111-1c8e-4fab-a270-785555349b95'.quality 70.5
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.size 0.84
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.distance 7.53
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.quality 0
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.size 1.59
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.distance 7.02
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.quality 70.5
 '671ded41-9b32-457f-9186-11237522ca6c'.size 0.93
 '671ded41-9b32-457f-9186-11237522ca6c'.distance 6.72
 '671ded41-9b32-457f-9186-11237522ca6c'.quality 73.5
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.size 3.2
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.distance 6.6
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.quality 70.5
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.size 8.41
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.distance 6.36
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.quality 67.5
 '4bd8d58c-2eac-454c-8725-41882dda1170'.size 1.03
 '4bd8d58c-2eac-454c-8725-41882dda1170'.distance 6.42
 '4bd8d58c-2eac-454c-8725-41882dda1170'.quality 64.5
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.size 10.29
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.distance 10
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.quality 70.5
 '6129000d-e007-4959-bdad-5e3fae67e598'.size 1.44
 '6129000d-e007-4959-bdad-5e3fae67e598'.distance 16.68
 '6129000d-e007-4959-bdad-5e3fae67e598'.quality 70.5
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.size 1.96
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.distance 10.01
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.quality 70.5
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.size 3.85
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.distance 10.05
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.quality 76.5
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.size 6.69
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.distance 0.23
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.quality 70.5
 'f1c1554f-819a-49c8-a35d-8449f5768667'.size 1.36
 'f1c1554f-819a-49c8-a35d-8449f5768667'.distance 10.69
 'f1c1554f-819a-49c8-a35d-8449f5768667'.quality 70.5
 'f0316474-6f27-4164-aad7-a11f322a5080'.size 1.74
 'f0316474-6f27-4164-aad7-a11f322a5080'.distance 10.67
 'f0316474-6f27-4164-aad7-a11f322a5080'.quality 70.5
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.size 0.2
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.distance 0.45
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.quality 70.5
 '3985d59d-715e-4b5c-8e31-7979689469bd'.size 2.55
 '3985d59d-715e-4b5c-8e31-7979689469bd'.distance 9.78
 '3985d59d-715e-4b5c-8e31-7979689469bd'.quality 73.5
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.size 2.8
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.distance 0.45
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.quality 70.5
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.size 1.26
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.distance 0.33
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.quality 70.5
 '62fb5a21-939a-439d-8348-e134b70bff23'.size 0.41
 '62fb5a21-939a-439d-8348-e134b70bff23'.distance 6.69
 '62fb5a21-939a-439d-8348-e134b70bff23'.quality 67.5
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.size 1.71
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.distance 16.42
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.quality 76.5
 'acb91b9a-1bb1-4604-be84-439a5116862e'.size 5.16
 'acb91b9a-1bb1-4604-be84-439a5116862e'.distance 0.92
 'acb91b9a-1bb1-4604-be84-439a5116862e'.quality 70.5
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.size 5.41
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.distance 5.05
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.quality 70.5
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.size 2.13
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.distance 2.75
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.quality 70.5
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.size 5.75
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.distance 17.17
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.quality 70.5
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.size 1.51
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.distance 0.81
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.quality 64.5
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.size 4
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.distance 17.06
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.quality 76.5
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.size 2.6
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.distance 17.02
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.quality 76.5
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.size 0.83
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.distance 17.05
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.quality 70.5
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.size 2.74
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.distance 17.05
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.quality 70.5
 '89b99db3-c177-4225-8f04-5899034fc6b1'.size 1.64
 '89b99db3-c177-4225-8f04-5899034fc6b1'.distance 10.14
 '89b99db3-c177-4225-8f04-5899034fc6b1'.quality 70.5
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.size 1.97
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.distance 16.4
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.quality 76.5
 '0441de5f-309a-4e36-9faf-62e4a297da63'.size 5.11
 '0441de5f-309a-4e36-9faf-62e4a297da63'.distance 0.83
 '0441de5f-309a-4e36-9faf-62e4a297da63'.quality 67.5
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.size 0.03
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.distance 6.65
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.quality 67.5
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.size 0.1
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.distance 7.47
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.quality 0
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.size 1.56
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.distance 6.42
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.quality 67.5
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.size 3.93
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.distance 10.15
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.quality 70.5
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.size 3.77
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.distance 14.71
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.quality 73.5
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.size 3.66
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.distance 0.99
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.quality 64.5
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.size 0.56
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.distance 1.23
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.quality 67.5
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.size 5.06
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.distance 0.8
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.quality 70.5
 'c88a9439-294f-425e-bb92-2e5113cb610f'.size 3.74
 'c88a9439-294f-425e-bb92-2e5113cb610f'.distance 1.11
 'c88a9439-294f-425e-bb92-2e5113cb610f'.quality 70.5
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.size 3.59
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.distance 0.66
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.quality 67.5
 '37580f62-a22c-4385-9761-7c33923ce398'.size 0.7
 '37580f62-a22c-4385-9761-7c33923ce398'.distance 17.01
 '37580f62-a22c-4385-9761-7c33923ce398'.quality 73.5
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.size 0.94
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.distance 0.25
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.quality 73.5
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.size 1.26
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.distance 10.6
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.quality 70.5
 '3c682187-2323-417f-a3ca-f70683e000ca'.size 3.15
 '3c682187-2323-417f-a3ca-f70683e000ca'.distance 10.79
 '3c682187-2323-417f-a3ca-f70683e000ca'.quality 70.5
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.size 1.41
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.distance 14.65
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.quality 70.5
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.size 1.71
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.distance 0.68
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.quality 70.5
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.size 0.59
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.distance 0.67
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.quality 70.5
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.size 0.26
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.distance 0.11
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.quality 70.5
/;

set plots_soilTypes(curPlots,soilTypes) /
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.'Tonschluffe (tu)'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.'Tonschluffe (tu)'
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.'Tonschluffe (tu)'
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.'Tonschluffe (tu)'
 '45bb013d-222f-4738-9354-46e23fac6b0c'.'Tonschluffe (tu)'
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.'Tonschluffe (tu)'
 'cade4554-92d8-495b-948d-1e59c080099d'.'Tonschluffe (tu)'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.'Tonschluffe (tu)'
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.'Tonschluffe (tu)'
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.'Tonschluffe (tu)'
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.'Tonschluffe (tu)'
 '26875e25-e974-4391-904d-47662820d2c6'.'Tonschluffe (tu)'
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.'Tonschluffe (tu)'
 '32db3620-defe-43f6-841d-ebd29108219c'.'Tonschluffe (tu)'
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.'Tonschluffe (tu)'
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.'Tonschluffe (tu)'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.'Tonschluffe (tu)'
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.'Tonschluffe (tu)'
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.'Tonschluffe (tu)'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.'Tonschluffe (tu)'
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.'Tonschluffe (tu)'
 'a05b8451-38f2-49c8-afe2-57dc321da584'.'Tonschluffe (tu)'
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.'Tonschluffe (tu)'
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.'Tonschluffe (tu)'
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.'Tonschluffe (tu)'
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.'Tonschluffe (tu)'
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.'Tonschluffe (tu)'
 '3b0adc41-6120-4df5-a389-617de43c17f4'.'Tonschluffe (tu)'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.'Tonschluffe (tu)'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.'Tonschluffe (tu)'
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.'Tonschluffe (tu)'
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.'Tonlehme (tl)'
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.'Tonlehme (tl)'
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.'Tonlehme (tl)'
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.'Tonschluffe (tu)'
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.'Tonschluffe (tu)'
 '9087c111-1c8e-4fab-a270-785555349b95'.'Tonschluffe (tu)'
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.'Tonschluffe (tu)'
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.'Tonschluffe (tu)'
 '671ded41-9b32-457f-9186-11237522ca6c'.'Tonschluffe (tu)'
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.'Tonschluffe (tu)'
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.'Tonschluffe (tu)'
 '4bd8d58c-2eac-454c-8725-41882dda1170'.'Tonschluffe (tu)'
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.'Tonschluffe (tu)'
 '6129000d-e007-4959-bdad-5e3fae67e598'.'Tonschluffe (tu)'
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.'Tonschluffe (tu)'
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.'Tonschluffe (tu)'
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.'Tonschluffe (tu)'
 'f1c1554f-819a-49c8-a35d-8449f5768667'.'Tonschluffe (tu)'
 'f0316474-6f27-4164-aad7-a11f322a5080'.'Tonschluffe (tu)'
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.'Tonschluffe (tu)'
 '3985d59d-715e-4b5c-8e31-7979689469bd'.'Tonschluffe (tu)'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.'Tonschluffe (tu)'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.'Tonschluffe (tu)'
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Tonschluffe (tu)'
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.'Tonschluffe (tu)'
 'acb91b9a-1bb1-4604-be84-439a5116862e'.'Tonschluffe (tu)'
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.'Tonschluffe (tu)'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.'Tonschluffe (tu)'
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.'Tonschluffe (tu)'
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.'Tonschluffe (tu)'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.'Tonschluffe (tu)'
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.'Tonschluffe (tu)'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.'Tonschluffe (tu)'
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.'Tonschluffe (tu)'
 '89b99db3-c177-4225-8f04-5899034fc6b1'.'Tonschluffe (tu)'
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.'Tonschluffe (tu)'
 '0441de5f-309a-4e36-9faf-62e4a297da63'.'Tonschluffe (tu)'
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Tonschluffe (tu)'
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Tonschluffe (tu)'
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Tonschluffe (tu)'
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.'Tonschluffe (tu)'
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.'Tonschluffe (tu)'
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Tonschluffe (tu)'
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Tonschluffe (tu)'
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.'Tonschluffe (tu)'
 'c88a9439-294f-425e-bb92-2e5113cb610f'.'Tonschluffe (tu)'
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.'Tonschluffe (tu)'
 '37580f62-a22c-4385-9761-7c33923ce398'.'Tonschluffe (tu)'
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.'Tonschluffe (tu)'
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Tonschluffe (tu)'
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Tonschluffe (tu)'
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.'Tonschluffe (tu)'
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.'Tonschluffe (tu)'
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.'Tonschluffe (tu)'
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Tonschluffe (tu)'
/;

set plots_rootCropCap(curPlots) /
 '142b282c-70f6-4a71-a0ef-b60f9017c166' 'YES'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0' 'YES'
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7' 'YES'
 '7e5757ff-0a1a-4299-993d-fab074ae7467' 'YES'
 '45bb013d-222f-4738-9354-46e23fac6b0c' 'YES'
 'b2de5686-b651-4035-b8f6-97ee80a0b110' 'YES'
 'cade4554-92d8-495b-948d-1e59c080099d' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12' 'YES'
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350' 'YES'
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd' 'YES'
 '8808643e-5e7e-45f2-8a91-58c0754928c2' 'YES'
 '26875e25-e974-4391-904d-47662820d2c6' 'YES'
 '2e60b308-c11d-45c5-ac52-9f0dd458653d' 'YES'
 '32db3620-defe-43f6-841d-ebd29108219c' 'YES'
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7' 'YES'
 'e664c050-f02f-4165-824a-faba7d2a5cc1' 'YES'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e' 'YES'
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac' 'YES'
 '80743e6f-5226-487d-a1a3-f240e99a1dba' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f' 'YES'
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92' 'YES'
 'a05b8451-38f2-49c8-afe2-57dc321da584' 'YES'
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7' 'YES'
 '0573e79b-7d00-49f0-9d85-7c528974e57d' 'YES'
 '3ad46ade-90c4-45b5-a505-4048252dfc85' 'YES'
 '8025333b-987e-43fb-af48-f8bfa17d9a92' 'YES'
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb' 'YES'
 '3b0adc41-6120-4df5-a389-617de43c17f4' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a' 'YES'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc' 'YES'
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb' 'YES'
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa' 'YES'
 'a263e85f-e017-4456-b4da-261eb83c1cd7' 'YES'
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d' 'YES'
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08' 'YES'
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95' 'YES'
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3' 'YES'
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7' 'YES'
 '671ded41-9b32-457f-9186-11237522ca6c' 'YES'
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0' 'YES'
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3' 'YES'
 '4bd8d58c-2eac-454c-8725-41882dda1170' 'YES'
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f' 'YES'
 '6129000d-e007-4959-bdad-5e3fae67e598' 'YES'
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac' 'YES'
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c' 'YES'
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4' 'YES'
 'f1c1554f-819a-49c8-a35d-8449f5768667' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080' 'YES'
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e' 'YES'
 '3985d59d-715e-4b5c-8e31-7979689469bd' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392' 'YES'
 '62fb5a21-939a-439d-8348-e134b70bff23' 'YES'
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b' 'YES'
 'acb91b9a-1bb1-4604-be84-439a5116862e' 'YES'
 '140984ad-78d2-4e64-986f-f6f7c128e71a' 'YES'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe' 'YES'
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef' 'YES'
 'c2d7ae07-2429-49d4-914a-7b52020c76d5' 'YES'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c' 'YES'
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6' 'YES'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a' 'YES'
 'f23d1831-1095-4926-96dd-07b6c21bd74a' 'YES'
 '89b99db3-c177-4225-8f04-5899034fc6b1' 'YES'
 '4e579f14-c47a-4738-8c90-8d0357a31c65' 'YES'
 '0441de5f-309a-4e36-9faf-62e4a297da63' 'YES'
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37' 'YES'
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0' 'YES'
 'c974a15d-7964-47cc-8de8-9f21661a5c02' 'YES'
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4' 'YES'
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58' 'YES'
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c' 'YES'
 'f71cd45c-f6f5-43bb-a253-48006a95a081' 'YES'
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46' 'YES'
 'c88a9439-294f-425e-bb92-2e5113cb610f' 'YES'
 'c0577fd9-927a-4f38-9638-ecf000ec4199' 'YES'
 '37580f62-a22c-4385-9761-7c33923ce398' 'YES'
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c' 'YES'
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6' 'YES'
 '3c682187-2323-417f-a3ca-f70683e000ca' 'YES'
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c' 'YES'
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd' 'YES'
 '77220ae0-a7cb-4884-80e8-952a5d7e4397' 'YES'
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271' 'YES'
/;

set plots_permPast(curPlots) /
 'cade4554-92d8-495b-948d-1e59c080099d' 'YES'
 '62fb5a21-939a-439d-8348-e134b70bff23' 'YES'
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37' 'YES'
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0' 'YES'
 'c974a15d-7964-47cc-8de8-9f21661a5c02' 'YES'
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c' 'YES'
 'f71cd45c-f6f5-43bb-a253-48006a95a081' 'YES'
 '37580f62-a22c-4385-9761-7c33923ce398' 'YES'
 '3c682187-2323-417f-a3ca-f70683e000ca' 'YES'
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271' 'YES'
/;

set crops /
 ''
 'Acker-/Puff-/Pferdebohne'
 'Ackergras - Anwelksilage'
 'Belana'
 'Erbsen zur Körnergewinnung'
 'Grünland (Dauergrünland)'
 'Kartoffeln'
 'Kleegras'
 'Mais (ohne Zucker-/Silomais)'
 'Möhre (auch Futtermöhre)'
 'Silomais (als Hauptfutter)'
 'Unbefestigte Mieten AL'
 'Wintergerste'
 'Winterweichweizen'
 'Zuckerrüben'
 'Zwiebeln/Lauch'
/;

set curCrops(crops) /
 ''
 'Acker-/Puff-/Pferdebohne'
 'Grünland (Dauergrünland)'
 'Kartoffeln'
 'Kleegras'
 'Möhre (auch Futtermöhre)'
 'Silomais (als Hauptfutter)'
 'Winterweichweizen'
 'Zuckerrüben'
 'Zwiebeln/Lauch'
/;

set permPastCrops(curCrops) /
 ''
 'Grünland (Dauergrünland)'
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
 'Wintergerste'
 'Gattung: Pisum (Erbse)'
/;

set crops_cropGroup(curCrops,cropGroup) /
 ''.''
 'Acker-/Puff-/Pferdebohne'.'Gattung: Vicia (Wicken)'
 'Grünland (Dauergrünland)'.'Dauergrünland'
 'Kartoffeln'.'Art: Solanum tuberosum (Kartoffel)'
 'Kleegras'.'Gras oder andere Grünfutterpflanzen'
 'Möhre (auch Futtermöhre)'.'Gattung: Daucus (Möhren)'
 'Silomais (als Hauptfutter)'.'Gattung: Zea (Mais)'
 'Winterweichweizen'.'Winterweizen'
 'Zuckerrüben'.'Gattung: Beta (Rüben)'
 'Zwiebeln/Lauch'.'Gattung: Allium (Lauch)'
/;

parameter p_cropData(curCrops,cropAttr) /
'Acker-/Puff-/Pferdebohne'.rotBreak 5
'Acker-/Puff-/Pferdebohne'.maxShare 16.67
'Acker-/Puff-/Pferdebohne'.minSoilQuality 20
'Acker-/Puff-/Pferdebohne'.efaFactor 1
'Grünland (Dauergrünland)'.rotBreak 0
'Grünland (Dauergrünland)'.maxShare 100
'Grünland (Dauergrünland)'.minSoilQuality 0
'Grünland (Dauergrünland)'.efaFactor 0
'Kartoffeln'.rotBreak 3
'Kartoffeln'.maxShare 25
'Kartoffeln'.minSoilQuality 20
'Kartoffeln'.efaFactor 0
'Kleegras'.rotBreak 0
'Kleegras'.maxShare 100
'Kleegras'.minSoilQuality 20
'Kleegras'.efaFactor 0
'Möhre (auch Futtermöhre)'.rotBreak 4
'Möhre (auch Futtermöhre)'.maxShare 20
'Möhre (auch Futtermöhre)'.minSoilQuality 20
'Möhre (auch Futtermöhre)'.efaFactor 0
'Silomais (als Hauptfutter)'.rotBreak 2
'Silomais (als Hauptfutter)'.maxShare 33.33
'Silomais (als Hauptfutter)'.minSoilQuality 20
'Silomais (als Hauptfutter)'.efaFactor 0
'Winterweichweizen'.rotBreak 2
'Winterweichweizen'.maxShare 33.33
'Winterweichweizen'.minSoilQuality 20
'Winterweichweizen'.efaFactor 0
'Zuckerrüben'.rotBreak 4
'Zuckerrüben'.maxShare 20
'Zuckerrüben'.minSoilQuality 20
'Zuckerrüben'.efaFactor 0
'Zwiebeln/Lauch'.rotBreak 3
'Zwiebeln/Lauch'.maxShare 25
'Zwiebeln/Lauch'.minSoilQuality 20
'Zwiebeln/Lauch'.efaFactor 0
/;

set crops_rootCrop(curCrops) /
 'Kartoffeln' YES
 'Zuckerrüben' YES
/;

set crops_catchCrop(curCrops) /
 'Acker-/Puff-/Pferdebohne' YES
 'Grünland (Dauergrünland)' YES
 'Kartoffeln' YES
 'Kleegras' YES
 'Möhre (auch Futtermöhre)' YES
 'Winterweichweizen' YES
 'Zwiebeln/Lauch' YES
/;

set crops_summer(curCrops) /
 'Acker-/Puff-/Pferdebohne' YES
 'Grünland (Dauergrünland)' YES
 'Kartoffeln' YES
 'Kleegras' YES
 'Möhre (auch Futtermöhre)' YES
 'Silomais (als Hauptfutter)' YES
 'Zuckerrüben' YES
 'Zwiebeln/Lauch' YES
/;

parameter p_croppingFactor(curCrops,curCrops) /
 'Acker-/Puff-/Pferdebohne'.'Acker-/Puff-/Pferdebohne' 2
 'Acker-/Puff-/Pferdebohne'.'Grünland (Dauergrünland)' 6
 'Acker-/Puff-/Pferdebohne'.'Kartoffeln' 10
 'Acker-/Puff-/Pferdebohne'.'Kleegras' 2
 'Acker-/Puff-/Pferdebohne'.'Möhre (auch Futtermöhre)' 4
 'Acker-/Puff-/Pferdebohne'.'Silomais (als Hauptfutter)' 10
 'Acker-/Puff-/Pferdebohne'.'Winterweichweizen' 10
 'Acker-/Puff-/Pferdebohne'.'Zuckerrüben' 10
 'Acker-/Puff-/Pferdebohne'.'Zwiebeln/Lauch' 4
 'Grünland (Dauergrünland)'.'Acker-/Puff-/Pferdebohne' 4
 'Grünland (Dauergrünland)'.'Grünland (Dauergrünland)' 10
 'Grünland (Dauergrünland)'.'Kartoffeln' 4
 'Grünland (Dauergrünland)'.'Kleegras' 4
 'Grünland (Dauergrünland)'.'Möhre (auch Futtermöhre)' 4
 'Grünland (Dauergrünland)'.'Silomais (als Hauptfutter)' 4
 'Grünland (Dauergrünland)'.'Winterweichweizen' 4
 'Grünland (Dauergrünland)'.'Zuckerrüben' 4
 'Grünland (Dauergrünland)'.'Zwiebeln/Lauch' 4
 'Kartoffeln'.'Acker-/Puff-/Pferdebohne' 8
 'Kartoffeln'.'Grünland (Dauergrünland)' 6
 'Kartoffeln'.'Kartoffeln' 2
 'Kartoffeln'.'Kleegras' 4
 'Kartoffeln'.'Möhre (auch Futtermöhre)' 4
 'Kartoffeln'.'Silomais (als Hauptfutter)' 8
 'Kartoffeln'.'Winterweichweizen' 10
 'Kartoffeln'.'Zuckerrüben' 10
 'Kartoffeln'.'Zwiebeln/Lauch' 4
 'Kleegras'.'Acker-/Puff-/Pferdebohne' 4
 'Kleegras'.'Grünland (Dauergrünland)' 4
 'Kleegras'.'Kartoffeln' 4
 'Kleegras'.'Kleegras' 10
 'Kleegras'.'Möhre (auch Futtermöhre)' 2
 'Kleegras'.'Silomais (als Hauptfutter)' 6
 'Kleegras'.'Winterweichweizen' 6
 'Kleegras'.'Zuckerrüben' 4
 'Kleegras'.'Zwiebeln/Lauch' 2
 'Möhre (auch Futtermöhre)'.'Acker-/Puff-/Pferdebohne' 4
 'Möhre (auch Futtermöhre)'.'Grünland (Dauergrünland)' 8
 'Möhre (auch Futtermöhre)'.'Kartoffeln' 6
 'Möhre (auch Futtermöhre)'.'Kleegras' 6
 'Möhre (auch Futtermöhre)'.'Möhre (auch Futtermöhre)' 4
 'Möhre (auch Futtermöhre)'.'Silomais (als Hauptfutter)' 10
 'Möhre (auch Futtermöhre)'.'Winterweichweizen' 8
 'Möhre (auch Futtermöhre)'.'Zuckerrüben' 3
 'Möhre (auch Futtermöhre)'.'Zwiebeln/Lauch' 4
 'Silomais (als Hauptfutter)'.'Acker-/Puff-/Pferdebohne' 10
 'Silomais (als Hauptfutter)'.'Grünland (Dauergrünland)' 10
 'Silomais (als Hauptfutter)'.'Kartoffeln' 10
 'Silomais (als Hauptfutter)'.'Kleegras' 8
 'Silomais (als Hauptfutter)'.'Möhre (auch Futtermöhre)' 4
 'Silomais (als Hauptfutter)'.'Silomais (als Hauptfutter)' 8
 'Silomais (als Hauptfutter)'.'Winterweichweizen' 8
 'Silomais (als Hauptfutter)'.'Zuckerrüben' 4
 'Silomais (als Hauptfutter)'.'Zwiebeln/Lauch' 4
 'Winterweichweizen'.'Acker-/Puff-/Pferdebohne' 10
 'Winterweichweizen'.'Grünland (Dauergrünland)' 8
 'Winterweichweizen'.'Kartoffeln' 10
 'Winterweichweizen'.'Kleegras' 6
 'Winterweichweizen'.'Möhre (auch Futtermöhre)' 10
 'Winterweichweizen'.'Silomais (als Hauptfutter)' 10
 'Winterweichweizen'.'Winterweichweizen' 4
 'Winterweichweizen'.'Zuckerrüben' 10
 'Winterweichweizen'.'Zwiebeln/Lauch' 10
 'Zuckerrüben'.'Acker-/Puff-/Pferdebohne' 6
 'Zuckerrüben'.'Grünland (Dauergrünland)' 8
 'Zuckerrüben'.'Kartoffeln' 8
 'Zuckerrüben'.'Kleegras' 2
 'Zuckerrüben'.'Möhre (auch Futtermöhre)' 4
 'Zuckerrüben'.'Silomais (als Hauptfutter)' 8
 'Zuckerrüben'.'Winterweichweizen' 8
 'Zuckerrüben'.'Zuckerrüben' 2
 'Zuckerrüben'.'Zwiebeln/Lauch' 4
 'Zwiebeln/Lauch'.'Acker-/Puff-/Pferdebohne' 4
 'Zwiebeln/Lauch'.'Grünland (Dauergrünland)' 8
 'Zwiebeln/Lauch'.'Kartoffeln' 6
 'Zwiebeln/Lauch'.'Kleegras' 6
 'Zwiebeln/Lauch'.'Möhre (auch Futtermöhre)' 4
 'Zwiebeln/Lauch'.'Silomais (als Hauptfutter)' 10
 'Zwiebeln/Lauch'.'Winterweichweizen' 8
 'Zwiebeln/Lauch'.'Zuckerrüben' 3
 'Zwiebeln/Lauch'.'Zwiebeln/Lauch' 4
/;

set plots_years_cropGroup(plots,years,cropGroup) /
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.2017.'Gattung: Beta (Rüben)' 'YES'
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.2019.'' 'YES'
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.2018.'Gattung: Zea (Mais)' 'YES'
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.2016.'Wintergerste' 'YES'
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.2018.'Gattung: Allium (Lauch)' 'YES'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.2017.'Gattung: Beta (Rüben)' 'YES'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.2019.'' 'YES'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.2018.'Gattung: Zea (Mais)' 'YES'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.2018.'Gattung: Vicia (Wicken)' 'YES'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.2016.'Wintergerste' 'YES'
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.2018.'Gattung: Allium (Lauch)' 'YES'
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.2019.'' 'YES'
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.2016.'Gattung: Zea (Mais)' 'YES'
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.2018.'Gattung: Zea (Mais)' 'YES'
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.2019.'' 'YES'
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.2018.'Winterweizen' 'YES'
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.2016.'Wintergerste' 'YES'
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '45bb013d-222f-4738-9354-46e23fac6b0c'.2019.'' 'YES'
 '45bb013d-222f-4738-9354-46e23fac6b0c'.2017.'Winterweizen' 'YES'
 '45bb013d-222f-4738-9354-46e23fac6b0c'.2018.'Gattung: Beta (Rüben)' 'YES'
 '45bb013d-222f-4738-9354-46e23fac6b0c'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.2018.'Gattung: Zea (Mais)' 'YES'
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.2019.'' 'YES'
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.2017.'Wintergerste' 'YES'
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'cade4554-92d8-495b-948d-1e59c080099d'.2016.'Dauergrünland' 'YES'
 'cade4554-92d8-495b-948d-1e59c080099d'.2017.'Dauergrünland' 'YES'
 'cade4554-92d8-495b-948d-1e59c080099d'.2019.'' 'YES'
 'cade4554-92d8-495b-948d-1e59c080099d'.2018.'Dauergrünland' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2019.'' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2017.'Winterweizen' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2018.'Gattung: Allium (Lauch)' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2018.'Winterweizen' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2016.'Wintergerste' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.2018.'Gattung: Zea (Mais)' 'YES'
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.2019.'' 'YES'
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.2018.'Winterweizen' 'YES'
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.2018.'Gattung: Zea (Mais)' 'YES'
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.2019.'' 'YES'
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.2018.'Winterweizen' 'YES'
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.2018.'Gattung: Zea (Mais)' 'YES'
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.2018.'Gattung: Beta (Rüben)' 'YES'
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.2019.'' 'YES'
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.2017.'Winterweizen' 'YES'
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '26875e25-e974-4391-904d-47662820d2c6'.2018.'Winterweizen' 'YES'
 '26875e25-e974-4391-904d-47662820d2c6'.2019.'' 'YES'
 '26875e25-e974-4391-904d-47662820d2c6'.2016.'Wintergerste' 'YES'
 '26875e25-e974-4391-904d-47662820d2c6'.2017.'Gras oder andere Grünfutterpflanzen' 'YES'
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.2019.'' 'YES'
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.2017.'Gras oder andere Grünfutterpflanzen' 'YES'
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.2018.'Winterweizen' 'YES'
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.2016.'' 'YES'
 '32db3620-defe-43f6-841d-ebd29108219c'.2018.'Gattung: Zea (Mais)' 'YES'
 '32db3620-defe-43f6-841d-ebd29108219c'.2019.'' 'YES'
 '32db3620-defe-43f6-841d-ebd29108219c'.2017.'Gattung: Zea (Mais)' 'YES'
 '32db3620-defe-43f6-841d-ebd29108219c'.2016.'Gattung: Zea (Mais)' 'YES'
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.2018.'Gattung: Zea (Mais)' 'YES'
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.2019.'' 'YES'
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.2017.'Winterweizen' 'YES'
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.2016.'Gattung: Beta (Rüben)' 'YES'
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.2018.'Winterweizen' 'YES'
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.2019.'' 'YES'
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.2017.'Gattung: Beta (Rüben)' 'YES'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.2019.'' 'YES'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.2018.'Gattung: Zea (Mais)' 'YES'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.2016.'Wintergerste' 'YES'
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.2018.'Gattung: Allium (Lauch)' 'YES'
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.2016.'Gattung: Zea (Mais)' 'YES'
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.2019.'' 'YES'
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.2016.'Gattung: Zea (Mais)' 'YES'
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.2019.'' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2019.'' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2017.'Winterweizen' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2018.'Gattung: Allium (Lauch)' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2018.'Winterweizen' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2016.'Wintergerste' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.2018.'Gattung: Zea (Mais)' 'YES'
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.2016.'Wintergerste' 'YES'
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.2017.'Gattung: Zea (Mais)' 'YES'
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.2019.'' 'YES'
 'a05b8451-38f2-49c8-afe2-57dc321da584'.2016.'Gattung: Zea (Mais)' 'YES'
 'a05b8451-38f2-49c8-afe2-57dc321da584'.2017.'Gattung: Allium (Lauch)' 'YES'
 'a05b8451-38f2-49c8-afe2-57dc321da584'.2019.'' 'YES'
 'a05b8451-38f2-49c8-afe2-57dc321da584'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.2017.'Winterweizen' 'YES'
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.2016.'Gattung: Pisum (Erbse)' 'YES'
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.2019.'' 'YES'
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.2019.'' 'YES'
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.2018.'Gattung: Allium (Lauch)' 'YES'
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.2018.'Gattung: Zea (Mais)' 'YES'
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.2016.'Winterweizen' 'YES'
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.2019.'' 'YES'
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.2018.'Gattung: Daucus (Möhren)' 'YES'
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.2017.'Gattung: Allium (Lauch)' 'YES'
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.2016.'Gattung: Zea (Mais)' 'YES'
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.2019.'' 'YES'
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.2019.'' 'YES'
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.2016.'Winterweizen' 'YES'
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.2017.'Wintergerste' 'YES'
 '3b0adc41-6120-4df5-a389-617de43c17f4'.2019.'' 'YES'
 '3b0adc41-6120-4df5-a389-617de43c17f4'.2018.'Gattung: Allium (Lauch)' 'YES'
 '3b0adc41-6120-4df5-a389-617de43c17f4'.2017.'Gattung: Beta (Rüben)' 'YES'
 '3b0adc41-6120-4df5-a389-617de43c17f4'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '3b0adc41-6120-4df5-a389-617de43c17f4'.2016.'Winterweizen' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2019.'' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2017.'Gattung: Allium (Lauch)' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2018.'Gattung: Zea (Mais)' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2017.'Gattung: Zea (Mais)' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2016.'Winterweizen' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2017.'Wintergerste' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2016.'Wintergerste' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2016.'Gattung: Zea (Mais)' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2016.'' 'YES'
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.2017.'' 'YES'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.2019.'' 'YES'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.2017.'Gattung: Beta (Rüben)' 'YES'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.2018.'Gattung: Zea (Mais)' 'YES'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.2017.'Gattung: Zea (Mais)' 'YES'
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.2016.'Winterweizen' 'YES'
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.2019.'' 'YES'
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.2017.'Gattung: Zea (Mais)' 'YES'
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.2016.'Winterweizen' 'YES'
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.2016.'Gattung: Pisum (Erbse)' 'YES'
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.2019.'' 'YES'
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.2017.'Winterweizen' 'YES'
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.2016.'Gattung: Pisum (Erbse)' 'YES'
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.2016.'Gattung: Allium (Lauch)' 'YES'
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.2019.'' 'YES'
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.2017.'Winterweizen' 'YES'
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.2016.'Gattung: Pisum (Erbse)' 'YES'
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.2019.'' 'YES'
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.2017.'Winterweizen' 'YES'
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.2019.'' 'YES'
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.2018.'Gattung: Daucus (Möhren)' 'YES'
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.2017.'Gattung: Zea (Mais)' 'YES'
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.2016.'Winterweizen' 'YES'
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.2018.'Gattung: Daucus (Möhren)' 'YES'
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.2019.'' 'YES'
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.2018.'Gattung: Vicia (Wicken)' 'YES'
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.2017.'Gattung: Zea (Mais)' 'YES'
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.2016.'Winterweizen' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2019.'' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2017.'Winterweizen' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2018.'Gattung: Allium (Lauch)' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2018.'Winterweizen' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2016.'Wintergerste' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '9087c111-1c8e-4fab-a270-785555349b95'.2018.'Gattung: Zea (Mais)' 'YES'
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.2019.'' 'YES'
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.2018.'Gattung: Zea (Mais)' 'YES'
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.2016.'Gattung: Zea (Mais)' 'YES'
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.2019.'' 'YES'
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.2018.'Gattung: Allium (Lauch)' 'YES'
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.2017.'Gattung: Vicia (Wicken)' 'YES'
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.2018.'Gattung: Zea (Mais)' 'YES'
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.2016.'Winterweizen' 'YES'
 '671ded41-9b32-457f-9186-11237522ca6c'.2019.'' 'YES'
 '671ded41-9b32-457f-9186-11237522ca6c'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '671ded41-9b32-457f-9186-11237522ca6c'.2018.'Gattung: Zea (Mais)' 'YES'
 '671ded41-9b32-457f-9186-11237522ca6c'.2016.'Winterweizen' 'YES'
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.2017.'Wintergerste' 'YES'
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.2018.'Gattung: Beta (Rüben)' 'YES'
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.2019.'' 'YES'
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.2016.'Gattung: Zea (Mais)' 'YES'
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.2016.'Winterweizen' 'YES'
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.2017.'Wintergerste' 'YES'
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.2019.'' 'YES'
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.2018.'Gattung: Zea (Mais)' 'YES'
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.2016.'Gattung: Zea (Mais)' 'YES'
 '4bd8d58c-2eac-454c-8725-41882dda1170'.2016.'Gattung: Zea (Mais)' 'YES'
 '4bd8d58c-2eac-454c-8725-41882dda1170'.2018.'Gattung: Zea (Mais)' 'YES'
 '4bd8d58c-2eac-454c-8725-41882dda1170'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '4bd8d58c-2eac-454c-8725-41882dda1170'.2019.'' 'YES'
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.2019.'' 'YES'
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.2018.'Gattung: Daucus (Möhren)' 'YES'
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.2017.'Gattung: Allium (Lauch)' 'YES'
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.2016.'Gattung: Zea (Mais)' 'YES'
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '6129000d-e007-4959-bdad-5e3fae67e598'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '6129000d-e007-4959-bdad-5e3fae67e598'.2019.'' 'YES'
 '6129000d-e007-4959-bdad-5e3fae67e598'.2018.'Winterweizen' 'YES'
 '6129000d-e007-4959-bdad-5e3fae67e598'.2016.'Gattung: Beta (Rüben)' 'YES'
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.2017.'Winterweizen' 'YES'
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.2019.'' 'YES'
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.2016.'Gattung: Zea (Mais)' 'YES'
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.2017.'Winterweizen' 'YES'
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.2019.'' 'YES'
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.2016.'Gattung: Zea (Mais)' 'YES'
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.2019.'' 'YES'
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.2017.'Wintergerste' 'YES'
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.2018.'Gattung: Zea (Mais)' 'YES'
 'f1c1554f-819a-49c8-a35d-8449f5768667'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'f1c1554f-819a-49c8-a35d-8449f5768667'.2017.'Winterweizen' 'YES'
 'f1c1554f-819a-49c8-a35d-8449f5768667'.2018.'Gattung: Zea (Mais)' 'YES'
 'f1c1554f-819a-49c8-a35d-8449f5768667'.2019.'' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2018.'Gattung: Vicia (Wicken)' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2019.'' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2017.'Winterweizen' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2018.'Gattung: Allium (Lauch)' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2018.'Winterweizen' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2016.'Wintergerste' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2017.'Gattung: Vicia (Wicken)' 'YES'
 'f0316474-6f27-4164-aad7-a11f322a5080'.2018.'Gattung: Zea (Mais)' 'YES'
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.2019.'' 'YES'
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.2018.'Gattung: Allium (Lauch)' 'YES'
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.2017.'Gattung: Beta (Rüben)' 'YES'
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.2016.'Winterweizen' 'YES'
 '3985d59d-715e-4b5c-8e31-7979689469bd'.2017.'Gattung: Allium (Lauch)' 'YES'
 '3985d59d-715e-4b5c-8e31-7979689469bd'.2016.'Gattung: Zea (Mais)' 'YES'
 '3985d59d-715e-4b5c-8e31-7979689469bd'.2019.'' 'YES'
 '3985d59d-715e-4b5c-8e31-7979689469bd'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2019.'' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2017.'Gattung: Allium (Lauch)' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2018.'Gattung: Zea (Mais)' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2017.'Gattung: Zea (Mais)' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2016.'Winterweizen' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2017.'Wintergerste' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2016.'Wintergerste' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2016.'Gattung: Zea (Mais)' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2016.'' 'YES'
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.2017.'' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2019.'' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2017.'Gattung: Allium (Lauch)' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2018.'Gattung: Zea (Mais)' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2017.'Gattung: Zea (Mais)' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2016.'Winterweizen' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2017.'Wintergerste' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2016.'Wintergerste' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2016.'Gattung: Zea (Mais)' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2016.'' 'YES'
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.2017.'' 'YES'
 '62fb5a21-939a-439d-8348-e134b70bff23'.2017.'Dauergrünland' 'YES'
 '62fb5a21-939a-439d-8348-e134b70bff23'.2016.'Dauergrünland' 'YES'
 '62fb5a21-939a-439d-8348-e134b70bff23'.2019.'' 'YES'
 '62fb5a21-939a-439d-8348-e134b70bff23'.2018.'Dauergrünland' 'YES'
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.2016.'Gattung: Beta (Rüben)' 'YES'
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.2018.'Gattung: Zea (Mais)' 'YES'
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.2019.'' 'YES'
 'acb91b9a-1bb1-4604-be84-439a5116862e'.2017.'Wintergerste' 'YES'
 'acb91b9a-1bb1-4604-be84-439a5116862e'.2019.'' 'YES'
 'acb91b9a-1bb1-4604-be84-439a5116862e'.2016.'Gattung: Zea (Mais)' 'YES'
 'acb91b9a-1bb1-4604-be84-439a5116862e'.2018.'Gattung: Zea (Mais)' 'YES'
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.2019.'' 'YES'
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.2018.'Winterweizen' 'YES'
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.2016.'Winterweizen' 'YES'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.2019.'' 'YES'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.2018.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.2017.'Gattung: Beta (Rüben)' 'YES'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.2018.'Gattung: Zea (Mais)' 'YES'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.2017.'Gattung: Zea (Mais)' 'YES'
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.2016.'Winterweizen' 'YES'
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.2019.'' 'YES'
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.2016.'Gattung: Beta (Rüben)' 'YES'
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.2018.'Gattung: Zea (Mais)' 'YES'
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.2017.'Gattung: Zea (Mais)' 'YES'
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.2016.'Wintergerste' 'YES'
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.2019.'' 'YES'
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.2018.'Winterweizen' 'YES'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.2018.'Winterweizen' 'YES'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.2019.'' 'YES'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.2016.'Gattung: Beta (Rüben)' 'YES'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.2017.'Gattung: Zea (Mais)' 'YES'
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.2018.'Gattung: Zea (Mais)' 'YES'
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.2016.'Gattung: Allium (Lauch)' 'YES'
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.2019.'' 'YES'
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.2018.'Gattung: Beta (Rüben)' 'YES'
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.2017.'Gattung: Zea (Mais)' 'YES'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.2018.'Winterweizen' 'YES'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.2019.'' 'YES'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.2016.'Gattung: Beta (Rüben)' 'YES'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.2017.'Gattung: Zea (Mais)' 'YES'
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.2018.'Gattung: Zea (Mais)' 'YES'
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.2016.'Gattung: Allium (Lauch)' 'YES'
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.2017.'Gattung: Zea (Mais)' 'YES'
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.2018.'Gattung: Beta (Rüben)' 'YES'
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.2019.'' 'YES'
 '89b99db3-c177-4225-8f04-5899034fc6b1'.2017.'Winterweizen' 'YES'
 '89b99db3-c177-4225-8f04-5899034fc6b1'.2019.'' 'YES'
 '89b99db3-c177-4225-8f04-5899034fc6b1'.2018.'Gattung: Zea (Mais)' 'YES'
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.2016.'Wintergerste' 'YES'
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.2019.'' 'YES'
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.2018.'Winterweizen' 'YES'
 '0441de5f-309a-4e36-9faf-62e4a297da63'.2019.'' 'YES'
 '0441de5f-309a-4e36-9faf-62e4a297da63'.2018.'Winterweizen' 'YES'
 '0441de5f-309a-4e36-9faf-62e4a297da63'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.2019.'' 'YES'
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.2016.'Dauergrünland' 'YES'
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.2018.'Dauergrünland' 'YES'
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.2017.'Dauergrünland' 'YES'
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.2018.'Dauergrünland' 'YES'
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.2016.'Dauergrünland' 'YES'
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.2019.'' 'YES'
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.2017.'Dauergrünland' 'YES'
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.2017.'Dauergrünland' 'YES'
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.2016.'Dauergrünland' 'YES'
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.2019.'' 'YES'
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.2018.'Dauergrünland' 'YES'
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.2019.'' 'YES'
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.2016.'Gattung: Beta (Rüben)' 'YES'
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.2018.'Gattung: Zea (Mais)' 'YES'
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.2018.'Gattung: Zea (Mais)' 'YES'
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.2019.'' 'YES'
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.2016.'Gattung: Beta (Rüben)' 'YES'
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.2019.'' 'YES'
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.2017.'Dauergrünland' 'YES'
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.2018.'Dauergrünland' 'YES'
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.2016.'Dauergrünland' 'YES'
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.2017.'Dauergrünland' 'YES'
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.2018.'Dauergrünland' 'YES'
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.2019.'' 'YES'
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.2017.'Gattung: Daucus (Möhren)' 'YES'
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.2019.'' 'YES'
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.2018.'Winterweizen' 'YES'
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.2017.'Gattung: Beta (Rüben)' 'YES'
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.2016.'Winterweizen' 'YES'
 'c88a9439-294f-425e-bb92-2e5113cb610f'.2017.'Gattung: Daucus (Möhren)' 'YES'
 'c88a9439-294f-425e-bb92-2e5113cb610f'.2019.'' 'YES'
 'c88a9439-294f-425e-bb92-2e5113cb610f'.2018.'Winterweizen' 'YES'
 'c88a9439-294f-425e-bb92-2e5113cb610f'.2017.'Gattung: Beta (Rüben)' 'YES'
 'c88a9439-294f-425e-bb92-2e5113cb610f'.2016.'Winterweizen' 'YES'
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.2018.'Gattung: Daucus (Möhren)' 'YES'
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.2019.'' 'YES'
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.2018.'Gattung: Vicia (Wicken)' 'YES'
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.2017.'Gattung: Zea (Mais)' 'YES'
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.2016.'Winterweizen' 'YES'
 '37580f62-a22c-4385-9761-7c33923ce398'.2018.'Dauergrünland' 'YES'
 '37580f62-a22c-4385-9761-7c33923ce398'.2019.'' 'YES'
 '37580f62-a22c-4385-9761-7c33923ce398'.2016.'Dauergrünland' 'YES'
 '37580f62-a22c-4385-9761-7c33923ce398'.2017.'Dauergrünland' 'YES'
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.2016.'Wintergerste' 'YES'
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.2019.'' 'YES'
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.2017.'Gattung: Zea (Mais)' 'YES'
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.2018.'Gattung: Zea (Mais)' 'YES'
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.2016.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.2017.'Gras oder andere Grünfutterpflanzen' 'YES'
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.2019.'' 'YES'
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.2018.'Gras oder andere Grünfutterpflanzen' 'YES'
 '3c682187-2323-417f-a3ca-f70683e000ca'.2017.'Dauergrünland' 'YES'
 '3c682187-2323-417f-a3ca-f70683e000ca'.2019.'' 'YES'
 '3c682187-2323-417f-a3ca-f70683e000ca'.2018.'Dauergrünland' 'YES'
 '3c682187-2323-417f-a3ca-f70683e000ca'.2016.'Dauergrünland' 'YES'
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.2019.'' 'YES'
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.2018.'Gattung: Beta (Rüben)' 'YES'
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.2017.'Gattung: Vicia (Wicken)' 'YES'
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.2016.'Gattung: Zea (Mais)' 'YES'
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.2019.'' 'YES'
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.2016.'Wintergerste' 'YES'
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.2018.'Winterweizen' 'YES'
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.2017.'Art: Solanum tuberosum (Kartoffel)' 'YES'
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.2018.'Gattung: Vicia (Wicken)' 'YES'
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.2019.'' 'YES'
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.2016.'Wintergerste' 'YES'
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.2018.'Winterweizen' 'YES'
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.2018.'Dauergrünland' 'YES'
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.2016.'Dauergrünland' 'YES'
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.2019.'' 'YES'
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.2017.'Dauergrünland' 'YES'
/;

parameter p_grossMarginData(curPlots,curCrops) /
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.'Acker-/Puff-/Pferdebohne' 48
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.'Grünland (Dauergrünland)' 242
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.'Kartoffeln' 2652
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.'Kleegras' 409
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.'Möhre (auch Futtermöhre)' -18
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.'Winterweichweizen' 150
 '142b282c-70f6-4a71-a0ef-b60f9017c166'.'Zwiebeln/Lauch' 33
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.'Grünland (Dauergrünland)' 88
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.'Kartoffeln' 2238
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.'Kleegras' 95
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.'Möhre (auch Futtermöhre)' -15
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.'Silomais (als Hauptfutter)' 230
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.'Winterweichweizen' 159
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.'Zuckerrüben' 347
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0'.'Zwiebeln/Lauch' 28
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.'Grünland (Dauergrünland)' 865
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.'Kartoffeln' 11941
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.'Kleegras' 1457
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.'Möhre (auch Futtermöhre)' -248
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.'Winterweichweizen' 649
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.'Zuckerrüben' 57
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7'.'Zwiebeln/Lauch' -26
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.'Acker-/Puff-/Pferdebohne' 999
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.'Grünland (Dauergrünland)' 3020
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.'Kleegras' 4512
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.'Möhre (auch Futtermöhre)' 19195
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.'Silomais (als Hauptfutter)' 3641
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.'Zuckerrüben' 5457
 '7e5757ff-0a1a-4299-993d-fab074ae7467'.'Zwiebeln/Lauch' 13070
 '45bb013d-222f-4738-9354-46e23fac6b0c'.'Acker-/Puff-/Pferdebohne' -27
 '45bb013d-222f-4738-9354-46e23fac6b0c'.'Grünland (Dauergrünland)' 1789
 '45bb013d-222f-4738-9354-46e23fac6b0c'.'Kartoffeln' 25628
 '45bb013d-222f-4738-9354-46e23fac6b0c'.'Kleegras' 888
 '45bb013d-222f-4738-9354-46e23fac6b0c'.'Möhre (auch Futtermöhre)' 238
 '45bb013d-222f-4738-9354-46e23fac6b0c'.'Silomais (als Hauptfutter)' 1615
 '45bb013d-222f-4738-9354-46e23fac6b0c'.'Winterweichweizen' 1686
 '45bb013d-222f-4738-9354-46e23fac6b0c'.'Zwiebeln/Lauch' 473
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.'Acker-/Puff-/Pferdebohne' 468
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.'Grünland (Dauergrünland)' 2154
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.'Kartoffeln' 22901
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.'Kleegras' 3539
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.'Möhre (auch Futtermöhre)' 354
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.'Winterweichweizen' 1355
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.'Zuckerrüben' 913
 'b2de5686-b651-4035-b8f6-97ee80a0b110'.'Zwiebeln/Lauch' 598
 'cade4554-92d8-495b-948d-1e59c080099d'.'Acker-/Puff-/Pferdebohne' -49
 'cade4554-92d8-495b-948d-1e59c080099d'.'Grünland (Dauergrünland)' 272
 'cade4554-92d8-495b-948d-1e59c080099d'.'Kartoffeln' 1319
 'cade4554-92d8-495b-948d-1e59c080099d'.'Kleegras' 234
 'cade4554-92d8-495b-948d-1e59c080099d'.'Möhre (auch Futtermöhre)' -19
 'cade4554-92d8-495b-948d-1e59c080099d'.'Silomais (als Hauptfutter)' 2
 'cade4554-92d8-495b-948d-1e59c080099d'.'Winterweichweizen' 17
 'cade4554-92d8-495b-948d-1e59c080099d'.'Zuckerrüben' 105
 'cade4554-92d8-495b-948d-1e59c080099d'.'Zwiebeln/Lauch' 37
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.'Grünland (Dauergrünland)' 717
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.'Kartoffeln' 20964
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.'Kleegras' 700
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.'Möhre (auch Futtermöhre)' 300
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.'Silomais (als Hauptfutter)' 1713
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.'Winterweichweizen' 1522
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.'Zuckerrüben' 2541
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12'.'Zwiebeln/Lauch' 441
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.'Acker-/Puff-/Pferdebohne' 406
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.'Grünland (Dauergrünland)' 1444
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.'Kartoffeln' 27333
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.'Kleegras' 2399
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.'Möhre (auch Futtermöhre)' 9463
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.'Silomais (als Hauptfutter)' 1709
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.'Zuckerrüben' 2757
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350'.'Zwiebeln/Lauch' 6510
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.'Acker-/Puff-/Pferdebohne' 180
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.'Grünland (Dauergrünland)' 845
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.'Kleegras' 1482
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.'Möhre (auch Futtermöhre)' -525
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.'Winterweichweizen' 627
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.'Zuckerrüben' 4
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd'.'Zwiebeln/Lauch' -196
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.'Acker-/Puff-/Pferdebohne' -323
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.'Grünland (Dauergrünland)' 2662
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.'Kartoffeln' 43181
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.'Kleegras' 1289
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.'Möhre (auch Futtermöhre)' -2045
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.'Silomais (als Hauptfutter)' 2209
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.'Winterweichweizen' 2567
 '8808643e-5e7e-45f2-8a91-58c0754928c2'.'Zwiebeln/Lauch' -726
 '26875e25-e974-4391-904d-47662820d2c6'.'Acker-/Puff-/Pferdebohne' 241
 '26875e25-e974-4391-904d-47662820d2c6'.'Grünland (Dauergrünland)' 1296
 '26875e25-e974-4391-904d-47662820d2c6'.'Kartoffeln' 20335
 '26875e25-e974-4391-904d-47662820d2c6'.'Kleegras' 2273
 '26875e25-e974-4391-904d-47662820d2c6'.'Möhre (auch Futtermöhre)' 6992
 '26875e25-e974-4391-904d-47662820d2c6'.'Silomais (als Hauptfutter)' 1845
 '26875e25-e974-4391-904d-47662820d2c6'.'Zuckerrüben' 2963
 '26875e25-e974-4391-904d-47662820d2c6'.'Zwiebeln/Lauch' 5013
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.'Acker-/Puff-/Pferdebohne' 450
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.'Grünland (Dauergrünland)' 2002
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.'Kartoffeln' 29114
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.'Kleegras' 3289
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.'Möhre (auch Futtermöhre)' 10777
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.'Silomais (als Hauptfutter)' 2832
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.'Zuckerrüben' 4381
 '2e60b308-c11d-45c5-ac52-9f0dd458653d'.'Zwiebeln/Lauch' 7645
 '32db3620-defe-43f6-841d-ebd29108219c'.'Acker-/Puff-/Pferdebohne' 152
 '32db3620-defe-43f6-841d-ebd29108219c'.'Grünland (Dauergrünland)' 863
 '32db3620-defe-43f6-841d-ebd29108219c'.'Kartoffeln' 9863
 '32db3620-defe-43f6-841d-ebd29108219c'.'Kleegras' 1514
 '32db3620-defe-43f6-841d-ebd29108219c'.'Möhre (auch Futtermöhre)' -315
 '32db3620-defe-43f6-841d-ebd29108219c'.'Winterweichweizen' 529
 '32db3620-defe-43f6-841d-ebd29108219c'.'Zuckerrüben' 288
 '32db3620-defe-43f6-841d-ebd29108219c'.'Zwiebeln/Lauch' -35
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.'Acker-/Puff-/Pferdebohne' 166
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.'Grünland (Dauergrünland)' 794
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.'Kartoffeln' 10643
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.'Kleegras' 1379
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.'Möhre (auch Futtermöhre)' -373
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.'Winterweichweizen' 562
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.'Zuckerrüben' 88
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7'.'Zwiebeln/Lauch' -104
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.'Acker-/Puff-/Pferdebohne' 839
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.'Grünland (Dauergrünland)' 2762
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.'Kleegras' 4342
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.'Möhre (auch Futtermöhre)' 17564
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.'Silomais (als Hauptfutter)' 3350
 'e664c050-f02f-4165-824a-faba7d2a5cc1'.'Zwiebeln/Lauch' 12041
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.'Acker-/Puff-/Pferdebohne' -77
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.'Grünland (Dauergrünland)' 344
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.'Kartoffeln' 3063
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.'Kleegras' 541
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.'Möhre (auch Futtermöhre)' -31
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.'Silomais (als Hauptfutter)' 486
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.'Winterweichweizen' 267
 '1f29fe76-2dbe-460a-a82a-b9111b33168e'.'Zuckerrüben' 61
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.'Grünland (Dauergrünland)' 2008
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.'Kleegras' 4793
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.'Möhre (auch Futtermöhre)' -2792
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.'Silomais (als Hauptfutter)' 3971
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.'Winterweichweizen' 5276
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.'Zuckerrüben' 8809
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac'.'Zwiebeln/Lauch' -799
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.'Grünland (Dauergrünland)' 636
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.'Kleegras' 1523
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.'Möhre (auch Futtermöhre)' -900
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.'Silomais (als Hauptfutter)' 1257
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.'Winterweichweizen' 1681
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.'Zuckerrüben' 2795
 '80743e6f-5226-487d-a1a3-f240e99a1dba'.'Zwiebeln/Lauch' -262
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.'Acker-/Puff-/Pferdebohne' -914
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.'Grünland (Dauergrünland)' 2789
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.'Kartoffeln' 31379
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.'Kleegras' 4562
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.'Möhre (auch Futtermöhre)' -1706
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.'Silomais (als Hauptfutter)' 3483
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.'Winterweichweizen' 2570
 '0d1434c8-bcb5-4043-8cb8-49576574a64f'.'Zuckerrüben' -546
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.'Acker-/Puff-/Pferdebohne' 70
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.'Grünland (Dauergrünland)' 315
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.'Kleegras' 692
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.'Möhre (auch Futtermöhre)' -283
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.'Silomais (als Hauptfutter)' 674
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.'Winterweichweizen' 617
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.'Zuckerrüben' 1364
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92'.'Zwiebeln/Lauch' -29
 'a05b8451-38f2-49c8-afe2-57dc321da584'.'Acker-/Puff-/Pferdebohne' 261
 'a05b8451-38f2-49c8-afe2-57dc321da584'.'Grünland (Dauergrünland)' 714
 'a05b8451-38f2-49c8-afe2-57dc321da584'.'Kleegras' 1568
 'a05b8451-38f2-49c8-afe2-57dc321da584'.'Möhre (auch Futtermöhre)' -451
 'a05b8451-38f2-49c8-afe2-57dc321da584'.'Silomais (als Hauptfutter)' 1328
 'a05b8451-38f2-49c8-afe2-57dc321da584'.'Winterweichweizen' 1813
 'a05b8451-38f2-49c8-afe2-57dc321da584'.'Zuckerrüben' 2853
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.'Acker-/Puff-/Pferdebohne' 713
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.'Grünland (Dauergrünland)' 1361
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.'Kleegras' 3132
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.'Möhre (auch Futtermöhre)' -921
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.'Silomais (als Hauptfutter)' 2118
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.'Winterweichweizen' 4576
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.'Zuckerrüben' 5132
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7'.'Zwiebeln/Lauch' -75
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.'Grünland (Dauergrünland)' 1345
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.'Kartoffeln' 14450
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.'Kleegras' 2182
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.'Möhre (auch Futtermöhre)' -671
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.'Silomais (als Hauptfutter)' 1728
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.'Winterweichweizen' 1197
 '0573e79b-7d00-49f0-9d85-7c528974e57d'.'Zuckerrüben' -154
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.'Acker-/Puff-/Pferdebohne' -899
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.'Grünland (Dauergrünland)' 2756
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.'Kartoffeln' 30927
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.'Kleegras' 4507
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.'Silomais (als Hauptfutter)' 3448
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.'Winterweichweizen' 2534
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.'Zuckerrüben' -526
 '3ad46ade-90c4-45b5-a505-4048252dfc85'.'Zwiebeln/Lauch' -458
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.'Acker-/Puff-/Pferdebohne' 335
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.'Grünland (Dauergrünland)' 1117
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.'Kleegras' 2082
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.'Möhre (auch Futtermöhre)' 395
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.'Silomais (als Hauptfutter)' 2205
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.'Winterweichweizen' 1925
 '8025333b-987e-43fb-af48-f8bfa17d9a92'.'Zwiebeln/Lauch' 676
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.'Acker-/Puff-/Pferdebohne' 387
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.'Grünland (Dauergrünland)' 956
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.'Kleegras' 1864
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.'Möhre (auch Futtermöhre)' 255
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.'Silomais (als Hauptfutter)' 1696
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.'Winterweichweizen' 2193
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.'Zuckerrüben' 3417
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb'.'Zwiebeln/Lauch' 499
 '3b0adc41-6120-4df5-a389-617de43c17f4'.'Acker-/Puff-/Pferdebohne' -385
 '3b0adc41-6120-4df5-a389-617de43c17f4'.'Grünland (Dauergrünland)' 1709
 '3b0adc41-6120-4df5-a389-617de43c17f4'.'Kartoffeln' 15255
 '3b0adc41-6120-4df5-a389-617de43c17f4'.'Kleegras' 2689
 '3b0adc41-6120-4df5-a389-617de43c17f4'.'Möhre (auch Futtermöhre)' -162
 '3b0adc41-6120-4df5-a389-617de43c17f4'.'Silomais (als Hauptfutter)' 2413
 '3b0adc41-6120-4df5-a389-617de43c17f4'.'Winterweichweizen' 1330
 '3b0adc41-6120-4df5-a389-617de43c17f4'.'Zuckerrüben' 299
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.'Acker-/Puff-/Pferdebohne' 367
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.'Grünland (Dauergrünland)' 1373
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.'Kleegras' 2750
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.'Möhre (auch Futtermöhre)' -248
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.'Silomais (als Hauptfutter)' 2804
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.'Winterweichweizen' 2502
 '0894094f-c35e-4463-a3c4-9e3553fee35a'.'Zuckerrüben' 5442
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.'Acker-/Puff-/Pferdebohne' 180
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.'Grünland (Dauergrünland)' 626
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.'Kleegras' 1373
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.'Möhre (auch Futtermöhre)' -485
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.'Silomais (als Hauptfutter)' 1260
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.'Winterweichweizen' 1389
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc'.'Zwiebeln/Lauch' -24
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.'Acker-/Puff-/Pferdebohne' 212
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.'Grünland (Dauergrünland)' 736
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.'Kleegras' 1611
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.'Möhre (auch Futtermöhre)' -567
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.'Silomais (als Hauptfutter)' 1479
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.'Winterweichweizen' 1630
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.'Zuckerrüben' 3068
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb'.'Zwiebeln/Lauch' -27
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.'Acker-/Puff-/Pferdebohne' 25
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.'Grünland (Dauergrünland)' 56
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.'Kleegras' 273
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.'Möhre (auch Futtermöhre)' -529
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.'Silomais (als Hauptfutter)' 104
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.'Winterweichweizen' 406
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.'Zuckerrüben' 419
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa'.'Zwiebeln/Lauch' -283
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.'Acker-/Puff-/Pferdebohne' 64
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.'Grünland (Dauergrünland)' 147
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.'Kleegras' 721
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.'Möhre (auch Futtermöhre)' -1404
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.'Silomais (als Hauptfutter)' 270
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.'Winterweichweizen' 1073
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.'Zuckerrüben' 1102
 'a263e85f-e017-4456-b4da-261eb83c1cd7'.'Zwiebeln/Lauch' -753
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.'Acker-/Puff-/Pferdebohne' 4
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.'Grünland (Dauergrünland)' 20
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.'Kleegras' 220
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.'Möhre (auch Futtermöhre)' -608
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.'Silomais (als Hauptfutter)' 53
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.'Winterweichweizen' 326
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.'Zuckerrüben' 327
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d'.'Zwiebeln/Lauch' -340
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.'Acker-/Puff-/Pferdebohne' -501
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.'Grünland (Dauergrünland)' 2204
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.'Kartoffeln' 19797
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.'Kleegras' 3471
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.'Silomais (als Hauptfutter)' 3104
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.'Winterweichweizen' 1723
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.'Zuckerrüben' 366
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08'.'Zwiebeln/Lauch' 351
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.'Acker-/Puff-/Pferdebohne' -300
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.'Grünland (Dauergrünland)' 1068
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.'Kartoffeln' 9961
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.'Kleegras' 1754
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.'Silomais (als Hauptfutter)' 1512
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.'Winterweichweizen' 831
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.'Zuckerrüben' 105
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d'.'Zwiebeln/Lauch' -54
 '9087c111-1c8e-4fab-a270-785555349b95'.'Acker-/Puff-/Pferdebohne' 933
 '9087c111-1c8e-4fab-a270-785555349b95'.'Grünland (Dauergrünland)' 3428
 '9087c111-1c8e-4fab-a270-785555349b95'.'Kleegras' 5611
 '9087c111-1c8e-4fab-a270-785555349b95'.'Möhre (auch Futtermöhre)' 21333
 '9087c111-1c8e-4fab-a270-785555349b95'.'Silomais (als Hauptfutter)' 4273
 '9087c111-1c8e-4fab-a270-785555349b95'.'Zuckerrüben' 6754
 '9087c111-1c8e-4fab-a270-785555349b95'.'Zwiebeln/Lauch' 14761
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.'Grünland (Dauergrünland)' 520
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.'Kartoffeln' 6755
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.'Kleegras' 899
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.'Möhre (auch Futtermöhre)' -209
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.'Winterweichweizen' 360
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.'Zuckerrüben' 81
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3'.'Zwiebeln/Lauch' -45
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.'Grünland (Dauergrünland)' 990
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.'Kartoffeln' 12798
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.'Kleegras' 1711
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.'Möhre (auch Futtermöhre)' -387
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.'Winterweichweizen' 684
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.'Zuckerrüben' 163
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7'.'Zwiebeln/Lauch' -77
 '671ded41-9b32-457f-9186-11237522ca6c'.'Grünland (Dauergrünland)' 639
 '671ded41-9b32-457f-9186-11237522ca6c'.'Kartoffeln' 7902
 '671ded41-9b32-457f-9186-11237522ca6c'.'Kleegras' 1064
 '671ded41-9b32-457f-9186-11237522ca6c'.'Möhre (auch Futtermöhre)' -53
 '671ded41-9b32-457f-9186-11237522ca6c'.'Winterweichweizen' 444
 '671ded41-9b32-457f-9186-11237522ca6c'.'Zuckerrüben' 145
 '671ded41-9b32-457f-9186-11237522ca6c'.'Zwiebeln/Lauch' 69
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.'Acker-/Puff-/Pferdebohne' -142
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.'Grünland (Dauergrünland)' 1554
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.'Kartoffeln' 22547
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.'Kleegras' 813
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.'Möhre (auch Futtermöhre)' -764
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.'Silomais (als Hauptfutter)' 1461
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.'Winterweichweizen' 1380
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0'.'Zwiebeln/Lauch' -143
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.'Acker-/Puff-/Pferdebohne' 858
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.'Grünland (Dauergrünland)' 4760
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.'Kartoffeln' 64036
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.'Kleegras' 8576
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.'Möhre (auch Futtermöhre)' -3524
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.'Winterweichweizen' 3238
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.'Zuckerrüben' 501
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3'.'Zwiebeln/Lauch' -1370
 '4bd8d58c-2eac-454c-8725-41882dda1170'.'Grünland (Dauergrünland)' 503
 '4bd8d58c-2eac-454c-8725-41882dda1170'.'Kartoffeln' 7271
 '4bd8d58c-2eac-454c-8725-41882dda1170'.'Kleegras' 967
 '4bd8d58c-2eac-454c-8725-41882dda1170'.'Möhre (auch Futtermöhre)' -669
 '4bd8d58c-2eac-454c-8725-41882dda1170'.'Winterweichweizen' 336
 '4bd8d58c-2eac-454c-8725-41882dda1170'.'Zuckerrüben' -4
 '4bd8d58c-2eac-454c-8725-41882dda1170'.'Zwiebeln/Lauch' -323
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.'Grünland (Dauergrünland)' 2145
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.'Kartoffeln' 82380
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.'Kleegras' 2408
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.'Möhre (auch Futtermöhre)' -2855
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.'Silomais (als Hauptfutter)' 5935
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.'Winterweichweizen' 5550
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f'.'Zuckerrüben' 9365
 '6129000d-e007-4959-bdad-5e3fae67e598'.'Acker-/Puff-/Pferdebohne' 168
 '6129000d-e007-4959-bdad-5e3fae67e598'.'Grünland (Dauergrünland)' 593
 '6129000d-e007-4959-bdad-5e3fae67e598'.'Kleegras' 988
 '6129000d-e007-4959-bdad-5e3fae67e598'.'Möhre (auch Futtermöhre)' 3925
 '6129000d-e007-4959-bdad-5e3fae67e598'.'Silomais (als Hauptfutter)' 695
 '6129000d-e007-4959-bdad-5e3fae67e598'.'Zwiebeln/Lauch' 2697
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.'Grünland (Dauergrünland)' 408
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.'Kartoffeln' 15691
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.'Kleegras' 459
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.'Möhre (auch Futtermöhre)' -544
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.'Silomais (als Hauptfutter)' 1130
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.'Winterweichweizen' 1057
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.'Zuckerrüben' 1783
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac'.'Zwiebeln/Lauch' -149
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.'Grünland (Dauergrünland)' 1190
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.'Kartoffeln' 34653
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.'Kleegras' 1162
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.'Möhre (auch Futtermöhre)' 505
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.'Silomais (als Hauptfutter)' 2843
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.'Winterweichweizen' 2518
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.'Zuckerrüben' 4214
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c'.'Zwiebeln/Lauch' 736
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.'Acker-/Puff-/Pferdebohne' 1005
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.'Grünland (Dauergrünland)' 5055
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.'Kartoffeln' 55448
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.'Kleegras' 8557
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.'Möhre (auch Futtermöhre)' -365
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.'Winterweichweizen' 3137
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.'Zuckerrüben' 1949
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4'.'Zwiebeln/Lauch' 686
 'f1c1554f-819a-49c8-a35d-8449f5768667'.'Acker-/Puff-/Pferdebohne' 169
 'f1c1554f-819a-49c8-a35d-8449f5768667'.'Grünland (Dauergrünland)' 807
 'f1c1554f-819a-49c8-a35d-8449f5768667'.'Kartoffeln' 10874
 'f1c1554f-819a-49c8-a35d-8449f5768667'.'Kleegras' 1402
 'f1c1554f-819a-49c8-a35d-8449f5768667'.'Möhre (auch Futtermöhre)' -388
 'f1c1554f-819a-49c8-a35d-8449f5768667'.'Winterweichweizen' 573
 'f1c1554f-819a-49c8-a35d-8449f5768667'.'Zuckerrüben' 83
 'f1c1554f-819a-49c8-a35d-8449f5768667'.'Zwiebeln/Lauch' -112
 'f0316474-6f27-4164-aad7-a11f322a5080'.'Grünland (Dauergrünland)' 1032
 'f0316474-6f27-4164-aad7-a11f322a5080'.'Kartoffeln' 13913
 'f0316474-6f27-4164-aad7-a11f322a5080'.'Kleegras' 1794
 'f0316474-6f27-4164-aad7-a11f322a5080'.'Möhre (auch Futtermöhre)' -496
 'f0316474-6f27-4164-aad7-a11f322a5080'.'Winterweichweizen' 734
 'f0316474-6f27-4164-aad7-a11f322a5080'.'Zuckerrüben' 106
 'f0316474-6f27-4164-aad7-a11f322a5080'.'Zwiebeln/Lauch' -142
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.'Grünland (Dauergrünland)' 65
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.'Kartoffeln' 1657
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.'Kleegras' 70
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.'Möhre (auch Futtermöhre)' -11
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.'Silomais (als Hauptfutter)' 170
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.'Winterweichweizen' 118
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e'.'Zwiebeln/Lauch' 20
 '3985d59d-715e-4b5c-8e31-7979689469bd'.'Grünland (Dauergrünland)' 649
 '3985d59d-715e-4b5c-8e31-7979689469bd'.'Kartoffeln' 21550
 '3985d59d-715e-4b5c-8e31-7979689469bd'.'Kleegras' 677
 '3985d59d-715e-4b5c-8e31-7979689469bd'.'Möhre (auch Futtermöhre)' -239
 '3985d59d-715e-4b5c-8e31-7979689469bd'.'Silomais (als Hauptfutter)' 1663
 '3985d59d-715e-4b5c-8e31-7979689469bd'.'Winterweichweizen' 1507
 '3985d59d-715e-4b5c-8e31-7979689469bd'.'Zuckerrüben' 2542
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.'Acker-/Puff-/Pferdebohne' 420
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.'Grünland (Dauergrünland)' 2111
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.'Kartoffeln' 23198
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.'Kleegras' 3574
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.'Möhre (auch Futtermöhre)' -160
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.'Winterweichweizen' 1312
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.'Zuckerrüben' 809
 '3f8dd658-f0fa-4e93-8736-8bef91660c63'.'Zwiebeln/Lauch' 282
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.'Acker-/Puff-/Pferdebohne' 189
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.'Grünland (Dauergrünland)' 951
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.'Kartoffeln' 10441
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.'Kleegras' 1610
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.'Möhre (auch Futtermöhre)' -70
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.'Winterweichweizen' 591
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.'Zuckerrüben' 366
 'ef27589d-0ca3-49dc-8023-fcbc0f170392'.'Zwiebeln/Lauch' 128
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Acker-/Puff-/Pferdebohne' -67
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Grünland (Dauergrünland)' 231
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Kartoffeln' 1337
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Kleegras' 196
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Möhre (auch Futtermöhre)' -173
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Silomais (als Hauptfutter)' -72
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Winterweichweizen' -3
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Zuckerrüben' 23
 '62fb5a21-939a-439d-8348-e134b70bff23'.'Zwiebeln/Lauch' -68
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.'Acker-/Puff-/Pferdebohne' 303
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.'Grünland (Dauergrünland)' 1162
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.'Kleegras' 1872
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.'Möhre (auch Futtermöhre)' 89
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.'Winterweichweizen' 875
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b'.'Zwiebeln/Lauch' 219
 'acb91b9a-1bb1-4604-be84-439a5116862e'.'Acker-/Puff-/Pferdebohne' 770
 'acb91b9a-1bb1-4604-be84-439a5116862e'.'Grünland (Dauergrünland)' 3871
 'acb91b9a-1bb1-4604-be84-439a5116862e'.'Kartoffeln' 42716
 'acb91b9a-1bb1-4604-be84-439a5116862e'.'Kleegras' 6557
 'acb91b9a-1bb1-4604-be84-439a5116862e'.'Möhre (auch Futtermöhre)' -322
 'acb91b9a-1bb1-4604-be84-439a5116862e'.'Winterweichweizen' 2411
 'acb91b9a-1bb1-4604-be84-439a5116862e'.'Zuckerrüben' 1463
 'acb91b9a-1bb1-4604-be84-439a5116862e'.'Zwiebeln/Lauch' 497
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.'Acker-/Puff-/Pferdebohne' 711
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.'Grünland (Dauergrünland)' 2688
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.'Kleegras' 4342
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.'Möhre (auch Futtermöhre)' 15955
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.'Silomais (als Hauptfutter)' 3498
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.'Zuckerrüben' 5439
 '140984ad-78d2-4e64-986f-f6f7c128e71a'.'Zwiebeln/Lauch' 11101
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.'Acker-/Puff-/Pferdebohne' 286
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.'Grünland (Dauergrünland)' 1399
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.'Kartoffeln' 17275
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.'Kleegras' 2403
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.'Möhre (auch Futtermöhre)' -415
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.'Winterweichweizen' 938
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.'Zuckerrüben' 322
 'c93a3043-0c9e-4f41-af55-84fd583a36fe'.'Zwiebeln/Lauch' -21
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.'Acker-/Puff-/Pferdebohne' 666
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.'Grünland (Dauergrünland)' 3112
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.'Kleegras' 5472
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.'Möhre (auch Futtermöhre)' -2065
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.'Winterweichweizen' 2338
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef'.'Zwiebeln/Lauch' -811
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.'Acker-/Puff-/Pferdebohne' 130
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.'Grünland (Dauergrünland)' 698
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.'Kartoffeln' 10965
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.'Kleegras' 1225
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.'Möhre (auch Futtermöhre)' 3769
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.'Silomais (als Hauptfutter)' 994
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.'Zuckerrüben' 1596
 'c2d7ae07-2429-49d4-914a-7b52020c76d5'.'Zwiebeln/Lauch' 2702
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.'Acker-/Puff-/Pferdebohne' 705
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.'Grünland (Dauergrünland)' 2115
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.'Kleegras' 3165
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.'Möhre (auch Futtermöhre)' 13586
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.'Silomais (als Hauptfutter)' 2522
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c'.'Zwiebeln/Lauch' 9238
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.'Acker-/Puff-/Pferdebohne' -28
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.'Grünland (Dauergrünland)' 1376
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.'Kartoffeln' 20293
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.'Kleegras' 668
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.'Möhre (auch Futtermöhre)' 116
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.'Silomais (als Hauptfutter)' 1202
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.'Winterweichweizen' 1326
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6'.'Zwiebeln/Lauch' 317
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.'Acker-/Puff-/Pferdebohne' 96
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.'Grünland (Dauergrünland)' 450
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.'Kartoffeln' 6560
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.'Kleegras' 791
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.'Möhre (auch Futtermöhre)' -297
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.'Winterweichweizen' 338
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a'.'Zwiebeln/Lauch' -116
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.'Acker-/Puff-/Pferdebohne' -149
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.'Grünland (Dauergrünland)' 1122
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.'Kartoffeln' 18930
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.'Kleegras' 527
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.'Möhre (auch Futtermöhre)' -980
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.'Silomais (als Hauptfutter)' 884
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.'Winterweichweizen' 1115
 'f23d1831-1095-4926-96dd-07b6c21bd74a'.'Zwiebeln/Lauch' -383
 '89b99db3-c177-4225-8f04-5899034fc6b1'.'Acker-/Puff-/Pferdebohne' 205
 '89b99db3-c177-4225-8f04-5899034fc6b1'.'Grünland (Dauergrünland)' 980
 '89b99db3-c177-4225-8f04-5899034fc6b1'.'Kartoffeln' 13126
 '89b99db3-c177-4225-8f04-5899034fc6b1'.'Kleegras' 1702
 '89b99db3-c177-4225-8f04-5899034fc6b1'.'Möhre (auch Futtermöhre)' -458
 '89b99db3-c177-4225-8f04-5899034fc6b1'.'Winterweichweizen' 694
 '89b99db3-c177-4225-8f04-5899034fc6b1'.'Zuckerrüben' 110
 '89b99db3-c177-4225-8f04-5899034fc6b1'.'Zwiebeln/Lauch' -126
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.'Acker-/Puff-/Pferdebohne' 349
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.'Grünland (Dauergrünland)' 1052
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.'Kleegras' 1573
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.'Möhre (auch Futtermöhre)' 6718
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.'Silomais (als Hauptfutter)' 1262
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.'Zuckerrüben' 1894
 '4e579f14-c47a-4738-8c90-8d0357a31c65'.'Zwiebeln/Lauch' 4572
 '0441de5f-309a-4e36-9faf-62e4a297da63'.'Acker-/Puff-/Pferdebohne' 618
 '0441de5f-309a-4e36-9faf-62e4a297da63'.'Grünland (Dauergrünland)' 2750
 '0441de5f-309a-4e36-9faf-62e4a297da63'.'Kleegras' 4519
 '0441de5f-309a-4e36-9faf-62e4a297da63'.'Möhre (auch Futtermöhre)' 14806
 '0441de5f-309a-4e36-9faf-62e4a297da63'.'Silomais (als Hauptfutter)' 3891
 '0441de5f-309a-4e36-9faf-62e4a297da63'.'Zuckerrüben' 6020
 '0441de5f-309a-4e36-9faf-62e4a297da63'.'Zwiebeln/Lauch' 10502
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Acker-/Puff-/Pferdebohne' -5
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Grünland (Dauergrünland)' 17
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Kartoffeln' 98
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Kleegras' 14
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Möhre (auch Futtermöhre)' -13
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Silomais (als Hauptfutter)' -5
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Winterweichweizen' 0
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Zuckerrüben' 2
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37'.'Zwiebeln/Lauch' -5
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Acker-/Puff-/Pferdebohne' -15
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Grünland (Dauergrünland)' 62
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Kartoffeln' 352
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Kleegras' 51
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Möhre (auch Futtermöhre)' -25
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Silomais (als Hauptfutter)' -14
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Winterweichweizen' 2
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Zuckerrüben' 10
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0'.'Zwiebeln/Lauch' -5
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Acker-/Puff-/Pferdebohne' -254
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Grünland (Dauergrünland)' 882
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Kartoffeln' 5089
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Kleegras' 749
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Möhre (auch Futtermöhre)' -655
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Silomais (als Hauptfutter)' -270
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Winterweichweizen' -11
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Zuckerrüben' 92
 'c974a15d-7964-47cc-8de8-9f21661a5c02'.'Zwiebeln/Lauch' -255
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.'Acker-/Puff-/Pferdebohne' 491
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.'Grünland (Dauergrünland)' 2348
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.'Kleegras' 4078
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.'Möhre (auch Futtermöhre)' -1097
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.'Winterweichweizen' 1662
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4'.'Zwiebeln/Lauch' -303
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.'Acker-/Puff-/Pferdebohne' 552
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.'Grünland (Dauergrünland)' 2338
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.'Kleegras' 3929
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.'Möhre (auch Futtermöhre)' -573
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.'Winterweichweizen' 1728
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58'.'Zwiebeln/Lauch' -5
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Acker-/Puff-/Pferdebohne' -630
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Grünland (Dauergrünland)' 2195
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Kartoffeln' 11175
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Kleegras' 1971
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Möhre (auch Futtermöhre)' -1800
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Silomais (als Hauptfutter)' -409
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Winterweichweizen' -88
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Zuckerrüben' 562
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c'.'Zwiebeln/Lauch' -685
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Acker-/Puff-/Pferdebohne' -85
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Grünland (Dauergrünland)' 381
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Kartoffeln' 1896
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Kleegras' 333
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Möhre (auch Futtermöhre)' -143
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Silomais (als Hauptfutter)' -30
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Winterweichweizen' 8
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Zuckerrüben' 125
 'f71cd45c-f6f5-43bb-a253-48006a95a081'.'Zwiebeln/Lauch' -18
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.'Acker-/Puff-/Pferdebohne' 756
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.'Grünland (Dauergrünland)' 3032
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.'Kartoffeln' 41897
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.'Kleegras' 4773
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.'Silomais (als Hauptfutter)' 4275
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.'Zuckerrüben' 6455
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46'.'Zwiebeln/Lauch' 11478
 'c88a9439-294f-425e-bb92-2e5113cb610f'.'Acker-/Puff-/Pferdebohne' 557
 'c88a9439-294f-425e-bb92-2e5113cb610f'.'Grünland (Dauergrünland)' 2233
 'c88a9439-294f-425e-bb92-2e5113cb610f'.'Kartoffeln' 30950
 'c88a9439-294f-425e-bb92-2e5113cb610f'.'Kleegras' 3516
 'c88a9439-294f-425e-bb92-2e5113cb610f'.'Möhre (auch Futtermöhre)' 12019
 'c88a9439-294f-425e-bb92-2e5113cb610f'.'Silomais (als Hauptfutter)' 3143
 'c88a9439-294f-425e-bb92-2e5113cb610f'.'Zwiebeln/Lauch' 8466
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.'Grünland (Dauergrünland)' 978
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.'Kartoffeln' 28106
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.'Kleegras' 1124
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.'Möhre (auch Futtermöhre)' -896
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.'Silomais (als Hauptfutter)' 2742
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.'Winterweichweizen' 1923
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.'Zuckerrüben' 4241
 'c0577fd9-927a-4f38-9638-ecf000ec4199'.'Zwiebeln/Lauch' -98
 '37580f62-a22c-4385-9761-7c33923ce398'.'Acker-/Puff-/Pferdebohne' -97
 '37580f62-a22c-4385-9761-7c33923ce398'.'Grünland (Dauergrünland)' 421
 '37580f62-a22c-4385-9761-7c33923ce398'.'Kartoffeln' 2587
 '37580f62-a22c-4385-9761-7c33923ce398'.'Kleegras' 334
 '37580f62-a22c-4385-9761-7c33923ce398'.'Möhre (auch Futtermöhre)' -125
 '37580f62-a22c-4385-9761-7c33923ce398'.'Silomais (als Hauptfutter)' -124
 '37580f62-a22c-4385-9761-7c33923ce398'.'Winterweichweizen' 26
 '37580f62-a22c-4385-9761-7c33923ce398'.'Zuckerrüben' 24
 '37580f62-a22c-4385-9761-7c33923ce398'.'Zwiebeln/Lauch' -16
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.'Acker-/Puff-/Pferdebohne' 168
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.'Grünland (Dauergrünland)' 773
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.'Kartoffeln' 8217
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.'Kleegras' 1270
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.'Möhre (auch Futtermöhre)' 127
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.'Winterweichweizen' 486
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.'Zuckerrüben' 328
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c'.'Zwiebeln/Lauch' 215
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Acker-/Puff-/Pferdebohne' -190
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Grünland (Dauergrünland)' -30
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Kartoffeln' 4399
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Kleegras' 1497
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Möhre (auch Futtermöhre)' -1815
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Silomais (als Hauptfutter)' 135
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Winterweichweizen' 265
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Zuckerrüben' 78
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6'.'Zwiebeln/Lauch' -1057
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Acker-/Puff-/Pferdebohne' -475
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Grünland (Dauergrünland)' 1866
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Kartoffeln' 10992
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Kleegras' 1535
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Möhre (auch Futtermöhre)' -902
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Silomais (als Hauptfutter)' -522
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Winterweichweizen' 54
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Zuckerrüben' 188
 '3c682187-2323-417f-a3ca-f70683e000ca'.'Zwiebeln/Lauch' -261
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.'Grünland (Dauergrünland)' 602
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.'Kartoffeln' 9786
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.'Kleegras' 291
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.'Möhre (auch Futtermöhre)' -466
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.'Silomais (als Hauptfutter)' 498
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.'Winterweichweizen' 582
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c'.'Zwiebeln/Lauch' -167
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.'Acker-/Puff-/Pferdebohne' 256
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.'Grünland (Dauergrünland)' 1026
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.'Kartoffeln' 14162
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.'Kleegras' 1615
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.'Möhre (auch Futtermöhre)' 5509
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.'Silomais (als Hauptfutter)' 1448
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.'Zuckerrüben' 2185
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd'.'Zwiebeln/Lauch' 3882
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.'Grünland (Dauergrünland)' 190
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.'Kleegras' 205
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.'Möhre (auch Futtermöhre)' -35
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.'Silomais (als Hauptfutter)' 500
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.'Winterweichweizen' 347
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.'Zuckerrüben' 754
 '77220ae0-a7cb-4884-80e8-952a5d7e4397'.'Zwiebeln/Lauch' 58
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Acker-/Puff-/Pferdebohne' -35
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Grünland (Dauergrünland)' 197
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Kartoffeln' 953
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Kleegras' 169
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Möhre (auch Futtermöhre)' -14
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Silomais (als Hauptfutter)' 1
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Winterweichweizen' 13
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Zuckerrüben' 76
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271'.'Zwiebeln/Lauch' 27
/;

parameter p_catchCropCosts(curPlots) /
 '142b282c-70f6-4a71-a0ef-b60f9017c166' 36.11
 'fe48ffe9-f5a8-4f53-8d65-f0cb4c3960d0' 30.48
 '5c3f9d3b-1419-48c0-bf0f-3edc7665e8a7' 166.96
 '7e5757ff-0a1a-4299-993d-fab074ae7467' 638.31
 '45bb013d-222f-4738-9354-46e23fac6b0c' 376.13
 'b2de5686-b651-4035-b8f6-97ee80a0b110' 291.69
 'cade4554-92d8-495b-948d-1e59c080099d' 40.61
 '549f1cc8-b312-4c7c-920f-3be6ebdb7e12' 266.48
 '29d9c2bd-dc3c-4a8f-a02c-e0a16a967350' 397.42
 '8898218e-6fd5-4efc-829e-6b08aafa9ccd' 178.21
 '8808643e-5e7e-45f2-8a91-58c0754928c2' 702.78
 '26875e25-e974-4391-904d-47662820d2c6' 311.77
 '2e60b308-c11d-45c5-ac52-9f0dd458653d' 412.04
 '32db3620-defe-43f6-841d-ebd29108219c' 141.58
 'fa4c5c8d-3182-4096-a5cc-2e3cedd861f7' 152.99
 'e664c050-f02f-4165-824a-faba7d2a5cc1' 646.67
 '1f29fe76-2dbe-460a-a82a-b9111b33168e' 64.24
 '742c1a11-8768-4a13-a4a5-7da9b15e8bac' 1074.1
 '80743e6f-5226-487d-a1a3-f240e99a1dba' 356.88
 '0d1434c8-bcb5-4043-8cb8-49576574a64f' 680.21
 '8e65ccdc-f07a-404a-abcf-6d0be1084c92' 129.19
 'a05b8451-38f2-49c8-afe2-57dc321da584' 359.7
 'b5e5b7db-449d-4704-95c8-60f6fd0b55b7' 892.62
 '0573e79b-7d00-49f0-9d85-7c528974e57d' 314.4
 '3ad46ade-90c4-45b5-a505-4048252dfc85' 670.16
 '8025333b-987e-43fb-af48-f8bfa17d9a92' 333.49
 'f2168c7e-bd98-44b1-a838-b1652dedbbdb' 392.91
 '3b0adc41-6120-4df5-a389-617de43c17f4' 315.91
 '0894094f-c35e-4463-a3c4-9e3553fee35a' 468.87
 '12be3c2d-d7c2-4c9a-8303-d7bf561796dc' 279.19
 '0ab5a6ce-84a5-4ee4-9ff8-5618653f17eb' 326.51
 '69e07c9a-1bc6-4c43-86f5-2446f464f0fa' 106.66
 'a263e85f-e017-4456-b4da-261eb83c1cd7' 280.27
 'ff7a74be-f6dc-4f9f-856f-b28a18aed71d' 95.74
 '3a2e9d8d-e3f0-4b2a-862b-e1a727aa2c08' 409
 'f9d5afb5-ceae-4e41-81ca-219f0dbf2f9d' 221.49
 '9087c111-1c8e-4fab-a270-785555349b95' 832.45
 '8554c0f0-6bb6-4e5e-972b-1032e3df9ca3' 96.25
 'c39bd0d4-7794-45e8-9f9e-d946b7c417e7' 181.17
 '671ded41-9b32-457f-9186-11237522ca6c' 106.29
 'b81612e9-e74f-4777-8c70-ca66cbd3f7d0' 360.79
 '8dd20b61-bc2c-4896-af04-017e5b1bd2e3' 918.42
 '4bd8d58c-2eac-454c-8725-41882dda1170' 117.57
 '8944d5c7-29cc-4899-854d-7bbb1a4ae60f' 1121.51
 '6129000d-e007-4959-bdad-5e3fae67e598' 168.18
 '9525a5c8-3015-447c-bf7d-83e36c0e24ac' 224.51
 '9625cb99-54e8-4f1f-a2cf-d8f592cb7f0c' 436.2
 '0766d157-5a8b-4982-a4ea-da621bd6f4f4' 726.57
 'f1c1554f-819a-49c8-a35d-8449f5768667' 156.59
 'f0316474-6f27-4164-aad7-a11f322a5080' 199.89
 '39d80f8d-bc3c-4aa6-b8c0-5f287edd306e' 22.6
 '3985d59d-715e-4b5c-8e31-7979689469bd' 290.92
 '3f8dd658-f0fa-4e93-8736-8bef91660c63' 311.53
 'ef27589d-0ca3-49dc-8023-fcbc0f170392' 141.44
 '62fb5a21-939a-439d-8348-e134b70bff23' 47
 'cd62f1c8-ce40-4d99-a514-b627027e1f2b' 199.28
 'acb91b9a-1bb1-4604-be84-439a5116862e' 566.68
 '140984ad-78d2-4e64-986f-f6f7c128e71a' 599.61
 'c93a3043-0c9e-4f41-af55-84fd583a36fe' 239.34
 '2fbda4ad-c56e-4ff3-991c-62ceda37f1ef' 655.85
 'c2d7ae07-2429-49d4-914a-7b52020c76d5' 169.46
 '405f71c3-6a46-4135-8a69-db6cd2d2d02c' 460.79
 '0f79adce-efaa-4b80-abff-dbc6f970b3c6' 301.91
 '84ba1cb7-3189-4936-bdb3-b3e0823ca95a' 97.36
 'f23d1831-1095-4926-96dd-07b6c21bd74a' 317.93
 '89b99db3-c177-4225-8f04-5899034fc6b1' 188.27
 '4e579f14-c47a-4738-8c90-8d0357a31c65' 229.23
 '0441de5f-309a-4e36-9faf-62e4a297da63' 561.23
 '51ceb7e2-ea96-4769-8ddc-47183f2b0d37' 3.45
 'bc0247b1-04b5-4790-9a76-b03f8829f6b0' 11.51
 'c974a15d-7964-47cc-8de8-9f21661a5c02' 177.51
 '049e51ae-432a-4bc7-b791-4f80ecd93bc4' 445.16
 '3f9a6ca1-7f0a-4efe-9278-21235b828b58' 432.34
 '05829485-bcbf-41d0-aa80-0b2fb5a3e56c' 405.68
 'f71cd45c-f6f5-43bb-a253-48006a95a081' 63.27
 '47f134ed-831f-4f2a-91fb-2fbe4853fc46' 555.86
 'c88a9439-294f-425e-bb92-2e5113cb610f' 414.48
 'c0577fd9-927a-4f38-9638-ecf000ec4199' 397.75
 '37580f62-a22c-4385-9761-7c33923ce398' 82.17
 '81ab646e-c98f-46e5-96bb-90b77e3d7b8c' 105.7
 '7c5d2d8c-746d-4f72-8b7f-3484008982a6' 145.13
 '3c682187-2323-417f-a3ca-f70683e000ca' 359.02
 '411e798b-79bb-4e3c-bb7e-e6f0e7c8327c' 163.89
 '744e84c2-2e6a-4b7a-a736-719511d9a5dd' 191.61
 '77220ae0-a7cb-4884-80e8-952a5d7e4397' 66.55
 'bb9fe2f0-d1fb-45e0-b256-f8458a702271' 29.34
/;

parameter p_laborReq(crops,halfMonths) /
 'Acker-/Puff-/Pferdebohne'.MRZ1 1.81
 'Acker-/Puff-/Pferdebohne'.MAI2 0.27
 'Acker-/Puff-/Pferdebohne'.AUG2 1.9
 'Acker-/Puff-/Pferdebohne'.SEP1 1
 'Acker-/Puff-/Pferdebohne'.SEP2 0.04
 'Acker-/Puff-/Pferdebohne'.OKT1 1.16
 'Acker-/Puff-/Pferdebohne'.OKT2 1.88
 'Grünland (Dauergrünland)'.MRZ1 2.15
 'Grünland (Dauergrünland)'.MRZ2 0.92
 'Grünland (Dauergrünland)'.MAI2 3.38
 'Grünland (Dauergrünland)'.JUN2 2.79
 'Grünland (Dauergrünland)'.JUL2 4.08
 'Grünland (Dauergrünland)'.AUG2 2.26
 'Grünland (Dauergrünland)'.SEP2 0.05
 'Kartoffeln'.MRZ1 1.07
 'Kartoffeln'.MRZ2 0.29
 'Kartoffeln'.APR1 1.42
 'Kartoffeln'.APR2 0.69
 'Kartoffeln'.MAI1 0.38
 'Kartoffeln'.JUN2 0.68
 'Kartoffeln'.JUL1 0.68
 'Kartoffeln'.JUL2 0.34
 'Kartoffeln'.AUG1 0.82
 'Kartoffeln'.AUG2 2.08
 'Kartoffeln'.SEP2 31.44
 'Kartoffeln'.OKT1 0.15
 'Kartoffeln'.NOV1 3.27
 'Kleegras'.APR1 0.8
 'Kleegras'.JUN1 3.44
 'Kleegras'.JUL2 2.95
 'Kleegras'.AUG2 2.47
 'Kleegras'.SEP1 1
 'Kleegras'.OKT1 0.04
 'Kleegras'.OKT2 3.67
 'Möhre (auch Futtermöhre)'.APR1 5.33
 'Möhre (auch Futtermöhre)'.APR2 4.82
 'Möhre (auch Futtermöhre)'.MAI1 1.83
 'Möhre (auch Futtermöhre)'.MAI2 52.04
 'Möhre (auch Futtermöhre)'.JUN1 53.65
 'Möhre (auch Futtermöhre)'.JUN2 2.12
 'Möhre (auch Futtermöhre)'.JUL1 52.62
 'Möhre (auch Futtermöhre)'.JUL2 1.07
 'Möhre (auch Futtermöhre)'.AUG1 2.24
 'Möhre (auch Futtermöhre)'.AUG2 1.44
 'Möhre (auch Futtermöhre)'.SEP1 51.95
 'Möhre (auch Futtermöhre)'.OKT1 12.73
 'Möhre (auch Futtermöhre)'.OKT2 1.08
 'Silomais (als Hauptfutter)'.MRZ2 1.24
 'Silomais (als Hauptfutter)'.APR1 3.07
 'Silomais (als Hauptfutter)'.APR2 1.07
 'Silomais (als Hauptfutter)'.MAI1 0.43
 'Silomais (als Hauptfutter)'.MAI2 0.37
 'Silomais (als Hauptfutter)'.SEP2 4.2
 'Silomais (als Hauptfutter)'.OKT1 1.27
 'Silomais (als Hauptfutter)'.OKT2 1.88
 'Winterweichweizen'.FEB1 0.5
 'Winterweichweizen'.FEB2 0.31
 'Winterweichweizen'.MRZ2 0.12
 'Winterweichweizen'.APR1 0.47
 'Winterweichweizen'.APR2 0.27
 'Winterweichweizen'.MAI1 0.12
 'Winterweichweizen'.JUN1 0.44
 'Winterweichweizen'.AUG1 2.4
 'Winterweichweizen'.AUG2 1
 'Winterweichweizen'.SEP1 0.29
 'Winterweichweizen'.SEP2 2.8
 'Winterweichweizen'.OKT1 0.57
 'Winterweichweizen'.OKT2 1.24
 'Zuckerrüben'.FEB2 0.5
 'Zuckerrüben'.MRZ1 0.82
 'Zuckerrüben'.MRZ2 1.41
 'Zuckerrüben'.MAI2 0.27
 'Zuckerrüben'.JUL2 0.12
 'Zuckerrüben'.AUG1 0.27
 'Zuckerrüben'.SEP2 4.45
 'Zuckerrüben'.OKT1 1.31
 'Zuckerrüben'.OKT2 1.88
 'Zwiebeln/Lauch'.MRZ1 2.86
 'Zwiebeln/Lauch'.MRZ2 0.3
 'Zwiebeln/Lauch'.APR1 0.6
 'Zwiebeln/Lauch'.MAI1 0.3
 'Zwiebeln/Lauch'.MAI2 1.02
 'Zwiebeln/Lauch'.JUN1 10.64
 'Zwiebeln/Lauch'.JUN2 0.36
 'Zwiebeln/Lauch'.JUL1 1.53
 'Zwiebeln/Lauch'.JUL2 1.53
 'Zwiebeln/Lauch'.AUG2 12.84
 'Zwiebeln/Lauch'.SEP1 3.59
 'Zwiebeln/Lauch'.OKT1 1.81
 'Zwiebeln/Lauch'.OKT2 0.39
 'Zwiebeln/Lauch'.NOV1 1.88
/;
