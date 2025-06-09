import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lcdc_mobile_app/View/screens/FeePayment/payment_page.dart';
import 'package:lcdc_mobile_app/View/screens/Otp/otpPage.dart';
import 'package:lcdc_mobile_app/constant/myshared_sharedprefrences.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/studentReqModal.dart';
import 'package:flutter/material.dart';
import 'package:lcdc_mobile_app/resources/apiconstants/Repository/user_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupController extends GetxController {
  ///
  // var courseType = CourseType().obs;
  var courseType = [].obs;
  var course = [].obs;
  var gender = [].obs;
  var category = [].obs;
  var messages = "".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ifUgSelected();
    courseTypeList();
  }

  ///
  ///  COURSE TYPE
  ///
  Future<Map<String, dynamic>> courseTypeList() async {
    final response = await UserRepositories.courseType();

    // courseType.value = CourseType.fromJson(response);
    Map<String, dynamic> allType = response;
    courseType.value = response['data']['edu_course_type'] as List;

    return allType;
  }

  ///
  /// STUDENT REGISTRATION FORM
  ///
  Future<Map<String, dynamic>> studentRegistrationForm({
    StudentRequestModal? studentReq,
  }) async {
    isLoading.value = true;

    final response = await UserRepositories.studentForm(
      studentModal: studentReq!,
    );

    isLoading.value = false;
    debugPrint("All Responses==>" + response.toString());
    // Handle success response (status 201)
    if (response['status'] == 201) {
      var newUserToken = response['token'];
      await SharedPrefsHelper.saveToken(token: newUserToken);

      messages.value = response['messages'];

      // Show success message
      Fluttertoast.showToast(
        msg: messages.value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,

        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      // Navigate after delay
      Future.delayed(Duration(seconds: 2), () {
        Get.to(OTPScreen(), arguments: studentReq);
      });
    }
    // Handle error response (status 400 or others)
    else if (response['status'] == false) {
      var errorMap = response['message'];
      messages.value = errorMap.toString();

      // Display each field-specific error
      if (errorMap is Map) {
        errorMap.forEach((key, value) {
          Get.snackbar(
            "Message",
            "$key: $value",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
      } else {
        Fluttertoast.showToast(
          msg: messages.value,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,

          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }

    return response;
  }
  //
  // all data of ug type
  //

  Future<Map<String, dynamic>> ifUgSelected() async {
    final response = await UserRepositories.fetcheUGSelected();

    // courseType.value = CourseType.fromJson(response);
    Map<String, dynamic> allres = response;
    print("REs======>" + allres.toString());
    gender.value = response['data']['gender'] as List;
    category.value = response['data']['category'] as List;
    course.value = response['data']['course'] as List;

    print("Gender==>$gender\n Category==>$category\n Course==>$course");

    return allres;
  }

  ///
  ///  OTP VERIFICATION PROCESS
  ///

  Future<Map<String, dynamic>> otpVerification({required String otp}) async {
    isLoading.value = true;
    var tokenMap = await SharedPrefsHelper.getToken();
    print('verific get token : $tokenMap');
    String? savedToken = tokenMap;

    final res = await UserRepositories.fetcheOtp(
      currOtp: otp,
      token: savedToken,
    );
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });
    if (res['status'] == 200) {
      messages.value = res['message'];
      Fluttertoast.showToast(
        msg: messages.value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,

        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // Future.delayed(Duration(seconds: 3), () {
      //   Get.to(RegistrationDetailsPage(),);
      // });
    } else if (res['status'] == 400 || res['status'] == 401) {
      messages.value = res['message'];
      Fluttertoast.showToast(
        msg: messages.value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,

        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    print("OTP Response => $res");
    return res;
  }
}
