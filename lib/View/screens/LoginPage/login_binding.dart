
import 'package:get/get.dart';
import 'package:lcdc_mobile_app/View/screens/LoginPage/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
