import 'package:get/get.dart';
import 'package:lcdc_mobile_app/View/screens/FeePayment/payment_page.dart';
import 'package:lcdc_mobile_app/View/screens/Otp/otpPage.dart';
import 'package:lcdc_mobile_app/constant/myshared_sharedprefrences.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/payment_modal.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/studentReqModal.dart';
import 'package:flutter/material.dart';
import 'package:lcdc_mobile_app/modal/ResponseModal/create_order.dart';
import 'package:lcdc_mobile_app/modal/ResponseModal/student_detail_info.dart';
import 'package:lcdc_mobile_app/resources/apiconstants/Repository/user_repositories.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupController extends GetxController {
  ///
  // var courseType = CourseType().obs;
  var courseType = [].obs;
  var ugCourse = [].obs;
  var pgCourse = [].obs;
  var bpedCourse = [].obs;
  var gender = [].obs;
  var category = [].obs;
  var messages = "".obs;
  var studentRegNo = ''.obs;
  var isLoading = false.obs;
  Rx<StudentDetailsInfo> studentDetails = StudentDetailsInfo().obs;
  RxBool isProcessing = false.obs;
  RxString paymentStatus = 'InActive'.obs;
  Rx<CreateOrder> paymentOrder = CreateOrder().obs;

  @override
  void onInit() {
    super.onInit();
    courseTypeList();
    ifUgSelected();
    ifPgSelected();
    ifBPEDSelected();
  }

  ///
  ///  COURSE TYPE
  ///
  Future<Map<String, dynamic>> courseTypeList() async {
    final response = await UserRepositories.courseType();

    // courseType.value = CourseType.fromJson(response);
    Map<String, dynamic> allType = response;
    courseType.value = response['data']['edu_course_type'] as List;
    print("CourseType==>$courseType");

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
        Get.to(OTPScreen());
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
    ugCourse.value = response['data']['course'] as List;

    print("Gender==>$gender\n Category==>$category\n Course==>$ugCourse");

    return allres;
  }

  ///
  /// for PG
  Future<Map<String, dynamic>> ifPgSelected() async {
    final response = await UserRepositories.fetchePGSelected();

    // courseType.value = CourseType.fromJson(response);
    Map<String, dynamic> allres = response;
    print("REs======>" + allres.toString());
    gender.value = response['data']['gender'] as List;
    category.value = response['data']['category'] as List;
    pgCourse.value = response['data']['course'] as List;

    print("Gender==>$gender\n Category==>$category\n Course==>$pgCourse");

    return allres;
  }

  ///for bped
  ///
  ///
  Future<Map<String, dynamic>> ifBPEDSelected() async {
    final response = await UserRepositories.fetcheBPEDSelected();

    // courseType.value = CourseType.fromJson(response);
    Map<String, dynamic> allres = response;
    print("REs======>" + allres.toString());
    gender.value = response['data']['gender'] as List;
    category.value = response['data']['category'] as List;
    bpedCourse.value = response['data']['course'] as List;

    print("Gender==>$gender\n Category==>$category\n Course==>$bpedCourse");

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

        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Future.delayed(Duration(seconds: 3), () {
        Get.to(RegistrationDetailsPage());
      });
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

  ///
  /// Student Detail Information
  ///

  Future<StudentDetailsInfo> studentDetailInfo() async {
    var tokenMap = await SharedPrefsHelper.getToken();
    final response = await UserRepositories.studentdetailrepo(tokenMap!);

    if (response.isNotEmpty && response['status'] == 200) {
      studentDetails.value = StudentDetailsInfo.fromJson(response['data']);
      studentRegNo.value = response['data']['enterence_no']; // optional

      print("Student fetched: ${studentDetails.value.candidatename}");
    } else {
      print("Failed to fetch student details");
    }
    return StudentDetailsInfo();
  }

  ///
  /// resent Otp
  ///
  Future<void> resendOtp() async {
    var tokenMap = await SharedPrefsHelper.getToken();
    final response = await UserRepositories.resendOTP(tokenMap!);
    print("Resend OTP Response==>" + response.toString());
  }

  ///
  /// Create Order
  ///
  Future<CreateOrder> createOrderByRazorPay() async {
    var tokenMap = await SharedPrefsHelper.getToken();
    final response = await UserRepositories.createOrderPayment(tokenMap!);

    if (response.isNotEmpty &&
        (response['status'] == 200 || response['status'] == 201)) {
      paymentOrder.value = CreateOrder.fromJson(response['data']);

      print("Amount: ${paymentOrder.value.amountPaid}");
    } else {
      print("Failed to fetch Order details");
    }
    return CreateOrder();
  }

  ///
  /// verify payment on server
  ///

  Future<void> verifyPaymentOnServer({
    required VerifyPaymentModal verifyPaymentModal,
  }) async {
    var tokenMap = await SharedPrefsHelper.getToken();
    final response = await UserRepositories.verifyPayment(
      verifyPayment: verifyPaymentModal,
      token: tokenMap!,
    );
    print(response.toString());
    print("Verified payment response ==>" + response.toString());
  }
}
