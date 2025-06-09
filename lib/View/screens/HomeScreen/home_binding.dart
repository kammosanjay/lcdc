
import 'package:get/get.dart';

import 'package:lcdc_mobile_app/View/screens/HomeScreen/new_home_screen.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThreeStepForm>(() => ThreeStepForm());
  }
}
