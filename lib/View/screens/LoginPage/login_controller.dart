import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:lcdc_mobile_app/View/screens/FeePayment/payment_page.dart';
import 'package:lcdc_mobile_app/View/screens/HomeScreen/new_home_screen.dart';
import 'package:lcdc_mobile_app/View/screens/Otp/otpPage.dart';
import 'package:lcdc_mobile_app/View/screens/signupPage/signup_controller.dart';
import 'package:lcdc_mobile_app/constant/myshared_sharedprefrences.dart';
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
  SignupController signupController = Get.find<SignupController>();

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

      await SharedPrefsHelper.saveToken(token: response['token']);
      String? token = await SharedPrefsHelper.getToken();
      print('token is :[$token]');
      //
      await signupController.studentDetailInfo();
      //
      //check otp_verified
      //
      var otpVerifiedCheck = signupController.studentDetails.value;
      var feeStatus = signupController.studentDetails.value;
      if (otpVerifiedCheck.otpVerified == '0' ||
          otpVerifiedCheck.otpVerified == "null" ||
          otpVerifiedCheck.otpVerified == null) {
        Fluttertoast.showToast(
          msg: "OTP not Verified. Please Verify",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,

          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Future.delayed(Duration(seconds: 3), () async {
          Get.to(OTPScreen());
          await signupController.resendOtp();
        });
      } else if (feeStatus.status == "inactive") {
        Fluttertoast.showToast(
          msg: "Payment Incomplete, Please Complete !!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,

          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Future.delayed(Duration(seconds: 3), () {
          Get.to(RegistrationDetailsPage());
        });
      } else {
        Get.toNamed(MyPageNames.threeStepForm);
      }

      jsonResponse.value = Login_response.fromJson(response);

      return jsonResponse.value;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  /// this is the way to call the json file from project assets locally
  ///Example

  Future<void> loadData() async {
    var response = await rootBundle.loadString('assets/data.json');
    debugPrint(response.toString());
  }
}
