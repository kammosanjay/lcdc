import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:lcdc_mobile_app/View/splashpage/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      backgroundColor: Color(0xFFD2093C),
      body: Center(
        child:Image.asset("assets/images/lcdc_logo.png",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
