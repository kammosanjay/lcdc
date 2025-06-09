import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:lcdc_mobile_app/modal/ResponseModal/courseType.dart';
import 'package:lcdc_mobile_app/modal/ResponseModal/login_res.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/login.dart';
import 'package:lcdc_mobile_app/resources/apiconstants/Repository/api_repository.dart';
import 'package:lcdc_mobile_app/resources/apiconstants/Repository/user_repositories.dart';
import 'package:lcdc_mobile_app/resources/apiconstants/apiConstant.dart';
import 'package:lcdc_mobile_app/resources/mypagenames/mypage_names.dart';

class LoginController extends GetxController {
  Dio dio = Dio();
  static final ApiService apiService = ApiService();
  var isLoading = false.obs;

  var jsonResponse = Login_response().obs;
 

  @override
  void onInit() {
    super.onInit();

    // getDropDown();

    // fetch();
  }

  Future<void> getDropDown() async {
    var response = await apiService.get("https://reqres.in/api/users");

    var data = jsonDecode(response.body);
    print(data);
  }

  // for login user

  Future<Login_response?> loginUser({LoginRequset? loginRequest}) async {
    isLoading.value = true;
    try {
      var response = await UserRepositories.login(request: loginRequest);
      debugPrint(response.toString());
      isLoading.value = false;
      Get.toNamed(MyPageNames.threeStepForm);
      jsonResponse.value = Login_response.fromJson(response);

      return jsonResponse.value;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> loadData() async {
    var response = await rootBundle.loadString('assets/data.json');
    debugPrint(response.toString());
  }

  Future<void> postres() async {
    final response = await http.post(
      Uri.parse(
        "http://10.0.2.2/flutter_api/login.php",
      ), // use 10.0.2.2 for Android emulator
      body: {'email': 'test@example.com', 'password': '123456'},
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
    }
  }
}
