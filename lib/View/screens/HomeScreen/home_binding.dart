
import 'package:get/get.dart';
import 'package:lcdc_mobile_app/View/screens/HomeScreen/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
