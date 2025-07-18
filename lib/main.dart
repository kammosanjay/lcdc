import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:lcdc_mobile_app/View/screens/signupPage/signup_binding.dart';

import 'package:lcdc_mobile_app/resources/mypagenames/mypage_names.dart';
import 'package:lcdc_mobile_app/resources/myroutes/myroutes_pages.dart';

void main() async {
  await GetStorage.init();
  // await GetStorage().erase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: MyPageNames.splash,
      getPages: MyRoutesNames.pages,
      initialBinding: SignupBinding(),

      // home: OTPScreen(),
    );
  }
}
