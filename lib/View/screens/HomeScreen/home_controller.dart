import 'package:get/get.dart';
import 'package:lcdc_mobile_app/constant/myshared_sharedprefrences.dart';

import '../../../resources/apiconstants/Repository/user_repositories.dart';

class HomeController extends GetxController {
  ///
  ///
  var occupation = [].obs;
  var motheroccupation = [].obs;
  var bloodgroup = [].obs;
  var religion = [].obs;
  var caste = [].obs;
  var passingyear = [].obs;

  @override
  void onInit() {
    super.onInit();

    getdropdownforUG();
  }

  ///
  ///
  ///
  Future<Map<String, dynamic>> getdropdownforUG() async {
    var token = await SharedPrefsHelper.getToken();
    final response = await UserRepositories.dropdownforUG(token: token);

    // courseType.value = CourseType.fromJson(response);
    Map<String, dynamic> allres = response;

    occupation.value = response['data']['occupation'] as List;
    motheroccupation.value = response['data']['motheroccupation'] as List;
    bloodgroup.value = response['data']['bloodgroup'] as List;
    religion.value = response['data']['religion'] as List;
    caste.value = response['data']['caste'] as List;
    passingyear.value = response['data']['passingyear'] as List;
    print(
      "bloodGroup==> $bloodgroup\nOccupation==>$occupation\n motherOc===>$motheroccupation\n reli===>$religion\n caste===> $caste\n passingyear==>$passingyear",
    );

    return allres;
  }

  ///
  ///
  ///
}
