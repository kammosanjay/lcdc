
import 'package:get/get.dart';
import 'package:lcdc_mobile_app/View/splashpage/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    /// splashController
    Get.lazyPut<SplashController>(() => SplashController());

    ///
  }
}
