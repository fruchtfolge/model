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
set curYear(years) / 2018 /;
set soilTypes /
'Tonschluffe (tu)'
'Tonlehme (tl)'
/;

set plots /
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'
 '3a54396e-9498-42bb-ac67-c1bae80039f0'
 '29888b74-b714-4601-b7a1-af9a36815f46'
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'
 '5d398b6a-2484-41d5-834f-9d87c97cec63'
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'
 '39e137cd-7452-48d6-aca5-9727d2c259eb'
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'
 'bc5b40e4-156f-4998-b028-720fcaa3188d'
 'aa736150-1fd4-4620-853f-f25f2ac51270'
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'
 '986884d8-922a-4010-bdd5-f1bf086f239d'
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'
 'a904bbb2-eef8-4f99-8733-8914f938b215'
 '9f147b44-613c-43df-9cb8-03fae0b34832'
 'd86a304c-2490-4eef-911f-5500abcc0c62'
 'ba730867-30ef-4676-9d54-4f4d14060dec'
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'
 'b305b593-d399-4033-8016-adad994c7197'
 'fd720b24-9418-476c-ae80-b729b4a36416'
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'
 'edeedb32-f09c-4f82-a05f-f8d912516754'
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'
 '52032a68-bdb4-4494-aa96-412c47c00550'
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'
 'eea74f56-db83-4479-9ec3-b89c6292bea8'
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'
 '813511e5-3267-492b-bd56-97fd7510ae3e'
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'
 'c6dcf866-034b-4afc-9bc6-307a7023b932'
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'
 '240d3cc7-9536-4949-b865-18490a91b456'
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'
 '371df927-d20f-44af-9c87-567115899fdd'
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'
 'a6622ab3-5a77-455c-863b-afee0468d9e0'
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'
 '4a502543-3326-46bc-86ce-e4815e96e39d'
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'
 '77655842-96cf-4e50-9b08-a9ad8616de60'
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'
 'bc311d55-2e85-40d0-b635-a5e34112c34a'
 '6cd62235-8a0e-4c33-b867-08025d189429'
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'
 '830041d1-ede0-4fa3-9895-f49f17af9f20'
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'
/;

set curPlots(plots) /
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'
 '3a54396e-9498-42bb-ac67-c1bae80039f0'
 '29888b74-b714-4601-b7a1-af9a36815f46'
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'
 '5d398b6a-2484-41d5-834f-9d87c97cec63'
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'
 '39e137cd-7452-48d6-aca5-9727d2c259eb'
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'
 'bc5b40e4-156f-4998-b028-720fcaa3188d'
 'aa736150-1fd4-4620-853f-f25f2ac51270'
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'
 '986884d8-922a-4010-bdd5-f1bf086f239d'
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'
 'a904bbb2-eef8-4f99-8733-8914f938b215'
 '9f147b44-613c-43df-9cb8-03fae0b34832'
 'd86a304c-2490-4eef-911f-5500abcc0c62'
 'ba730867-30ef-4676-9d54-4f4d14060dec'
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'
 'b305b593-d399-4033-8016-adad994c7197'
 'fd720b24-9418-476c-ae80-b729b4a36416'
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'
 'edeedb32-f09c-4f82-a05f-f8d912516754'
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'
 '52032a68-bdb4-4494-aa96-412c47c00550'
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'
 'eea74f56-db83-4479-9ec3-b89c6292bea8'
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'
 '813511e5-3267-492b-bd56-97fd7510ae3e'
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'
 'c6dcf866-034b-4afc-9bc6-307a7023b932'
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'
 '240d3cc7-9536-4949-b865-18490a91b456'
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'
 '371df927-d20f-44af-9c87-567115899fdd'
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'
 'a6622ab3-5a77-455c-863b-afee0468d9e0'
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'
 '4a502543-3326-46bc-86ce-e4815e96e39d'
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'
 '77655842-96cf-4e50-9b08-a9ad8616de60'
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'
 'bc311d55-2e85-40d0-b635-a5e34112c34a'
 '6cd62235-8a0e-4c33-b867-08025d189429'
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'
 '830041d1-ede0-4fa3-9895-f49f17af9f20'
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'
/;

