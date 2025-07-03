import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lcdc_mobile_app/View/screens/HomeScreen/application_form.dart';
import 'package:lcdc_mobile_app/constant/myshared_sharedprefrences.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/student_threeStepFrom_request.dart';

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
  final box = GetStorage();
  void saveFormToStorage(StudentRegistrationModel model) {
    box.write('formData', model.toJson());
  }

  Future<Map<String, dynamic>> submitForm({
    StudentRegistrationModel? studentform,
  }) async {
    var token = await SharedPrefsHelper.getToken();
    final response = await UserRepositories.submitApplicationForm(
      token: token!,
      requset: studentform!,
    );

    saveFormToStorage(studentform);
    print(box.read('formData'));

    // print("ctrl request== ${studentform.boardUniversity}");
    Fluttertoast.showToast(
      msg: response.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,

      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    Get.to(ApplicationFormPage(studentformdetail: studentform));
    return response;
  }
}
