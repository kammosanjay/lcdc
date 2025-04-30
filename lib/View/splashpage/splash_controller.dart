
import 'package:get/get.dart';
import 'package:lcdc_mobile_app/resources/mypagenames/mypage_names.dart';

class SplashController extends GetxController {
  ///
  ///
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(MyPageNames.login);
    });
    super.onInit();
  }
}