parameter p_plotData(curPlots,plotAttr) /
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.size 0.32
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.distance 2
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.quality 70.5
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.size 0.27
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.distance 2
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.quality 70.5
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.size 1.43
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.distance 2
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.quality 73.5
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.size 5.61
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.distance 2
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.quality 76.5
 '29888b74-b714-4601-b7a1-af9a36815f46'.size 3.27
 '29888b74-b714-4601-b7a1-af9a36815f46'.distance 2
 '29888b74-b714-4601-b7a1-af9a36815f46'.quality 76.5
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.size 2.62
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.distance 2
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.quality 73.5
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.size 0.36
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.distance 2
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.quality 70.5
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.size 2.33
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.distance 2
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.quality 76.5
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.size 3.45
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.distance 2
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.quality 70.5
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.size 1.53
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.distance 2
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.quality 70.5
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.size 6.22
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.distance 2
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.quality 70.5
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.size 1.33
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.distance 2
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.quality 0
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.size 5.71
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.distance 2
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.quality 73.5
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.size 0.57
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.distance 2
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.quality 70.5
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.size 3.13
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.distance 2
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.quality 70.5
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.size 9.81
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.distance 2
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.quality 70.5
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.size 6.08
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.distance 2
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.quality 70.5
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.size 1.15
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.distance 2
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.quality 67.5
 'aa736150-1fd4-4620-853f-f25f2ac51270'.size 3.13
 'aa736150-1fd4-4620-853f-f25f2ac51270'.distance 2
 'aa736150-1fd4-4620-853f-f25f2ac51270'.quality 73.5
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.size 7.66
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.distance 2
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.quality 76.5
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.size 2.78
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.distance 2
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.quality 70.5
 '986884d8-922a-4010-bdd5-f1bf086f239d'.size 5.99
 '986884d8-922a-4010-bdd5-f1bf086f239d'.distance 2
 '986884d8-922a-4010-bdd5-f1bf086f239d'.quality 70.5
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.size 3
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.distance 2
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.quality 73.5
 'a904bbb2-eef8-4f99-8733-8914f938b215'.size 3.42
 'a904bbb2-eef8-4f99-8733-8914f938b215'.distance 2
 'a904bbb2-eef8-4f99-8733-8914f938b215'.quality 76.5
 '9f147b44-613c-43df-9cb8-03fae0b34832'.size 2.84
 '9f147b44-613c-43df-9cb8-03fae0b34832'.distance 2
 '9f147b44-613c-43df-9cb8-03fae0b34832'.quality 70.5
 'd86a304c-2490-4eef-911f-5500abcc0c62'.size 4.25
 'd86a304c-2490-4eef-911f-5500abcc0c62'.distance 2
 'd86a304c-2490-4eef-911f-5500abcc0c62'.quality 70.5
 'ba730867-30ef-4676-9d54-4f4d14060dec'.size 2.49
 'ba730867-30ef-4676-9d54-4f4d14060dec'.distance 2
 'ba730867-30ef-4676-9d54-4f4d14060dec'.quality 70.5
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.size 2.92
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.distance 2
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.quality 70.5
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.size 0.79
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.distance 2
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.quality 66
 'b305b593-d399-4033-8016-adad994c7197'.size 2.33
 'b305b593-d399-4033-8016-adad994c7197'.distance 2
 'b305b593-d399-4033-8016-adad994c7197'.quality 69
 'fd720b24-9418-476c-ae80-b729b4a36416'.size 0.88
 'fd720b24-9418-476c-ae80-b729b4a36416'.distance 2
 'fd720b24-9418-476c-ae80-b729b4a36416'.quality 69
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.size 3.69
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.distance 2
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.quality 70.5
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.size 1.98
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.distance 2
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.quality 67.5
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.size 7.5
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.distance 2
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.quality 70.5
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.size 0.84
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.distance 2
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.quality 0
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.size 1.59
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.distance 2
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.quality 70.5
 'edeedb32-f09c-4f82-a05f-f8d912516754'.size 0.93
 'edeedb32-f09c-4f82-a05f-f8d912516754'.distance 2
 'edeedb32-f09c-4f82-a05f-f8d912516754'.quality 73.5
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.size 3.2
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.distance 2
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.quality 70.5
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.size 8.41
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.distance 2
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.quality 67.5
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.size 1.03
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.distance 2
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.quality 64.5
 '52032a68-bdb4-4494-aa96-412c47c00550'.size 10.29
 '52032a68-bdb4-4494-aa96-412c47c00550'.distance 2
 '52032a68-bdb4-4494-aa96-412c47c00550'.quality 70.5
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.size 1.44
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.distance 2
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.quality 70.5
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.size 1.96
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.distance 2
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.quality 70.5
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.size 3.85
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.distance 2
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.quality 76.5
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.size 6.69
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.distance 2
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.quality 70.5
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.size 1.36
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.distance 2
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.quality 70.5
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.size 1.74
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.distance 2
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.quality 70.5
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.size 0.2
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.distance 2
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.quality 70.5
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.size 2.55
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.distance 2
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.quality 73.5
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.size 1.26
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.distance 2
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.quality 70.5
 '813511e5-3267-492b-bd56-97fd7510ae3e'.size 2.8
 '813511e5-3267-492b-bd56-97fd7510ae3e'.distance 2
 '813511e5-3267-492b-bd56-97fd7510ae3e'.quality 70.5
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.size 0.41
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.distance 2
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.quality 67.5
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.size 1.71
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.distance 2
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.quality 76.5
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.size 5.16
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.distance 2
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.quality 70.5
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.size 5.41
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.distance 2
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.quality 70.5
 '240d3cc7-9536-4949-b865-18490a91b456'.size 2.13
 '240d3cc7-9536-4949-b865-18490a91b456'.distance 2
 '240d3cc7-9536-4949-b865-18490a91b456'.quality 70.5
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.size 5.75
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.distance 2
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.quality 70.5
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.size 1.51
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.distance 2
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.quality 64.5
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.size 4
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.distance 2
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.quality 76.5
 '371df927-d20f-44af-9c87-567115899fdd'.size 2.6
 '371df927-d20f-44af-9c87-567115899fdd'.distance 2
 '371df927-d20f-44af-9c87-567115899fdd'.quality 76.5
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.size 0.83
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.distance 2
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.quality 70.5
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.size 2.74
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.distance 2
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.quality 70.5
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.size 1.64
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.distance 2
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.quality 70.5
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.size 1.97
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.distance 2
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.quality 76.5
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.size 0.1
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.distance 2
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.quality 0
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.size 0.03
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.distance 2
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.quality 67.5
 '4a502543-3326-46bc-86ce-e4815e96e39d'.size 1.56
 '4a502543-3326-46bc-86ce-e4815e96e39d'.distance 2
 '4a502543-3326-46bc-86ce-e4815e96e39d'.quality 67.5
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.size 3.93
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.distance 2
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.quality 70.5
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.size 3.77
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.distance 2
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.quality 73.5
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.size 3.66
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.distance 2
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.quality 64.5
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.size 0.56
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.distance 2
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.quality 67.5
 '77655842-96cf-4e50-9b08-a9ad8616de60'.size 5.06
 '77655842-96cf-4e50-9b08-a9ad8616de60'.distance 2
 '77655842-96cf-4e50-9b08-a9ad8616de60'.quality 70.5
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.size 3.74
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.distance 2
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.quality 70.5
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.size 3.59
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.distance 2
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.quality 67.5
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.size 0.7
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.distance 2
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.quality 73.5
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.size 0.94
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.distance 2
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.quality 73.5
 '6cd62235-8a0e-4c33-b867-08025d189429'.size 1.26
 '6cd62235-8a0e-4c33-b867-08025d189429'.distance 2
 '6cd62235-8a0e-4c33-b867-08025d189429'.quality 70.5
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.size 3.15
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.distance 2
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.quality 70.5
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.size 1.41
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.distance 2
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.quality 70.5
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.size 0.59
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.distance 2
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.quality 70.5
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.size 1.71
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.distance 2
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.quality 70.5
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.size 0.26
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.distance 2
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.quality 70.5
/;

set plots_soilTypes(curPlots,soilTypes) /
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.'Tonschluffe (tu)'
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'Tonschluffe (tu)'
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.'Tonschluffe (tu)'
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.'Tonschluffe (tu)'
 '29888b74-b714-4601-b7a1-af9a36815f46'.'Tonschluffe (tu)'
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.'Tonschluffe (tu)'
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'Tonschluffe (tu)'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.'Tonschluffe (tu)'
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'Tonschluffe (tu)'
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.'Tonschluffe (tu)'
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.'Tonschluffe (tu)'
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.'Tonschluffe (tu)'
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.'Tonschluffe (tu)'
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'Tonschluffe (tu)'
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.'Tonschluffe (tu)'
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.'Tonschluffe (tu)'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'Tonschluffe (tu)'
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.'Tonschluffe (tu)'
 'aa736150-1fd4-4620-853f-f25f2ac51270'.'Tonschluffe (tu)'
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.'Tonschluffe (tu)'
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.'Tonschluffe (tu)'
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'Tonschluffe (tu)'
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.'Tonschluffe (tu)'
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'Tonschluffe (tu)'
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'Tonschluffe (tu)'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.'Tonschluffe (tu)'
 'ba730867-30ef-4676-9d54-4f4d14060dec'.'Tonschluffe (tu)'
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.'Tonschluffe (tu)'
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.'Tonlehme (tl)'
 'b305b593-d399-4033-8016-adad994c7197'.'Tonlehme (tl)'
 'fd720b24-9418-476c-ae80-b729b4a36416'.'Tonlehme (tl)'
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.'Tonschluffe (tu)'
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.'Tonschluffe (tu)'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.'Tonschluffe (tu)'
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.'Tonschluffe (tu)'
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.'Tonschluffe (tu)'
 'edeedb32-f09c-4f82-a05f-f8d912516754'.'Tonschluffe (tu)'
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'Tonschluffe (tu)'
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'Tonschluffe (tu)'
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.'Tonschluffe (tu)'
 '52032a68-bdb4-4494-aa96-412c47c00550'.'Tonschluffe (tu)'
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.'Tonschluffe (tu)'
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'Tonschluffe (tu)'
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.'Tonschluffe (tu)'
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'Tonschluffe (tu)'
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.'Tonschluffe (tu)'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.'Tonschluffe (tu)'
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.'Tonschluffe (tu)'
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.'Tonschluffe (tu)'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.'Tonschluffe (tu)'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'Tonschluffe (tu)'
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'Tonschluffe (tu)'
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.'Tonschluffe (tu)'
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'Tonschluffe (tu)'
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.'Tonschluffe (tu)'
 '240d3cc7-9536-4949-b865-18490a91b456'.'Tonschluffe (tu)'
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.'Tonschluffe (tu)'
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.'Tonschluffe (tu)'
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.'Tonschluffe (tu)'
 '371df927-d20f-44af-9c87-567115899fdd'.'Tonschluffe (tu)'
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.'Tonschluffe (tu)'
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.'Tonschluffe (tu)'
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.'Tonschluffe (tu)'
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.'Tonschluffe (tu)'
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'Tonschluffe (tu)'
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'Tonschluffe (tu)'
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'Tonschluffe (tu)'
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.'Tonschluffe (tu)'
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.'Tonschluffe (tu)'
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'Tonschluffe (tu)'
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'Tonschluffe (tu)'
 '77655842-96cf-4e50-9b08-a9ad8616de60'.'Tonschluffe (tu)'
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.'Tonschluffe (tu)'
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'Tonschluffe (tu)'
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'Tonschluffe (tu)'
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.'Tonschluffe (tu)'
 '6cd62235-8a0e-4c33-b867-08025d189429'.'Tonschluffe (tu)'
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'Tonschluffe (tu)'
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.'Tonschluffe (tu)'
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.'Tonschluffe (tu)'
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'Tonschluffe (tu)'
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'Tonschluffe (tu)'
/;

