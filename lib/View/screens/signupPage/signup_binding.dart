
import 'package:get/get.dart';
import 'package:lcdc_mobile_app/View/screens/signupPage/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
