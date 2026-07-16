'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "eebc091fa219a5b2fa3cd6f2f9f79d4d",
"assets/AssetManifest.bin.json": "6f79fca4eabaeb637f4b071a962f9b9e",
"assets/AssetManifest.json": "10c197432dcb6d3ac681ef6698118823",
"assets/assets/cv/Mohamed_Ibrahim_CV_v3.docx": "1c465ffa53513d3633f718b9a9c0a01c",
"assets/assets/cv/Mohamed_Ibrahim_CV_v3.pdf": "c140b1efeccbd05b4a8d65e5a8459790",
"assets/assets/cv/Mohamed_Ibrahim_Updated_CV.docx": "a52f4e9fc73bdeb520fca0606c2b8308",
"assets/assets/cv/Mohamed_Ibrahim_Updated_CV.pdf": "77635b2586ac71cf29e79a6ca7ca17f7",
"assets/assets/icons/favicon.png": "451e6d97d6ab3be018aa0bb690568104",
"assets/assets/icons/Icon-192.png": "a6ce3c092071ed67f116b24d9ab586c5",
"assets/assets/icons/Icon-512.png": "013587595dd840ee60a3952bb2f21c4e",
"assets/assets/images/og/og_cover.png": "7705f9d879867188d2407a8e04bd3606",
"assets/assets/images/placeholders/generic_placeholder.jpg": "3f9b3faf823820dd4d82e6b8be8a6f58",
"assets/assets/images/presentations/flutter_capability.webp": "f5efa8a521126424b7fd81ebe5abf2a5",
"assets/assets/images/profile/mohamed_ibrahim.jpg": "31784cdd3084c7d76920e31930cf2fb9",
"assets/assets/images/profile/mohamed_ibrahim_v3.jpg": "5c4ba83a3eb635e1e5d977111b3ea4cc",
"assets/assets/images/projects/a2h/01_operations_dashboard.webp": "8dffb2db42fc348517b0f2dd3c1c004f",
"assets/assets/images/projects/a2h/02_quick_invoice_menu.webp": "bb2f912826d80e40a4df242e7486a5fd",
"assets/assets/images/projects/a2h/03_sales_invoice.webp": "624e09dd62949e42d4a0a78fd6fc79c1",
"assets/assets/images/projects/a2h/04_sales_print_preview.webp": "3081820feec50add7e83e955129936cc",
"assets/assets/images/projects/a2h/05_purchase_invoice.webp": "632dbc2e1da5a3df366bf03017b0f885",
"assets/assets/images/projects/a2h/06_purchase_print_preview.webp": "a4c131dd595dc905e2bd4c9525a1098b",
"assets/assets/images/projects/ahla_beauty/01_desktop_home.webp": "1158d23fa265928a6fc1aa65800f9f28",
"assets/assets/images/projects/ahla_beauty/02_desktop_discovery.webp": "609612ab394efe8cf8c7679c5007c463",
"assets/assets/images/projects/ahla_beauty/03_desktop_categories.webp": "fd3cd7475a6dd22a3697816d3753d43d",
"assets/assets/images/projects/ahla_beauty/04_desktop_product_grid.webp": "e3d88d814c0dd23a72e61d3282b60cf1",
"assets/assets/images/projects/ahla_beauty/05_desktop_product_grid_alt.webp": "98b98a410dd2f71284057ff67e1901ec",
"assets/assets/images/projects/ahla_beauty/06_desktop_cart_summary.webp": "847ccce2401ca850ad638a57da0f38c9",
"assets/assets/images/projects/ahla_beauty/07_desktop_checkout.webp": "2523b32a53d944f18203ae2548476bfe",
"assets/assets/images/projects/ahla_beauty/08_desktop_product_details.webp": "11cddcd986bd914a799895bb4879ef37",
"assets/assets/images/projects/ahla_beauty/09_desktop_cart.webp": "3fcfa35dbb05f487c473d86a144755bd",
"assets/assets/images/projects/ahla_beauty/10_desktop_cart_alt.webp": "6093dd7636a6b9892f3b61624ab0cd77",
"assets/assets/images/projects/ahla_beauty/11_desktop_checkout_address.webp": "b8cf3d201e1626157a88eda59ab9af2e",
"assets/assets/images/projects/ahla_beauty/12_desktop_checkout_payment.webp": "33a7475dff13bddf5987116970bd59ec",
"assets/assets/images/projects/ahla_beauty/13_desktop_account_details.webp": "824028413f4b66f3f6dcf025dda8ad06",
"assets/assets/images/projects/ahla_beauty/14_desktop_orders.webp": "865cde31c7e4b95505b6f0b66c9d9203",
"assets/assets/images/projects/ahla_beauty/15_desktop_product_card.webp": "b7a5f4716885ad04f538b77e9618b04e",
"assets/assets/images/projects/ahla_beauty/16_desktop_store_profile.webp": "34268d26d881c0172283af41ab44fa63",
"assets/assets/images/projects/ahla_beauty/17_desktop_store_profile_alt.webp": "758e71572dedf8aa51462d5b5b4ccfa7",
"assets/assets/images/projects/ahla_beauty/18_desktop_collection.webp": "7778d4ddfdc45ea9c5627ec8673880b4",
"assets/assets/images/projects/ahla_beauty/19_desktop_product_details_alt.webp": "756a6be73799520c1a2971bdf02aa12b",
"assets/assets/images/projects/ahla_beauty/20_desktop_product_details_full.webp": "355107e9df234361abc82fac701e3801",
"assets/assets/images/projects/ahla_beauty/21_mobile_home.webp": "404f0491f306eff7365088e6f0dab320",
"assets/assets/images/projects/ahla_beauty/22_mobile_brand_story.webp": "e5e61a9f79c00a6c4ff2e749ae3f2a44",
"assets/assets/images/projects/ahla_beauty/23_mobile_product_details.webp": "391cba0179b35d186c2f99a085d329fa",
"assets/assets/images/projects/ahla_beauty/24_mobile_product_grid.webp": "2c4d5bc2d7c0cebce20405d3c857cd7a",
"assets/assets/images/projects/ahla_beauty/25_mobile_product_grid_alt.webp": "78693ea9d8f05fb9cc08a79cd9763356",
"assets/assets/images/projects/ahla_beauty/26_mobile_cart_summary.webp": "20ceb5c72a3baef64067fb9d44bed0ad",
"assets/assets/images/projects/ahla_beauty/27_mobile_checkout_form.webp": "8860cffe981cf46a42755c580e5ea4bc",
"assets/assets/images/projects/ahla_beauty/28_mobile_order_summary.webp": "18a80f8a5b084217ca58bffcf7950b73",
"assets/assets/images/projects/ahla_beauty/29_mobile_product_media.webp": "bf848174f1d6aa878941069f6f664799",
"assets/assets/images/projects/ahla_beauty/30_mobile_account.webp": "3c895a7b5698d9252f6249e5192c95bf",
"assets/assets/images/projects/ahla_beauty/31_mobile_checkout.webp": "43cbdb08b2b96266f1854b42f244887d",
"assets/assets/images/projects/ahla_beauty/32_mobile_cart.webp": "743cacb23f99a6abfb47950c5790a105",
"assets/assets/images/projects/ahla_beauty/33_mobile_order_confirmation.webp": "f661266ba65a0622da970c55d0e5ac7e",
"assets/assets/images/projects/ahla_beauty/34_mobile_price_summary.webp": "1fc5ba62f4a41b738914abdf51512813",
"assets/assets/images/projects/ahla_beauty/35_mobile_address.webp": "a8c8c387053dc640a342054e64e14138",
"assets/assets/images/projects/ahla_beauty/36_mobile_payment.webp": "422607389d9eb574d1322a1218923b04",
"assets/assets/images/projects/ahla_beauty/37_mobile_card_payment.webp": "7d6ac6661a7c065956f49bfb82227aa1",
"assets/assets/images/projects/ahla_beauty/38_mobile_success.webp": "2a6e656b5c6c0df03764aa4748fd2c01",
"assets/assets/images/projects/ahla_beauty/39_mobile_order_details.webp": "cb1388da9550e49f5101b46677856f27",
"assets/assets/images/projects/ahla_beauty/40_mobile_invoice.webp": "4d65c802b01c637ef52ec7b155ce5962",
"assets/assets/images/projects/ahla_beauty/41_mobile_order_tracking.webp": "1d27d72e0860e095b612fddd24f87ef6",
"assets/assets/images/projects/ahla_beauty/42_mobile_product_card.webp": "c21749623674d6c9c151469941941a76",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_01_v4.jpg": "00a002cda0dbce33e275d01e22b963fd",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_02_v4.jpg": "6969d0d559a5cd33e4c3bc33ec859b13",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_03_v4.jpg": "7da6e2e7224055064631c9f4913cc78b",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_04_v4.jpg": "ad8fda91b4905010ad96406a93b342a5",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_05_v4.jpg": "5be324e2cb821288da2153557a710d10",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_06_v4.jpg": "0db3139ffd2c525a250193043809ddf9",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_07_v4.jpg": "66fc1e7e8ae7c0921e881101db22cabc",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_08_v4.jpg": "4e70a3b7c0f4440c8c217b2e73cdcf4e",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_09_v4.jpg": "8ab12eae8cf236f8e99fa7ebb3b724e6",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_10_v4.jpg": "f93e556359f96459552629bf4656e5a4",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_11_v4.jpg": "4c494d85a30ca1bbc40d5b653046a762",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_12_v4.jpg": "e11e14378dfa80c67bf311ea7933e27f",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_13_v4.jpg": "033fbd23359a7bda773534682b09a01a",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_14_v4.jpg": "938d4a757177b475e0bdcd4b5e530542",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_15_v4.jpg": "e57e71bb1715bc4b1f0ee2dfbd95c8c2",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_16_v4.jpg": "d71b344cfddcb13c5fc48719513fa400",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_17_v4.jpg": "30e54f0ea4fa4f543c2616b1868b624b",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_18_v4.jpg": "aa2a59081a5737aac4651e64aadff101",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_19_v4.jpg": "0cb2449f446c7da61f2dbb10e555ce48",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_20_v4.jpg": "209933f8ec6129183de4dbe1363bc864",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_21_v4.jpg": "3664046db5728ad8b6fe82330ef51133",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_22_v4.jpg": "6980302a2b77f9d294a49b36befb3930",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_23_v4.jpg": "3c23cfaaf614a1c993e8b9c9f9e9d48f",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_24_v4.jpg": "b3d19b8e5ca02232aba0da9061c94a7d",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_25_v4.jpg": "05e7a77b99c8a0b610ba587dc33fc744",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_26_v4.jpg": "af1604cc2d67350333bf86a0d732046c",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_27_v4.jpg": "f03fff1bae8c30373fb72514eed54ddc",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_28_v4.jpg": "1ae39a727a3c7093f7b51bda692041ad",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_29_v4.jpg": "eb1e69c2e0b5e03e93d5d1e64591f661",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_30_v4.png": "366c1f59bf414fc5702ef975cb341496",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_31_v4.png": "8930fd81ee417886679acd6f1431c8c8",
"assets/assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_32_v4.png": "a4d8711b41f46e7e3155376ea1fba927",
"assets/assets/images/projects/cleany/01_home.webp": "f373a1f1abef49fe3e36fc56992a6768",
"assets/assets/images/projects/cleany/02_booking_flow.webp": "688a74fa7e2b47dadcc0c820b4c3bc5d",
"assets/assets/images/projects/cleany/03_add_location.webp": "84ce6abff57db363441840975436b485",
"assets/assets/images/projects/cleany/04_checkout.webp": "11aed65c46b2b4c80effb912f1c0e634",
"assets/assets/images/projects/cleany/05_profile_dark.webp": "a94423b8651bc9c7ef38a9948c29d408",
"assets/assets/images/projects/cleany/06_presentation_board.webp": "4bc8d5a0c8a8ed73b5cabd01ef8886bc",
"assets/assets/images/projects/dr_yasmeen_pharmacy/01_login.webp": "6f29c883244a0508914877a18852728d",
"assets/assets/images/projects/dr_yasmeen_pharmacy/02_home_light.webp": "fe0b04da15c3f285376eb0da2ed2b5b3",
"assets/assets/images/projects/dr_yasmeen_pharmacy/03_home_dark.webp": "f4ea2d94732ae7fba5dc4b26f11f3d83",
"assets/assets/images/projects/dr_yasmeen_pharmacy/04_offers_latest_light.webp": "58f95b71746b60d90e5338307501e3be",
"assets/assets/images/projects/dr_yasmeen_pharmacy/05_offers_latest_dark.webp": "6b430be892302912eae86fe8638bf39f",
"assets/assets/images/projects/dr_yasmeen_pharmacy/06_product_sections.webp": "67744d36dfa816ba42a44268cc85c416",
"assets/assets/images/projects/dr_yasmeen_pharmacy/07_search.webp": "ceabd3764b6b1d948526cd37d86ce237",
"assets/assets/images/projects/dr_yasmeen_pharmacy/08_wishlist.webp": "f2f586bd121eae5707773b5a8a7faa33",
"assets/assets/images/projects/dr_yasmeen_pharmacy/09_orders.webp": "dfeea0fc4846d1772a68d32fe479518a",
"assets/assets/images/projects/dr_yasmeen_pharmacy/10_profile_light.webp": "97fd6f2a7cf604f7107a215b10a1076b",
"assets/assets/images/projects/dr_yasmeen_pharmacy/11_profile_dark.webp": "7e15d139d39d5f975f6c95b78161289c",
"assets/assets/images/projects/dr_yasmeen_pharmacy/12_payment_method.webp": "27da1c489d3bda71d20c3dbd6a956d7c",
"assets/assets/images/projects/dr_yasmeen_pharmacy/13_account_settings.webp": "a14660f0e188901d0b68547f060f5d87",
"assets/assets/images/projects/dr_yasmeen_pharmacy/14_theme_language_settings.webp": "56bc6b1158ba05934f37649e6983f11c",
"assets/assets/images/projects/education/01_signup.webp": "d97cedb81ce17bc4d024e902a8e77482",
"assets/assets/images/projects/education/02_home.webp": "730199910d081809bc46e5eed4f63d45",
"assets/assets/images/projects/education/03_courses.webp": "0b78c4cad56d16397c35fc9ce958f477",
"assets/assets/images/projects/education/04_course_details.webp": "e05a7be5e0e349918928940acba7f073",
"assets/assets/images/projects/education/05_lesson_details.webp": "54f5f83a80d77e10076351779e8d53d8",
"assets/assets/images/projects/education/06_profile_rating.webp": "d8d1cabab5532928bfea76119bcb85d9",
"assets/assets/images/projects/education/07_presentation_board.webp": "2b5b1f5aebad0c28692419cb94e9cf85",
"assets/assets/images/projects/farah_services/01_splash.webp": "6572e6e911efd3b017c8afd9a545270a",
"assets/assets/images/projects/farah_services/02_welcome.webp": "15f050857daece9206fe9627e06e7ef8",
"assets/assets/images/projects/farah_services/03_home_light.webp": "663bf32afc35c51cd9dd22ca4f71dcea",
"assets/assets/images/projects/farah_services/04_home_dark.webp": "3e0f53340b3f098374e74a9cc55dcaf5",
"assets/assets/images/projects/farah_services/05_categories.webp": "eabe845bf8acf52905419d13a767147e",
"assets/assets/images/projects/farah_services/06_service_categories.webp": "86d3ef2dfe03bd2bda176ec412522ac5",
"assets/assets/images/projects/farah_services/07_service_details.webp": "8e1fbf840048669616a11996988a7181",
"assets/assets/images/projects/farah_services/08_favorites_light.webp": "1a2bc44e0014419ba634758d4566bac3",
"assets/assets/images/projects/farah_services/09_favorites_dark.webp": "7e718617d6992e642535dc1d761762f8",
"assets/assets/images/projects/farah_services/10_my_services.webp": "30f833a3a8b5361f03d6039fb3f0a43d",
"assets/assets/images/projects/farah_services/11_profile_light.webp": "ee8772b6f1f16313be33a2c7f978f359",
"assets/assets/images/projects/farah_services/12_profile_dark.webp": "f9709906ea465f8a9be979a125cbfda4",
"assets/assets/images/projects/farah_services/13_presentation_board.webp": "ed87bfefe6c86b9c7ddddfa27a7674dd",
"assets/assets/images/projects/fitness/01_dashboard.webp": "09a89709f199a331a963832a284e4cec",
"assets/assets/images/projects/fitness/02_discover.webp": "97c85fb9331aef5c0c17bcde7f85a338",
"assets/assets/images/projects/fitness/03_plans.webp": "d9d75b68fd893aba57f9e30b5b7089e7",
"assets/assets/images/projects/fitness/04_workout_routines.webp": "25c72ffb4b02bf208927a74d9af5624b",
"assets/assets/images/projects/fitness/05_recipes.webp": "6feac3f403ee9c9c521c4a918dd8fd33",
"assets/assets/images/projects/fitness/06_profile.webp": "3c5bfa8ab117d426c27abf93ea660a94",
"assets/assets/images/projects/fitness/07_presentation_board.webp": "6eed2baf9333bbf717ebb6ce167cf523",
"assets/assets/images/projects/game_zone/final_v3/01_inventory_management_v3.webp": "95f99c5fc04745eb934972b70fdb689f",
"assets/assets/images/projects/game_zone/final_v3/01_repair_job_details_v3.png": "9b7ee47cb5998781ad5977044f6cb840",
"assets/assets/images/projects/game_zone/final_v3/02_dashboard_qr_tracking_v3.png": "f8203f93214725d1527330fce4d2130b",
"assets/assets/images/projects/game_zone/final_v3/03_dashboard_barcode_tracking_v3.png": "01b8ffdf1f3831c3bd2a0aa4f1840b62",
"assets/assets/images/projects/game_zone/final_v3/04_inventory_management_v3.png": "073ba6d7a792f48fdabea00487ae58ba",
"assets/assets/images/projects/game_zone/final_v3/05_daily_reports_summary_v3.png": "19145550bb7ab9e01e16d0c9ff0445ba",
"assets/assets/images/projects/game_zone/final_v3/06_daily_reports_activity_v3.png": "12b20d9d0943609ec30ef2b6c4e24b7d",
"assets/assets/images/projects/game_zone/final_v3/07_public_tracking_overview_v3.png": "ea164d12ebd3a6c8ae3479a91a076d5d",
"assets/assets/images/projects/game_zone/final_v3/08_public_tracking_delivery_status_v3.png": "cac6a726883e6d362bd750828e1cf8d2",
"assets/assets/images/projects/game_zone/final_v3/09_public_tracking_timeline_v3.png": "bdd282a33965da2b9532247a25dae696",
"assets/assets/images/projects/game_zone/final_v3/10_delivery_confirmation_v3.png": "b0e6a2023f18978f0b0b78109356619a",
"assets/assets/images/projects/gypsum_home/01_desktop_home.webp": "cc1f7812fe952970e69099b91410a2fb",
"assets/assets/images/projects/gypsum_home/02_desktop_about.webp": "c80b3f8e262f075c8c054dd1a5988bac",
"assets/assets/images/projects/gypsum_home/03_desktop_contact.webp": "f120a26ac60da41ce527f3fffe8c8018",
"assets/assets/images/projects/gypsum_home/04_desktop_projects.webp": "22529c643c6fa8f752e332f811d3c010",
"assets/assets/images/projects/gypsum_home/05_desktop_team.webp": "e9f3ed81ab5efb7d9bfca03cfd509e4f",
"assets/assets/images/projects/gypsum_home/06_desktop_services.webp": "163b1e75125149aad9e3600f1ddced69",
"assets/assets/images/projects/gypsum_home/07_desktop_process.webp": "345924868a7f02d9cba5634ac5e1db39",
"assets/assets/images/projects/gypsum_home/08_desktop_process_alt.webp": "3f886b43c03b21f26b0d639d46201d8f",
"assets/assets/images/projects/gypsum_home/09_desktop_benefits.webp": "e34f3f3bd1800b30d5b40db88905a7de",
"assets/assets/images/projects/gypsum_home/10_desktop_faq.webp": "e9a1117e65237679389d84236391598f",
"assets/assets/images/projects/gypsum_home/11_desktop_cta.webp": "568b695a6dc06e69db4a9b401c2188d0",
"assets/assets/images/projects/gypsum_home/12_desktop_footer.webp": "b8a5afc96166cd97f9427fd15f48cd9e",
"assets/assets/images/projects/gypsum_home/13_mobile_home.webp": "641350bf4f311295fd31ee22f225d7cc",
"assets/assets/images/projects/gypsum_home/14_mobile_services_summary.webp": "e8b45aa594dd3ff781ad8500f143460c",
"assets/assets/images/projects/gypsum_home/15_mobile_navigation.webp": "4e995086460aa4c66b64b58ca1a962d5",
"assets/assets/images/projects/gypsum_home/16_mobile_contact.webp": "a9adab88d02f6715e01214481671d5d4",
"assets/assets/images/projects/gypsum_home/17_mobile_about.webp": "495aa2d47d62aa2a1de657e65c07aa99",
"assets/assets/images/projects/gypsum_home/18_mobile_notice.webp": "deb9a8fad6b984e7406df16e0238ec6d",
"assets/assets/images/projects/gypsum_home/19_mobile_projects.webp": "633da475cf9906eb0513ff5bbeb5d79d",
"assets/assets/images/projects/gypsum_home/20_mobile_team.webp": "e88f041bc430d492522a6d43f46372c9",
"assets/assets/images/projects/gypsum_home/21_mobile_services.webp": "14dc1fc6882e6bfee4e135fb49f9c14c",
"assets/assets/images/projects/gypsum_home/22_mobile_process.webp": "e23877d0a331f7c2924f7c588f2f9617",
"assets/assets/images/projects/gypsum_home/23_mobile_process_detail.webp": "a9e29bdf13820fa89779eeb2b53e6677",
"assets/assets/images/projects/gypsum_home/24_mobile_benefits.webp": "59780d4b491210b407f0344d9212d1e8",
"assets/assets/images/projects/gypsum_home/25_mobile_faq.webp": "801703539fe5cb7fc48a5cdd69f95e84",
"assets/assets/images/projects/gypsum_home/26_mobile_faq_alt.webp": "6c3fcb24e6855783419161013a1171b3",
"assets/assets/images/projects/gypsum_home/27_mobile_cta.webp": "d26d211f03bfaee4c716fad605dc79b6",
"assets/assets/images/projects/gypsum_home/28_mobile_footer.webp": "9fdecbe97aaf4a822c105407a7ebd5d4",
"assets/assets/images/projects/kanzoon/01_welcome.webp": "036b3cc8d2657fe038f44df0cfd6ff74",
"assets/assets/images/projects/kanzoon/02_role_selection.webp": "28cc261ad94d8f5bfe944aafefba5b60",
"assets/assets/images/projects/kanzoon/03_role_selection_filled.webp": "3e39c00c0a08187a0879f3c7994830ff",
"assets/assets/images/projects/kanzoon/04_signup.webp": "2bc72f5af5cb430d0b0a9adb8a9d79e5",
"assets/assets/images/projects/kanzoon/05_dashboard.webp": "f409dcec67831cc1b3614b41661175a7",
"assets/assets/images/projects/kanzoon/06_saving_goal.webp": "fbbfb433dd6c1336a9d575af65220ab5",
"assets/assets/images/projects/kanzoon/07_create_family.webp": "ea884ffe2f9965571baae826c30ec7c7",
"assets/assets/images/projects/kanzoon/08_settings.webp": "f65237378ec23afe207cfcd959268dff",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_01_v4.jpg": "733dca8523b32cc950465f3c4cfd18a8",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_02_v4.jpg": "7be69cf30614e04942a12f5caa4a04f3",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_03_v4.jpg": "fa1aa53f1b0dc76d4f2e84bbe38954f4",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_04_v4.jpg": "5b4507d71fa48d30a954133c7d898276",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_05_v4.jpg": "ebf0c9c48acf1c09d93080bd4ec93e13",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_06_v4.jpg": "d4faa58549e04ecbba983113757890c0",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_07_v4.jpg": "225fb0ea157333fd4ac99f265d4ff1ff",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_08_v4.jpg": "9e0b0a1ddc590a026645624515d4aef3",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_09_v4.jpg": "2782c72e26d971bde8336e51b2aa0b58",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_10_v4.jpg": "d7c3947f2d3b6a4eb570418b5c9b9dd2",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_11_v4.jpg": "0a42302cd3ce4f8eb9cc750fe665eedc",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_12_v4.jpg": "a79a68a341acfb2527474640934ac153",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_13_v4.jpg": "f313bfa1b1308a20383645feb8b914be",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_14_v4.jpg": "5242a78e6d52eea8ce0abb2874ad7da5",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_15_v4.jpg": "048dcadfbf3843a0eab8958df297b2fd",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_16_v4.jpg": "8cce75206f8a948af1efa0fdc546a622",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_17_v4.jpg": "7871e4849bf2bae23b70cfed303aac0c",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_18_v4.jpg": "ea39b66f6a3289fdfa4bb1a4f8843756",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_19_v4.jpg": "69b551b62b5468e4b27333bbd287408f",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_20_v4.jpg": "7fe94e50dee84739b2bf8a1f8cbcd521",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_21_v4.jpg": "5bcb77ae9319e2b53f4343292495ab4f",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_22_v4.jpg": "869d2419cd32ebb7c6a850976c83db12",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_23_v4.jpg": "063ce44102f9e4f38e8d400642d6a988",
"assets/assets/images/projects/noga_mobile/authoritative_v4/noga_24_v4.jpg": "e3f52d2d6d13639726ccb8e6c6a51db6",
"assets/assets/images/projects/recast/01_home.webp": "c60754e39c018a52c589c9c96bfd705a",
"assets/assets/images/projects/recast/02_menu.webp": "3c2d1fc861f6fb2142908f14aeb67f6a",
"assets/assets/images/projects/recast/03_food_details.webp": "6eb99320d2bff513495a8fd822ad49d8",
"assets/assets/images/projects/recast/04_exit_dialog.webp": "3f70a3291c646daf270d9472d1a6dba2",
"assets/assets/images/projects/rusheta/01_new_patient.webp": "3f46d35ecc121ed2d30d6576ead28e58",
"assets/assets/images/projects/rusheta/02_prescription_form.webp": "d0d0ee9c8ad75a5588fc16f4276fda8b",
"assets/assets/images/projects/rusheta/03_medicine_items.webp": "af03c62250397a378d8e3f3dda04a5d1",
"assets/assets/images/projects/rusheta/04_patient_details.webp": "efa538184ab00e018acb2c0747530890",
"assets/assets/images/projects/rusheta/05_records_overview.webp": "bf24c4b06270ca4d06b91915f4c9b0e5",
"assets/assets/images/projects/rusheta/06_records_overview_alt.webp": "2881c45abb2d1ab716baebb5a2d12fc5",
"assets/assets/images/projects/rusheta/07_dark_records.webp": "1d5a8c605a0546f4757251176b95f6a3",
"assets/assets/images/projects/rusheta/08_print_preview.webp": "4ca161b53a368f724d5d85eb489f9e4d",
"assets/assets/images/projects/rusheta/09_pdf_output.webp": "d6a91fc8e1887ac22b6cba9e0568e383",
"assets/assets/images/projects/rusheta/10_prescription_report.webp": "7768ecdc4b3a9f7d3dc742d260e9f9a2",
"assets/assets/images/projects/sharks_academy/01_splash.webp": "1cb952afe2f6a5541b5a8273cfc0c377",
"assets/assets/images/projects/sharks_academy/02_onboarding_welcome.webp": "66db07f1b50c8646d18ae22d742aa34e",
"assets/assets/images/projects/sharks_academy/03_onboarding_courses.webp": "c2e58084e3538c3b85cc099659bb6b90",
"assets/assets/images/projects/sharks_academy/04_onboarding_exams.webp": "111f66b13974763cba3f8d9f65938f5c",
"assets/assets/images/projects/sharks_academy/05_login.webp": "33738f98f8ee10dfb877d7ef43e7784f",
"assets/assets/images/projects/sharks_academy/06_register.webp": "dce674dd0e247822bd9505d78f79b237",
"assets/assets/images/projects/sharks_academy/07_home.webp": "ceeaf9349c764f07cf7e0114cd521192",
"assets/assets/images/projects/sharks_academy/08_course_categories.webp": "22620519cb0fe28e50030e4ef9222765",
"assets/assets/images/projects/sharks_academy/09_course_catalog.webp": "e78f0f41da642e9afa0ab43cbede6ff4",
"assets/assets/images/projects/sharks_academy/10_course_details.webp": "5829094d66d3b218f99922d8aff2081f",
"assets/assets/images/projects/sharks_academy/11_learning_content.webp": "4719c2c4be8a2b9acde558a803e64631",
"assets/assets/images/projects/sharks_academy/12_exam_catalog.webp": "cec4380605bc0367a1ceb77f90a5916e",
"assets/assets/images/projects/sharks_academy/13_exam_search.webp": "9aa1fb5ac8d451cb1ad4057140dc3f92",
"assets/assets/images/projects/sharks_academy/14_exam_selection.webp": "aa0ddff407f76b9e6189bea7e7408e20",
"assets/assets/images/projects/sharks_academy/15_exam_schedule.webp": "27e4eb682d52a57926d722b266c37cbf",
"assets/assets/images/projects/sharks_academy/16_exam_list.webp": "c9fcc8be7273eeeb4130cbd544478dab",
"assets/assets/images/projects/sharks_academy/17_exam_question.webp": "22a59bebc7758e28305be4ed93c5427c",
"assets/assets/images/projects/sharks_academy/18_exam_result.webp": "66d27c38a10436a3ab774e0bb13b7315",
"assets/assets/images/projects/sharks_academy/19_student_profile.webp": "8cb4f5a50ca37ad054e4d4fac0480c80",
"assets/assets/images/projects/sharks_academy/20_profile_details.webp": "170495e3e789f2f299cbe7d3c6c014b8",
"assets/assets/images/projects/sharks_academy/21_settings_language.webp": "74dc60ed328f7303d5296223a53641bd",
"assets/assets/images/projects/sharks_academy/22_loading_state.webp": "28ab47da72a0d360c26d7c8c822d9305",
"assets/assets/images/projects/sharks_academy/23_electronic_receipt.webp": "a32b0fe0225aba25f534b7f573afe0b9",
"assets/assets/images/projects/sharks_academy/24_receipt_preview.webp": "d312481bda71461bbe91164f3cab7cac",
"assets/assets/images/projects/sharks_academy/25_presentation_board.webp": "d79a7e6037ba30b411f415fdbf46a833",
"assets/assets/images/projects/shop_smart/01_workflow_board.webp": "8dd77ee2f853bb349baff1840477c6d0",
"assets/assets/images/projects/shop_smart/02_cover_board.webp": "eb599e39d130c328076d88c92a5b322e",
"assets/assets/images/projects/targetx/01_home_catalog.webp": "85a4b9cf6c61148f7e426a9472cfbcf3",
"assets/assets/images/projects/targetx/02_offers_overview.webp": "dd459cc260f7cdb1576c102e1ddc4778",
"assets/assets/images/projects/targetx/03_offers_coupons.webp": "feba9f87875c0941cbb7ee0250465b64",
"assets/assets/images/projects/targetx/04_favorites.webp": "8b76c07a96b0c2a93d4983e9a9253abd",
"assets/assets/images/projects/targetx/05_cart.webp": "f0c77822f3a6f5a2a4e5566e3161cd5f",
"assets/assets/images/projects/targetx/06_product_details.webp": "91b97a7c4bd5b32828cccef09876811b",
"assets/assets/images/projects/targetx/07_related_products.webp": "c7c001a7d6fe892d112d3a287fb84ccc",
"assets/assets/images/projects/targetx/08_clothes_category.webp": "c508884856c494302a665fbc8aa96372",
"assets/assets/images/projects/targetx/09_phones_category.webp": "ec27bb3a936ce2f32ac7de33fe6e0921",
"assets/assets/images/projects/targetx/10_offers_list.webp": "480924d42c17a7d10037b922c1c51a06",
"assets/assets/images/projects/targetx/11_secure_checkout.webp": "4fc23e54e2090fc456dab1cb1f7eaddb",
"assets/assets/images/projects/targetx/12_profile.webp": "8452ea35dd5bc26376776f3b9af35512",
"assets/assets/images/projects/targetx/13_settings.webp": "b28fc27ea75a87d6dfed2d2362f79505",
"assets/assets/images/projects/trelixi/01_splash.webp": "46801707816b17ea6e7be34f91a79ecd",
"assets/assets/images/projects/trelixi/02_choose_profile.webp": "f65b372779b6c8c4ce57e3294afbdd26",
"assets/assets/images/projects/trelixi/03_profile_choice.webp": "5cdd5bfe02976cca85a273f35df5a90e",
"assets/assets/images/projects/trelixi/04_login.webp": "338ad81065ebba68df38d32bb598a09a",
"assets/assets/images/projects/trelixi/05_story_library.webp": "7e03b8dbb063e18641f1a7c204c6c549",
"assets/assets/images/projects/trelixi/06_level_intro.webp": "317a4ef41f49426c653e16ee55dda44e",
"assets/assets/images/projects/trelixi/07_root_family_activity.webp": "357cb72504bbc23d3770d73a82ddee85",
"assets/assets/images/projects/trelixi/08_success_dialog.webp": "dd014f68e832c3c80aa74216de1e3341",
"assets/assets/images/projects/trelixi/09_root_awareness_intro.webp": "6346cb449483968c0f5aed3fc41be6d8",
"assets/assets/images/projects/trelixi/10_matching_grid.webp": "c1c2fb2c94450cc5a47f6ce0a71173b7",
"assets/assets/images/projects/trelixi/11_activity_intro.webp": "af3ed5a4ca57e8cd793277eaacd0e9d8",
"assets/assets/images/projects/trelixi/12_word_matching.webp": "8e20976737dbc2d0df774cac83e6d704",
"assets/assets/images/projects/trelixi/13_drag_connections.webp": "72a864def973a8e57c95606e4ac57517",
"assets/assets/images/projects/trelixi/14_instruction.webp": "5f2fe7eb2e7f8f9a6e2699187519b61d",
"assets/assets/images/projects/trelixi/15_word_choices.webp": "d3a408387a855d3554b00df5557e822d",
"assets/assets/images/projects/trelixi/16_story_categories.webp": "2195426bcf89d68f3e2c20b1de427a22",
"assets/assets/images/projects/trelixi/17_morphology_intro.webp": "9be5917a7969cacb22ad56e21d0d420f",
"assets/assets/images/projects/trelixi/18_word_usage.webp": "05911dfbc10a3c8c1a699a10830af2f8",
"assets/assets/images/projects/trelixi/19_story_usage.webp": "a30cdea74a372f6f3d325d590332cc8d",
"assets/assets/images/projects/trelixi/20_activity_table.webp": "ceeca1c5c9da7815e8d726b61588dd46",
"assets/assets/videos/al_raqi_mobile_showcase_v3.mp4": "a97b9b536c69be1b565f8f472d404c72",
"assets/assets/videos/noga_mobile_showcase_v3.mp4": "60842b67c2ca08e597778717a6080a49",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "c52e366a0b34ea5e984a678adaf8423b",
"assets/NOTICES": "de7acc2951420f3fac59c5e667958255",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.ico": "d58f329f85674b2b801ea326d142c896",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "6294ecca526b2d5a22856002375761d1",
"index.html": "6254f80822f40bcf97344aee56e22d6e",
"/": "6254f80822f40bcf97344aee56e22d6e",
"main.dart.js": "0fb51e78c0dab86362a74adca12a3aff",
"manifest.json": "91d3f282f666377a78713aa78626ae16",
"version.json": "eea9fa20190e49faf2f79b56fc686e08"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