set plots_rootCropCap(curPlots) /
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac' 'YES'
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336' 'YES'
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c' 'YES'
 '3a54396e-9498-42bb-ac67-c1bae80039f0' 'YES'
 '29888b74-b714-4601-b7a1-af9a36815f46' 'YES'
 '20b23add-06bf-4c01-b33c-c6df3a9d3944' 'YES'
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee' 'YES'
 '5d398b6a-2484-41d5-834f-9d87c97cec63' 'YES'
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1' 'YES'
 'c16b7f3d-2425-42dd-9b79-93df69be1deb' 'YES'
 '39e137cd-7452-48d6-aca5-9727d2c259eb' 'YES'
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7' 'YES'
 'c89a5b3f-0de6-4f02-816e-1cd1544041db' 'YES'
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62' 'YES'
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e' 'YES'
 'bc5b40e4-156f-4998-b028-720fcaa3188d' 'YES'
 'aa736150-1fd4-4620-853f-f25f2ac51270' 'YES'
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd' 'YES'
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795' 'YES'
 '986884d8-922a-4010-bdd5-f1bf086f239d' 'YES'
 'a5be37d1-a1e4-4466-889c-d2e5428e016b' 'YES'
 'a904bbb2-eef8-4f99-8733-8914f938b215' 'YES'
 '9f147b44-613c-43df-9cb8-03fae0b34832' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62' 'YES'
 'ba730867-30ef-4676-9d54-4f4d14060dec' 'YES'
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9' 'YES'
 '31b0a08f-5364-448c-bbfe-3b533d12fba0' 'YES'
 'b305b593-d399-4033-8016-adad994c7197' 'YES'
 'fd720b24-9418-476c-ae80-b729b4a36416' 'YES'
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7' 'YES'
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824' 'YES'
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f' 'YES'
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71' 'YES'
 'edeedb32-f09c-4f82-a05f-f8d912516754' 'YES'
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d' 'YES'
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0' 'YES'
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54' 'YES'
 '52032a68-bdb4-4494-aa96-412c47c00550' 'YES'
 '350b9c6a-9f58-4c31-b44a-278bce9469f8' 'YES'
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c' 'YES'
 'eea74f56-db83-4479-9ec3-b89c6292bea8' 'YES'
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1' 'YES'
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206' 'YES'
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416' 'YES'
 '51a838d5-5dd2-4d05-99bd-473b1da602ce' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e' 'YES'
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c' 'YES'
 '0b4046a3-b745-4e90-84ce-42d7a0edf666' 'YES'
 'c6dcf866-034b-4afc-9bc6-307a7023b932' 'YES'
 'f7862ca8-775b-4b4e-994f-6f45b396bee8' 'YES'
 '240d3cc7-9536-4949-b865-18490a91b456' 'YES'
 '63f0ee7a-0114-4056-8efb-392f6802f0b6' 'YES'
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c' 'YES'
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2' 'YES'
 '371df927-d20f-44af-9c87-567115899fdd' 'YES'
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9' 'YES'
 'a6622ab3-5a77-455c-863b-afee0468d9e0' 'YES'
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb' 'YES'
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa' 'YES'
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4' 'YES'
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2' 'YES'
 '4a502543-3326-46bc-86ce-e4815e96e39d' 'YES'
 'bc7347ba-deb3-434f-8b84-33285f02bf5f' 'YES'
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10' 'YES'
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94' 'YES'
 '1ef80fa5-3b01-4540-8096-05e5dbc87994' 'YES'
 '77655842-96cf-4e50-9b08-a9ad8616de60' 'YES'
 'ae1b2b6a-2903-487a-90c0-55135fc786b6' 'YES'
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957' 'YES'
 'b8ae13b4-af74-4569-92d9-93bfff522e7c' 'YES'
 'bc311d55-2e85-40d0-b635-a5e34112c34a' 'YES'
 '6cd62235-8a0e-4c33-b867-08025d189429' 'YES'
 '0dfd3432-793f-4223-9224-beac6fb0fd2f' 'YES'
 '830041d1-ede0-4fa3-9895-f49f17af9f20' 'YES'
 '7e4ee834-2dc1-4dfa-8756-b2021b971676' 'YES'
 '9b2ad926-4826-44ff-9f11-265ef49ceeac' 'YES'
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3' 'YES'
/;

set plots_permPast(curPlots) /
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3' 'YES'
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c' 'YES'
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4' 'YES'
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2' 'YES'
 '4a502543-3326-46bc-86ce-e4815e96e39d' 'YES'
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94' 'YES'
 '1ef80fa5-3b01-4540-8096-05e5dbc87994' 'YES'
 'b8ae13b4-af74-4569-92d9-93bfff522e7c' 'YES'
 '0dfd3432-793f-4223-9224-beac6fb0fd2f' 'YES'
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3' 'YES'
/;

set crops /
 ''
 '220'
 '424'
 '210'
 '459'
 '602'
 '422'
 '171'
 '634'
 '411'
 '996'
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

set permPastCrops(curCrops) /
 ''
 '459'
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
'220'.maxShare 16.67
'220'.minSoilQuality 20
'220'.efaFactor 1
'459'.rotBreak 0
'459'.maxShare 100
'459'.minSoilQuality 0
'459'.efaFactor 0
'602'.rotBreak 3
'602'.maxShare 25
'602'.minSoilQuality 20
'602'.efaFactor 0
'422'.rotBreak 0
'422'.maxShare 100
'422'.minSoilQuality 20
'422'.efaFactor 0
'634'.rotBreak 4
'634'.maxShare 20
'634'.minSoilQuality 20
'634'.efaFactor 0
'411'.rotBreak 2
'411'.maxShare 33.33
'411'.minSoilQuality 20
'411'.efaFactor 0
'115'.rotBreak 2
'115'.maxShare 33.33
'115'.minSoilQuality 20
'115'.efaFactor 0
'603'.rotBreak 4
'603'.maxShare 20
'603'.minSoilQuality 20
'603'.efaFactor 0
'633'.rotBreak 3
'633'.maxShare 25
'633'.minSoilQuality 20
'633'.efaFactor 0
/;

set crops_rootCrop(curCrops) /
 '602' YES
 '603' YES
/;

set crops_catchCrop(curCrops) /
 '220' YES
 '459' YES
 '602' YES
 '422' YES
 '634' YES
 '115' YES
 '633' YES
/;

