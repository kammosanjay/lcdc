import 'package:get/get.dart';
import 'package:lcdc_mobile_app/View/screens/signupPage/signup_controller.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/login.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/studentReqModal.dart';
import 'package:lcdc_mobile_app/resources/apiconstants/Repository/api_repository.dart';
import 'package:lcdc_mobile_app/resources/apiconstants/apiConstant.dart';
import 'package:flutter/material.dart';

class UserRepositories {
  static final ApiService apiService = ApiService();

  static Future<Map<String, dynamic>> login({LoginRequset? request}) async {
    var responseData = await apiService.post(
      ApiConstraints.BASE_URL,
      request!.toJson(),
    );

    return responseData;
    // parse and return model
  }

  // courseType

  static Future<Map<String, dynamic>> courseType() async {
    var response = await apiService.getData(ApiConstraints.courseType);
    print("CourseType Response==>$response");
    return response;
  }
  //
  //

  //studentForm
  //
  static Future<Map<String, dynamic>> studentForm({
    required StudentRequestModal studentModal,
  }) async {
    var response = await apiService.postApi(
      ApiConstraints.studentRegFrom,
      studentModal.toJson(),
      // studentmodal,
    );

    return response;
  }
  //
  //

  //if UG selected
  static Future<Map<String, dynamic>> fetcheUGSelected() async {
    var response = await apiService.getData(ApiConstraints.ugSelected);

    return response;
  }

  ///
  ///
  static Future<Map<String, dynamic>> fetcheOtp({
    required String currOtp,
    required String? token,
  }) async {
    var response = await apiService.postApiOtp(
      ApiConstraints.getOtp,
      {'otp_no': currOtp},
      token: token, // passing token in header
    );
    return response;
  }
}
