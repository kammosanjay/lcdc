import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lcdc_mobile_app/View/screens/signupPage/signup_controller.dart';
import 'package:lcdc_mobile_app/constant/myshared_sharedprefrences.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/login.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/payment_modal.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/studentReqModal.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/student_threeStepFrom_request.dart';
import 'package:lcdc_mobile_app/resources/apiconstants/Repository/api_repository.dart';
import 'package:lcdc_mobile_app/resources/apiconstants/apiConstant.dart';
import 'package:flutter/material.dart';

class UserRepositories {
  static final ApiService apiService = ApiService();

  static Future<Map<String, dynamic>> login({LoginRequset? request}) async {
    var responseData = await apiService.postApi(
      ApiConstraints.loginApi,
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
  static Future<Map<String, dynamic>> studentdetailrepo(
    String currtoken,
  ) async {
    var response = await apiService.getData(
      ApiConstraints.studentInfo,
      token: currtoken,
    );

    return response;
  }

  ///
  /// Create Order
  ///
  static Future<Map<String, dynamic>> createOrderPayment(
    String currtoken,
  ) async {
    var response = await apiService.getData(
      ApiConstraints.paymentOrder,
      token: currtoken,
    );
    print("Testig 2" + response.toString());
    return response;
  }

  ///
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

  ///
  /// Resend OTP

  static Future<Map<String, dynamic>> resendOTP(String currtoken) async {
    var response = await apiService.getData(
      ApiConstraints.resendOTP,
      token: currtoken,
    );

    return response;
  }

  ///
  /// verify payment
  ///

  static Future<Map<String, dynamic>> verifyPayment({
    required VerifyPaymentModal verifyPayment,
    required String token,
  }) async {
    var response = await apiService.postApiOtp(
      ApiConstraints.verifyPayment,
      verifyPayment.toJson(),
      token: token,
      // studentmodal,
    );
    print(response.toString());

    return response;
  }

  ///
  ///
  ///dropdownfor UG

  static Future<Map<String, dynamic>> dropdownforUG({String? token}) async {
    var response = await apiService.getData(
      ApiConstraints.dropDownsforUg,
      token: token,
    );
    print("dropdownforUG Response==>$response");
    return response;
  }

  //
  //

  static Future<Map<String, dynamic>> submitApplicationForm({
    required String token,
    required StudentRegistrationModel requset,
  }) async {
    var response = await apiService.uploadDataWithImageHttp(
      requset.toJson(),
      token: token,
    );

    return response;
  }
}