set crops_summer(curCrops) /
 '220' YES
 '459' YES
 '602' YES
 '422' YES
 '634' YES
 '411' YES
 '603' YES
 '633' YES
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
 '459'.'220' 0
 '459'.'459' 10
 '459'.'602' 0
 '459'.'422' 0
 '459'.'634' 0
 '459'.'411' 0
 '459'.'115' 0
 '459'.'603' 0
 '459'.'633' 0
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
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.2018.'411' 'YES'
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.2016.'131' 'YES'
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.2017.'603' 'YES'
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.2018.'220' 'YES'
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.2018.'633' 'YES'
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.2018.'411' 'YES'
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.2016.'131' 'YES'
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.2017.'603' 'YES'
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.2018.'220' 'YES'
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.2018.'633' 'YES'
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.2018.'411' 'YES'
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.2017.'220' 'YES'
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.2016.'411' 'YES'
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.2018.'115' 'YES'
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.2016.'131' 'YES'
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.2017.'602' 'YES'
 '29888b74-b714-4601-b7a1-af9a36815f46'.2018.'603' 'YES'
 '29888b74-b714-4601-b7a1-af9a36815f46'.2017.'115' 'YES'
 '29888b74-b714-4601-b7a1-af9a36815f46'.2016.'602' 'YES'
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.2018.'411' 'YES'
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.2017.'131' 'YES'
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.2016.'602' 'YES'
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.2016.'459' 'YES'
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.2017.'459' 'YES'
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.2018.'459' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.2018.'220' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.2017.'115' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.2018.'633' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.2016.'602' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.2017.'602' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.2018.'115' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.2016.'131' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.2017.'220' 'YES'
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.2018.'411' 'YES'
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.2018.'115' 'YES'
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.2018.'411' 'YES'
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.2017.'602' 'YES'
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.2018.'115' 'YES'
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.2018.'411' 'YES'
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.2017.'602' 'YES'
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.2017.'115' 'YES'
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.2018.'603' 'YES'
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.2016.'602' 'YES'
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.2017.'115' 'YES'
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.2018.'411' 'YES'
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.2016.'602' 'YES'
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.2016.'603' 'YES'
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.2018.'115' 'YES'
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.2017.'602' 'YES'
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.2018.'411' 'YES'
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.2016.'131' 'YES'
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.2017.'603' 'YES'
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.2018.'220' 'YES'
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.2018.'633' 'YES'
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.2016.'411' 'YES'
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.2017.'220' 'YES'
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.2018.'602' 'YES'
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.2016.'411' 'YES'
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.2017.'220' 'YES'
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.2018.'602' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.2018.'220' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.2017.'115' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.2018.'633' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.2016.'602' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.2017.'602' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.2018.'115' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.2016.'131' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.2017.'220' 'YES'
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.2018.'411' 'YES'
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.2016.'131' 'YES'
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.2017.'411' 'YES'
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.2018.'602' 'YES'
 'aa736150-1fd4-4620-853f-f25f2ac51270'.2016.'171' 'YES'
 'aa736150-1fd4-4620-853f-f25f2ac51270'.2017.'633' 'YES'
 'aa736150-1fd4-4620-853f-f25f2ac51270'.2018.'602' 'YES'
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.2017.'115' 'YES'
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.2016.'210' 'YES'
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.2018.'602' 'YES'
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.2018.'633' 'YES'
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.2017.'220' 'YES'
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.2018.'411' 'YES'
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.2016.'115' 'YES'
 '986884d8-922a-4010-bdd5-f1bf086f239d'.2018.'634' 'YES'
 '986884d8-922a-4010-bdd5-f1bf086f239d'.2017.'633' 'YES'
 '986884d8-922a-4010-bdd5-f1bf086f239d'.2018.'220' 'YES'
 '986884d8-922a-4010-bdd5-f1bf086f239d'.2016.'171' 'YES'
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.2018.'602' 'YES'
 'a904bbb2-eef8-4f99-8733-8914f938b215'.2018.'602' 'YES'
 'a904bbb2-eef8-4f99-8733-8914f938b215'.2016.'115' 'YES'
 'a904bbb2-eef8-4f99-8733-8914f938b215'.2017.'131' 'YES'
 '9f147b44-613c-43df-9cb8-03fae0b34832'.2018.'633' 'YES'
 '9f147b44-613c-43df-9cb8-03fae0b34832'.2017.'603' 'YES'
 '9f147b44-613c-43df-9cb8-03fae0b34832'.2016.'115' 'YES'
 '9f147b44-613c-43df-9cb8-03fae0b34832'.2018.'220' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2017.'633' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2018.'602' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2017.'411' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2018.'411' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2017.'131' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2016.'171' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2016.'115' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2016.'131' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2016.'996' 'YES'
 'd86a304c-2490-4eef-911f-5500abcc0c62'.2017.'996' 'YES'
 'ba730867-30ef-4676-9d54-4f4d14060dec'.2018.'602' 'YES'
 'ba730867-30ef-4676-9d54-4f4d14060dec'.2018.'411' 'YES'
 'ba730867-30ef-4676-9d54-4f4d14060dec'.2016.'115' 'YES'
 'ba730867-30ef-4676-9d54-4f4d14060dec'.2017.'411' 'YES'
 'ba730867-30ef-4676-9d54-4f4d14060dec'.2017.'603' 'YES'
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.2018.'602' 'YES'
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.2017.'411' 'YES'
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.2016.'115' 'YES'
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.2018.'602' 'YES'
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.2016.'210' 'YES'
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.2017.'115' 'YES'
 'b305b593-d399-4033-8016-adad994c7197'.2016.'633' 'YES'
 'b305b593-d399-4033-8016-adad994c7197'.2016.'210' 'YES'
 'b305b593-d399-4033-8016-adad994c7197'.2018.'602' 'YES'
 'b305b593-d399-4033-8016-adad994c7197'.2017.'115' 'YES'
 'fd720b24-9418-476c-ae80-b729b4a36416'.2016.'210' 'YES'
 'fd720b24-9418-476c-ae80-b729b4a36416'.2018.'602' 'YES'
 'fd720b24-9418-476c-ae80-b729b4a36416'.2017.'115' 'YES'
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.2018.'634' 'YES'
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.2017.'411' 'YES'
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.2016.'115' 'YES'
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.2018.'634' 'YES'
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.2018.'220' 'YES'
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.2017.'411' 'YES'
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.2016.'115' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.2018.'220' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.2017.'115' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.2018.'633' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.2016.'602' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.2017.'602' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.2018.'115' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.2016.'131' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.2017.'220' 'YES'
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.2018.'411' 'YES'
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.2018.'411' 'YES'
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.2017.'220' 'YES'
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.2016.'171' 'YES'
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.2018.'633' 'YES'
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.2017.'220' 'YES'
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.2018.'411' 'YES'
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.2016.'115' 'YES'
 'edeedb32-f09c-4f82-a05f-f8d912516754'.2017.'220' 'YES'
 'edeedb32-f09c-4f82-a05f-f8d912516754'.2018.'411' 'YES'
 'edeedb32-f09c-4f82-a05f-f8d912516754'.2016.'115' 'YES'
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.2017.'131' 'YES'
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.2018.'603' 'YES'
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.2016.'171' 'YES'
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.2017.'131' 'YES'
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.2016.'115' 'YES'
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.2018.'411' 'YES'
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.2016.'171' 'YES'
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.2016.'171' 'YES'
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.2017.'220' 'YES'
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.2018.'411' 'YES'
 '52032a68-bdb4-4494-aa96-412c47c00550'.2018.'634' 'YES'
 '52032a68-bdb4-4494-aa96-412c47c00550'.2017.'633' 'YES'
 '52032a68-bdb4-4494-aa96-412c47c00550'.2018.'220' 'YES'
 '52032a68-bdb4-4494-aa96-412c47c00550'.2016.'171' 'YES'
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.2017.'602' 'YES'
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.2018.'115' 'YES'
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.2016.'603' 'YES'
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.2016.'602' 'YES'
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.2016.'171' 'YES'
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.2017.'115' 'YES'
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.2018.'220' 'YES'
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.2016.'602' 'YES'
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.2016.'171' 'YES'
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.2017.'115' 'YES'
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.2018.'220' 'YES'
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.2017.'131' 'YES'
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.2018.'411' 'YES'
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.2016.'602' 'YES'
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.2018.'411' 'YES'
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.2017.'115' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.2018.'220' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.2017.'115' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.2018.'633' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.2016.'602' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.2017.'602' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.2018.'115' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.2016.'131' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.2017.'220' 'YES'
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.2018.'411' 'YES'
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.2018.'633' 'YES'
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.2017.'603' 'YES'
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.2016.'115' 'YES'
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.2018.'220' 'YES'
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.2017.'633' 'YES'
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.2016.'171' 'YES'
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.2018.'220' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2017.'633' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2018.'602' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2017.'411' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2018.'411' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2017.'131' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2016.'171' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2016.'115' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2016.'131' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2016.'996' 'YES'
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.2017.'996' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2017.'633' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2018.'602' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2017.'411' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2018.'411' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2017.'131' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2016.'171' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2016.'115' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2016.'131' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2016.'996' 'YES'
 '813511e5-3267-492b-bd56-97fd7510ae3e'.2017.'996' 'YES'
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.2017.'459' 'YES'
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.2016.'459' 'YES'
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.2018.'459' 'YES'
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.2017.'602' 'YES'
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.2018.'411' 'YES'
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.2016.'603' 'YES'
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.2016.'171' 'YES'
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.2018.'411' 'YES'
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.2017.'131' 'YES'
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.2017.'602' 'YES'
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.2016.'115' 'YES'
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.2018.'115' 'YES'
 '240d3cc7-9536-4949-b865-18490a91b456'.2018.'602' 'YES'
 '240d3cc7-9536-4949-b865-18490a91b456'.2018.'411' 'YES'
 '240d3cc7-9536-4949-b865-18490a91b456'.2016.'115' 'YES'
 '240d3cc7-9536-4949-b865-18490a91b456'.2017.'411' 'YES'
 '240d3cc7-9536-4949-b865-18490a91b456'.2017.'603' 'YES'
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.2017.'602' 'YES'
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.2016.'603' 'YES'
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.2018.'411' 'YES'
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.2018.'115' 'YES'
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.2017.'411' 'YES'
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.2016.'131' 'YES'
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.2017.'602' 'YES'
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.2018.'115' 'YES'
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.2016.'603' 'YES'
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.2017.'411' 'YES'
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.2018.'411' 'YES'
 '371df927-d20f-44af-9c87-567115899fdd'.2016.'633' 'YES'
 '371df927-d20f-44af-9c87-567115899fdd'.2017.'411' 'YES'
 '371df927-d20f-44af-9c87-567115899fdd'.2018.'603' 'YES'
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.2017.'602' 'YES'
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.2018.'115' 'YES'
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.2016.'603' 'YES'
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.2017.'411' 'YES'
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.2018.'411' 'YES'
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.2016.'633' 'YES'
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.2018.'603' 'YES'
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.2017.'411' 'YES'
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.2018.'411' 'YES'
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.2017.'115' 'YES'
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.2017.'602' 'YES'
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.2018.'115' 'YES'
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.2016.'131' 'YES'
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.2018.'459' 'YES'
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.2016.'459' 'YES'
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.2017.'459' 'YES'
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.2018.'459' 'YES'
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.2017.'459' 'YES'
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.2016.'459' 'YES'
 '4a502543-3326-46bc-86ce-e4815e96e39d'.2016.'459' 'YES'
 '4a502543-3326-46bc-86ce-e4815e96e39d'.2018.'459' 'YES'
 '4a502543-3326-46bc-86ce-e4815e96e39d'.2017.'459' 'YES'
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.2017.'602' 'YES'
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.2016.'603' 'YES'
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.2018.'411' 'YES'
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.2017.'602' 'YES'
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.2018.'411' 'YES'
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.2016.'603' 'YES'
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.2017.'459' 'YES'
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.2018.'459' 'YES'
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.2016.'459' 'YES'
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.2018.'459' 'YES'
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.2017.'459' 'YES'
 '77655842-96cf-4e50-9b08-a9ad8616de60'.2017.'634' 'YES'
 '77655842-96cf-4e50-9b08-a9ad8616de60'.2018.'115' 'YES'
 '77655842-96cf-4e50-9b08-a9ad8616de60'.2017.'603' 'YES'
 '77655842-96cf-4e50-9b08-a9ad8616de60'.2016.'115' 'YES'
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.2017.'634' 'YES'
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.2018.'115' 'YES'
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.2017.'603' 'YES'
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.2016.'115' 'YES'
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.2018.'634' 'YES'
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.2018.'220' 'YES'
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.2017.'411' 'YES'
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.2016.'115' 'YES'
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.2018.'459' 'YES'
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.2017.'459' 'YES'
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.2016.'459' 'YES'
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.2017.'411' 'YES'
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.2016.'131' 'YES'
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.2018.'411' 'YES'
 '6cd62235-8a0e-4c33-b867-08025d189429'.2016.'602' 'YES'
 '6cd62235-8a0e-4c33-b867-08025d189429'.2018.'422' 'YES'
 '6cd62235-8a0e-4c33-b867-08025d189429'.2017.'422' 'YES'
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.2018.'459' 'YES'
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.2016.'459' 'YES'
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.2017.'459' 'YES'
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.2016.'411' 'YES'
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.2018.'603' 'YES'
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.2017.'220' 'YES'
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.2017.'602' 'YES'
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.2016.'131' 'YES'
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.2018.'220' 'YES'
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.2018.'115' 'YES'
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.2017.'602' 'YES'
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.2016.'131' 'YES'
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.2018.'220' 'YES'
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.2018.'115' 'YES'
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.2018.'459' 'YES'
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.2016.'459' 'YES'
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.2017.'459' 'YES'
/;

