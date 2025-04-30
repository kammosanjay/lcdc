

import 'package:get/get.dart';
import 'package:lcdc_mobile_app/View/screens/forgotpage/forgot_controller.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotController>(() => ForgotController());
  }
}
