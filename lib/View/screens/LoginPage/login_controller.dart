import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  void changeIndex(int index) {
    _currentIndex.value = index;
  }
}