parameter p_grossMarginData(curPlots,curCrops) /
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.'220' -10
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.'459' 189
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.'602' 1739
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.'422' 109
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.'634' 1416
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.'411' 205
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.'115' 149
 '0089123f-74a4-4b87-bf15-d4e6a694c2ac'.'633' 5586
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'220' 23
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'459' 159
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'602' 1467
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'422' 340
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'634' 2947
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'411' 173
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'115' 125
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'603' 279
 'ca7cb05b-1685-42eb-85a6-ebf8261bd336'.'633' 8564
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.'459' 520
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.'602' 9471
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.'422' 535
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.'634' 7019
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.'411' 1302
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.'115' 912
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.'603' 1929
 '15d2c6f0-9c7a-4653-83e6-b38c42a0361c'.'633' 26492
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.'220' 794
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.'459' 2384
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.'422' 4150
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.'634' 30933
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.'411' 4540
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.'115' 3949
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.'603' 8241
 '3a54396e-9498-42bb-ac67-c1bae80039f0'.'633' 111411
 '29888b74-b714-4601-b7a1-af9a36815f46'.'220' 690
 '29888b74-b714-4601-b7a1-af9a36815f46'.'459' 2375
 '29888b74-b714-4601-b7a1-af9a36815f46'.'422' 3474
 '29888b74-b714-4601-b7a1-af9a36815f46'.'634' 47797
 '29888b74-b714-4601-b7a1-af9a36815f46'.'411' 3312
 '29888b74-b714-4601-b7a1-af9a36815f46'.'603' 4804
 '29888b74-b714-4601-b7a1-af9a36815f46'.'633' 130313
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.'220' 462
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.'459' 2117
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.'422' 3481
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.'634' 35616
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.'411' 2385
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.'115' 201
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.'603' 3534
 '20b23add-06bf-4c01-b33c-c6df3a9d3944'.'633' 98524
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'220' -197
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'459' 267
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'602' -1015
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'422' -189
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'634' -2818
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'411' -441
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'115' -266
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'603' -415
 'a387f0dd-0cf4-45e6-ba9b-d68a618c0ab3'.'633' -3287
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.'220' 492
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.'459' 1692
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.'422' 2475
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.'634' 34057
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.'411' 2360
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.'603' 3423
 '8b77326e-d5a1-45f6-9d5d-e1c2be0273ee'.'633' 92853
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'220' 292
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'459' 2037
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'602' 18748
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'422' 4338
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'634' 37658
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'411' 2212
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'115' 1604
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'603' 3567
 '5d398b6a-2484-41d5-834f-9d87c97cec63'.'633' 109425
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.'220' 130
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.'459' 481
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.'422' 972
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.'634' 6769
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.'411' 981
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.'115' 895
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.'603' 1917
 '68e4f0e7-b011-4214-a0f9-98991ca1d4c1'.'633' 26709
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.'220' 920
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.'459' 3673
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.'422' 5792
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.'634' 79463
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.'411' 5150
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.'603' 7791
 'c16b7f3d-2425-42dd-9b79-93df69be1deb'.'633' 222691
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.'220' 197
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.'459' 785
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.'422' 1238
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.'634' 16991
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.'411' 1101
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.'603' 1666
 '39e137cd-7452-48d6-aca5-9727d2c259eb'.'633' 47617
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.'220' 628
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.'459' 2075
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.'422' 3895
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.'634' 28027
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.'411' 4088
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.'115' 3641
 'fc1b4670-9960-4d04-b27a-cd17f7f5e4c7'.'633' 105783
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'220' 48
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'459' 337
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'602' 3097
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'422' 717
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'634' 6222
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'411' 365
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'115' 265
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'603' 589
 'c89a5b3f-0de6-4f02-816e-1cd1544041db'.'633' 18079
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.'459' 984
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.'602' 19593
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.'422' 1063
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.'634' 13847
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.'411' 2591
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.'115' 1831
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.'603' 3921
 '02bbe7c0-5aca-4d5b-ad93-4e3d7d826a62'.'633' 54639
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.'459' 3085
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.'602' 61407
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.'422' 3333
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.'634' 43400
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.'411' 8122
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.'115' 5740
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.'603' 12288
 '7e5926c8-1f32-4f8a-9933-4366c7509e1e'.'633' 171249
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'220' 515
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'459' 3590
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'602' 33040
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'422' 7645
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'634' 66366
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'411' 3899
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'115' 2826
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'603' 6287
 '7e3127d8-05ae-4741-b8f7-68db8cffae7e'.'633' 192843
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.'220' 137
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.'459' 776
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.'602' 6781
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.'422' 1364
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.'634' 4531
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.'115' 479
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.'603' 247
 'bc5b40e4-156f-4998-b028-720fcaa3188d'.'633' 18859
 'aa736150-1fd4-4620-853f-f25f2ac51270'.'220' -373
 'aa736150-1fd4-4620-853f-f25f2ac51270'.'459' 2037
 'aa736150-1fd4-4620-853f-f25f2ac51270'.'602' 13128
 'aa736150-1fd4-4620-853f-f25f2ac51270'.'422' 3098
 'aa736150-1fd4-4620-853f-f25f2ac51270'.'634' 15363
 'aa736150-1fd4-4620-853f-f25f2ac51270'.'411' 2849
 'aa736150-1fd4-4620-853f-f25f2ac51270'.'115' 1605
 'aa736150-1fd4-4620-853f-f25f2ac51270'.'603' 436
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.'220' 1617
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.'459' 5564
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.'602' 54215
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.'422' 8137
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.'634' 111965
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.'411' 7759
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.'603' 11253
 'c5098f4f-92dd-4614-b0d5-7ff3ac3a7cfd'.'633' 305260
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.'459' 874
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.'602' 17402
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.'422' 944
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.'634' 12299
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.'411' 2302
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.'115' 1627
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.'603' 3482
 '21dde6ee-9fd5-4f2e-b199-545ea26e9795'.'633' 48529
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'220' 507
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'459' 3537
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'602' 32551
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'422' 7532
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'634' 65384
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'411' 3841
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'115' 2784
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'603' 6194
 '986884d8-922a-4010-bdd5-f1bf086f239d'.'633' 189988
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.'220' -30
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.'459' 1953
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.'602' 17293
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.'422' 1122
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.'634' 14725
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.'411' 2148
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.'115' 1539
 'a5be37d1-a1e4-4466-889c-d2e5428e016b'.'633' 55578
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'220' 722
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'459' 3048
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'602' 24206
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'422' 4849
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'634' 49990
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'411' 3464
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'115' 397
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'603' 5024
 'a904bbb2-eef8-4f99-8733-8914f938b215'.'633' 136291
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'220' 240
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'459' 1677
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'602' 15433
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'422' 3571
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'634' 31000
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'411' 1821
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'115' 1320
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'603' 2937
 '9f147b44-613c-43df-9cb8-03fae0b34832'.'633' 90078
 'd86a304c-2490-4eef-911f-5500abcc0c62'.'220' -581
 'd86a304c-2490-4eef-911f-5500abcc0c62'.'459' 2509
 'd86a304c-2490-4eef-911f-5500abcc0c62'.'602' 16679
 'd86a304c-2490-4eef-911f-5500abcc0c62'.'422' 3958
 'd86a304c-2490-4eef-911f-5500abcc0c62'.'634' 18802
 'd86a304c-2490-4eef-911f-5500abcc0c62'.'411' 3519
 'd86a304c-2490-4eef-911f-5500abcc0c62'.'115' 1975
 'd86a304c-2490-4eef-911f-5500abcc0c62'.'603' 382
 'ba730867-30ef-4676-9d54-4f4d14060dec'.'220' -76
 'ba730867-30ef-4676-9d54-4f4d14060dec'.'459' 1470
 'ba730867-30ef-4676-9d54-4f4d14060dec'.'602' 13531
 'ba730867-30ef-4676-9d54-4f4d14060dec'.'422' 846
 'ba730867-30ef-4676-9d54-4f4d14060dec'.'634' 11016
 'ba730867-30ef-4676-9d54-4f4d14060dec'.'411' 1597
 'ba730867-30ef-4676-9d54-4f4d14060dec'.'115' 1157
 'ba730867-30ef-4676-9d54-4f4d14060dec'.'633' 43467
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.'220' 432
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.'459' 2165
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.'602' 18278
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.'422' 3672
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.'634' 12918
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.'115' 1357
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.'603' 792
 '5a50145d-7d4a-45ac-8d38-a44ab66971b9'.'633' 50973
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.'220' 84
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.'459' 395
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.'602' 4515
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.'422' 667
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.'634' 9123
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.'411' 557
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.'603' 876
 '31b0a08f-5364-448c-bbfe-3b533d12fba0'.'633' 26158
 'b305b593-d399-4033-8016-adad994c7197'.'220' 311
 'b305b593-d399-4033-8016-adad994c7197'.'459' 1305
 'b305b593-d399-4033-8016-adad994c7197'.'602' 14162
 'b305b593-d399-4033-8016-adad994c7197'.'422' 2102
 'b305b593-d399-4033-8016-adad994c7197'.'634' 28813
 'b305b593-d399-4033-8016-adad994c7197'.'411' 1833
 'b305b593-d399-4033-8016-adad994c7197'.'603' 2807
 'fd720b24-9418-476c-ae80-b729b4a36416'.'220' 118
 'fd720b24-9418-476c-ae80-b729b4a36416'.'459' 493
 'fd720b24-9418-476c-ae80-b729b4a36416'.'602' 5349
 'fd720b24-9418-476c-ae80-b729b4a36416'.'422' 794
 'fd720b24-9418-476c-ae80-b729b4a36416'.'634' 10882
 'fd720b24-9418-476c-ae80-b729b4a36416'.'411' 692
 'fd720b24-9418-476c-ae80-b729b4a36416'.'603' 1060
 'fd720b24-9418-476c-ae80-b729b4a36416'.'633' 30713
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.'220' 546
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.'459' 2736
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.'602' 23098
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.'422' 4640
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.'634' 16325
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.'115' 1715
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.'603' 1001
 '9dce8ea2-cefb-4664-9ab4-fa5a603b39f7'.'633' 64415
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.'220' 237
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.'459' 1337
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.'602' 11675
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.'422' 2349
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.'634' 7801
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.'115' 825
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.'603' 425
 'efb1b0ca-1ad2-4c63-8b84-e6fc18ab8826'.'633' 32471
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.'220' 635
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.'459' 2358
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.'422' 4766
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.'634' 33181
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.'411' 4809
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.'115' 4388
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.'603' 9395
 '2e9567d6-ed8c-4ebc-a2d3-42c32c734824'.'633' 130924
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.'459' 264
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.'602' 5258
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.'422' 285
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.'634' 3716
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.'411' 695
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.'115' 491
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.'603' 1052
 '0e7d59fb-3e51-4bc1-98f0-b54ee8ce1e0f'.'633' 14664
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.'459' 500
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.'602' 9953
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.'422' 540
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.'634' 7034
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.'411' 1316
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.'115' 930
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.'603' 1992
 'bd7d53c5-fb5f-4af9-82b2-492bc2966c71'.'633' 27756
 'edeedb32-f09c-4f82-a05f-f8d912516754'.'459' 338
 'edeedb32-f09c-4f82-a05f-f8d912516754'.'602' 6159
 'edeedb32-f09c-4f82-a05f-f8d912516754'.'422' 348
 'edeedb32-f09c-4f82-a05f-f8d912516754'.'634' 4565
 'edeedb32-f09c-4f82-a05f-f8d912516754'.'411' 846
 'edeedb32-f09c-4f82-a05f-f8d912516754'.'115' 593
 'edeedb32-f09c-4f82-a05f-f8d912516754'.'603' 1254
 'edeedb32-f09c-4f82-a05f-f8d912516754'.'633' 17229
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'220' 473
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'459' 2373
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'602' 20031
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'422' 4024
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'634' 40882
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'411' 2649
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'115' 145
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'603' 4008
 '9ee0ee69-eea1-4535-9d6d-6f1e9432bd0d'.'633' 114568
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'220' 1005
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'459' 5677
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'602' 49589
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'422' 9976
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'634' 100559
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'411' 6270
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'115' 116
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'603' 9726
 '45a8ac06-3d7b-4f67-a905-c186874ad4e0'.'633' 285942
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.'459' 209
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.'602' 5607
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.'422' 270
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.'634' 3434
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.'411' 662
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.'115' 480
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.'603' 1067
 'fc7d6187-86c7-40e5-bfe5-50f2b21d5e54'.'633' 15518
 '52032a68-bdb4-4494-aa96-412c47c00550'.'220' -1406
 '52032a68-bdb4-4494-aa96-412c47c00550'.'459' 6076
 '52032a68-bdb4-4494-aa96-412c47c00550'.'602' 40384
 '52032a68-bdb4-4494-aa96-412c47c00550'.'422' 9582
 '52032a68-bdb4-4494-aa96-412c47c00550'.'634' 45524
 '52032a68-bdb4-4494-aa96-412c47c00550'.'411' 8519
 '52032a68-bdb4-4494-aa96-412c47c00550'.'115' 4783
 '52032a68-bdb4-4494-aa96-412c47c00550'.'603' 924
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.'220' 122
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.'459' 453
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.'422' 915
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.'634' 6371
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.'411' 923
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.'115' 843
 '350b9c6a-9f58-4c31-b44a-278bce9469f8'.'633' 25137
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'220' 290
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'459' 1453
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'602' 12269
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'422' 2465
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'634' 8671
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'411' 1257
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'115' 911
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'603' 532
 'd796e5b7-9415-425d-b9ae-dc208cf0c54c'.'633' 34215
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.'220' 813
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.'459' 2796
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.'422' 4090
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.'634' 56275
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.'411' 3900
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.'603' 5656
 'eea74f56-db83-4479-9ec3-b89c6292bea8'.'633' 153427
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'220' 989
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'459' 4960
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'602' 41877
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'422' 8412
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'634' 85468
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'411' 5539
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'115' 303
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'603' 8380
 '5b9f8e7f-5d4e-45a6-8446-90e59da552a1'.'633' 239518
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.'220' 201
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.'459' 803
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.'422' 1266
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.'634' 17375
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.'411' 1126
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.'603' 1704
 '8a295ee1-ed5c-4d8a-ae19-6e9f6ffb16b4'.'633' 48691
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.'459' 547
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.'422' 591
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.'634' 7698
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.'411' 1441
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.'115' 1018
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.'603' 2180
 '42bdb40a-6faf-40d0-8ed5-93843542a206'.'633' 30374
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.'220' -6
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.'459' 118
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.'602' 1087
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.'422' 68
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.'634' 885
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.'411' 128
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.'115' 93
 'c0d7a710-7a19-4dfc-b632-2e5c1e7ba416'.'633' 3491
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.'220' -304
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.'459' 1660
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.'602' 10695
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.'422' 2524
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.'634' 12516
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.'411' 2321
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.'115' 1308
 '51a838d5-5dd2-4d05-99bd-473b1da602ce'.'603' 355
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.'220' 186
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.'459' 934
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.'602' 7887
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.'422' 1584
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.'634' 5574
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.'115' 586
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.'603' 342
 '57f45d53-f6b5-4abe-a43a-660f065cbe07'.'633' 21995
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'220' 414
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'459' 2076
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'602' 17527
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'422' 3521
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'634' 35771
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'411' 2318
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'115' 127
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'603' 3507
 '813511e5-3267-492b-bd56-97fd7510ae3e'.'633' 100247
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'220' -224
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'459' 277
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'602' -1156
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'422' -215
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'634' -3209
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'411' -503
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'115' -303
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'603' -472
 '5422f62c-f2af-4a4a-b85b-9181ea6dce7c'.'633' -3744
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.'220' 242
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.'459' 727
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.'422' 1265
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.'634' 9429
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.'411' 1384
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.'115' 1204
 '0b4046a3-b745-4e90-84ce-42d7a0edf666'.'633' 33960
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'220' 763
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'459' 3826
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'602' 32300
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'422' 6489
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'634' 65921
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'411' 4272
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'115' 234
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'603' 6464
 'c6dcf866-034b-4afc-9bc6-307a7023b932'.'633' 184740
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.'220' 458
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.'459' 1701
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.'422' 3438
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.'634' 23934
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.'411' 3469
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.'115' 3165
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.'603' 6777
 'f7862ca8-775b-4b4e-994f-6f45b396bee8'.'633' 94440
 '240d3cc7-9536-4949-b865-18490a91b456'.'220' 315
 '240d3cc7-9536-4949-b865-18490a91b456'.'459' 1579
 '240d3cc7-9536-4949-b865-18490a91b456'.'602' 13333
 '240d3cc7-9536-4949-b865-18490a91b456'.'422' 2678
 '240d3cc7-9536-4949-b865-18490a91b456'.'634' 9423
 '240d3cc7-9536-4949-b865-18490a91b456'.'115' 990
 '240d3cc7-9536-4949-b865-18490a91b456'.'603' 578
 '240d3cc7-9536-4949-b865-18490a91b456'.'633' 37183
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.'220' 487
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.'459' 1808
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.'422' 3654
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.'634' 25438
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.'411' 3687
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.'115' 3364
 '63f0ee7a-0114-4056-8efb-392f6802f0b6'.'633' 100375
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.'220' 128
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.'459' 894
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.'602' 8219
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.'422' 1657
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.'634' 5035
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.'115' 538
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.'603' 216
 '1dc08565-8c4c-44ce-8883-ca4b590fa13c'.'633' 22749
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.'220' 566
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.'459' 1700
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.'422' 2959
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.'634' 22055
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.'411' 3237
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.'115' 2815
 'bcb19871-d47c-4ea4-b017-2f35d0b2a3e2'.'633' 79438
 '371df927-d20f-44af-9c87-567115899fdd'.'220' 549
 '371df927-d20f-44af-9c87-567115899fdd'.'459' 2317
 '371df927-d20f-44af-9c87-567115899fdd'.'602' 18402
 '371df927-d20f-44af-9c87-567115899fdd'.'422' 3686
 '371df927-d20f-44af-9c87-567115899fdd'.'634' 14336
 '371df927-d20f-44af-9c87-567115899fdd'.'115' 1490
 '371df927-d20f-44af-9c87-567115899fdd'.'603' 1039
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.'220' 123
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.'459' 615
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.'602' 5195
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.'422' 1044
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.'634' 3672
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.'115' 386
 '86523d0b-c39c-4624-a9fd-03e6de2fe2a9'.'633' 14489
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.'220' 405
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.'459' 2032
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.'602' 17151
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.'422' 3445
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.'634' 12122
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.'115' 1274
 'a6622ab3-5a77-455c-863b-afee0468d9e0'.'603' 743
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.'220' 243
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.'459' 968
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.'602' 10266
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.'422' 1527
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.'634' 20952
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.'411' 1358
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.'603' 2054
 '32c66477-1794-4b0c-8bfc-3d63b71f01cb'.'633' 58716
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.'220' 279
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.'459' 837
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.'422' 1457
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.'634' 10862
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.'411' 1594
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.'115' 1387
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.'603' 2894
 '01b6f1d7-8047-4f1a-8a0b-2009db52b7fa'.'633' 39123
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'220' -55
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'459' 74
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'602' -282
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'422' -52
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'634' -783
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'411' -123
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'115' -74
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'603' -115
 '0a407165-56a4-468c-ad49-4d8a0a3eeec4'.'633' -913
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'220' -16
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'459' 20
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'602' -85
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'422' -16
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'634' -235
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'411' -37
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'115' -22
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'603' -35
 '3b85aaa4-7880-4de2-ab0a-8ff0200a9db2'.'633' -274
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'220' -854
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'459' 1053
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'602' -4399
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'422' -818
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'634' -12211
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'411' -1912
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'115' -1151
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'603' -1797
 '4a502543-3326-46bc-86ce-e4815e96e39d'.'633' -14244
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.'220' 333
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.'459' 1236
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.'422' 2497
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.'634' 17387
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.'411' 2520
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.'115' 2299
 'bc7347ba-deb3-434f-8b84-33285f02bf5f'.'633' 68604
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.'220' 415
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.'459' 1370
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.'422' 2572
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.'634' 18505
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.'411' 2699
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.'115' 2404
 '40a0093e-d9a4-426c-88fd-b2f56e65ed10'.'633' 69842
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'220' -2004
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'459' 2168
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'602' -10322
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'422' -1920
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'634' -28648
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'411' -4486
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'115' -2701
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'603' -4215
 '6b35c44b-81e0-4a5f-a4cb-d91d58d7af94'.'633' -33420
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'220' -307
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'459' 378
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'602' -1579
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'422' -294
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'634' -4383
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'411' -686
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'115' -413
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'603' -645
 '1ef80fa5-3b01-4540-8096-05e5dbc87994'.'633' -5113
 '77655842-96cf-4e50-9b08-a9ad8616de60'.'220' -691
 '77655842-96cf-4e50-9b08-a9ad8616de60'.'459' 2988
 '77655842-96cf-4e50-9b08-a9ad8616de60'.'602' 19858
 '77655842-96cf-4e50-9b08-a9ad8616de60'.'422' 4712
 '77655842-96cf-4e50-9b08-a9ad8616de60'.'411' 4189
 '77655842-96cf-4e50-9b08-a9ad8616de60'.'115' 2352
 '77655842-96cf-4e50-9b08-a9ad8616de60'.'603' 454
 '77655842-96cf-4e50-9b08-a9ad8616de60'.'633' 88330
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.'220' -115
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.'459' 2208
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.'602' 20324
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.'422' 1271
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.'634' 16546
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.'411' 2398
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.'115' 1738
 'ae1b2b6a-2903-487a-90c0-55135fc786b6'.'633' 65288
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'220' 213
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'459' 1903
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'602' 18323
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'422' 4258
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'634' 36516
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'411' 2034
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'115' 1496
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'603' 3398
 '3ffc5fd0-c40f-498c-bc5b-ee8c07a95957'.'633' 108000
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'220' -383
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'459' 566
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'602' -1974
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'422' -367
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'634' -5479
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'411' -858
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'115' -517
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'603' -806
 'b8ae13b4-af74-4569-92d9-93bfff522e7c'.'633' -6392
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.'220' 166
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.'459' 759
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.'602' 6225
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.'422' 1249
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.'634' 4614
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.'115' 482
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.'603' 308
 'bc311d55-2e85-40d0-b635-a5e34112c34a'.'633' 17414
 '6cd62235-8a0e-4c33-b867-08025d189429'.'220' -172
 '6cd62235-8a0e-4c33-b867-08025d189429'.'459' 80
 '6cd62235-8a0e-4c33-b867-08025d189429'.'422' 1809
 '6cd62235-8a0e-4c33-b867-08025d189429'.'634' 1684
 '6cd62235-8a0e-4c33-b867-08025d189429'.'411' 378
 '6cd62235-8a0e-4c33-b867-08025d189429'.'115' 309
 '6cd62235-8a0e-4c33-b867-08025d189429'.'603' 342
 '6cd62235-8a0e-4c33-b867-08025d189429'.'633' 13457
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'220' -1725
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'459' 2336
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'602' -8883
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'422' -1652
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'634' -24656
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'411' -3861
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'115' -2325
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'603' -3628
 '0dfd3432-793f-4223-9224-beac6fb0fd2f'.'633' -28763
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.'459' 443
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.'602' 8826
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.'422' 479
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.'634' 6238
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.'411' 1167
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.'115' 825
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.'603' 1766
 '830041d1-ede0-4fa3-9895-f49f17af9f20'.'633' 24614
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.'220' 50
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.'459' 186
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.'422' 375
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.'634' 2610
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.'411' 378
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.'115' 345
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.'603' 739
 '7e4ee834-2dc1-4dfa-8756-b2021b971676'.'633' 10299
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'220' 145
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'459' 1010
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'602' 9292
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'422' 2150
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'634' 18665
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'411' 1096
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'115' 795
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'603' 1768
 '9b2ad926-4826-44ff-9f11-265ef49ceeac'.'633' 54237
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'220' -142
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'459' 193
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'602' -733
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'422' -136
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'634' -2035
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'411' -319
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'115' -192
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'603' -299
 'bbf88677-bc94-4da5-9f7a-0fd8f51b79b3'.'633' -2374
/;

parameter p_laborReq(crops,halfMonths) /
 '220'.MRZ1 1.81
 '220'.MAI2 0.27
 '220'.AUG2 1.9
 '220'.SEP1 1
 '220'.SEP2 0.04
 '220'.OKT1 1.16
 '220'.OKT2 1.88
 '459'.MRZ1 2.15
 '459'.MRZ2 0.92
 '459'.MAI2 3.38
 '459'.JUN2 2.79
 '459'.JUL2 4.08
 '459'.AUG2 2.26
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
 '634'.MRZ2 4.23
 '634'.APR2 1.54
 '634'.MAI1 1.89
 '634'.MAI2 0.21
 '634'.JUN1 0.2
 '634'.JUL1 0.21
 '634'.AUG1 0.24
 '634'.SEP1 0.24
 '634'.SEP2 19.13
 '634'.OKT1 1.08
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
 '633'.APR1 30.98
 '633'.APR2 2.91
 '633'.MAI1 2.11
 '633'.MAI2 0.8
 '633'.JUN1 34.18
 '633'.JUL1 2.18
 '633'.AUG1 5.26
 '633'.AUG2 56.9
 '633'.SEP1 1.08
/;
