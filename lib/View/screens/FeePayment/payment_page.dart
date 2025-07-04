import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lcdc_mobile_app/View/screens/HomeScreen/new_home_screen.dart';

import 'package:lcdc_mobile_app/View/screens/signupPage/signup_controller.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/payment_modal.dart';
import 'package:lcdc_mobile_app/resources/mypagenames/mypage_names.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:lcdc_mobile_app/modal/ResponseModal/student_detail_info.dart';

class RegistrationDetailsPage extends StatefulWidget {
  RegistrationDetailsPage({super.key});

  @override
  State<RegistrationDetailsPage> createState() =>
      _RegistrationDetailsPageState();
}

class _RegistrationDetailsPageState extends State<RegistrationDetailsPage> {
  final _razorpay = Razorpay();
  final SignupController signupController = Get.find<SignupController>();

  var v, j, k;

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(response.data.toString());
    debugPrint("✅ Payment Successful");
    debugPrint("🔹 Payment ID: ${response.paymentId}");
    debugPrint("🔹 Order ID: ${response.orderId.toString()}");
    debugPrint("🔹 Signature: ${response.signature.toString()}");

    // 1. Send this data to your server for verification (recommended)
    signupController.verifyPaymentOnServer(
      verifyPaymentModal: VerifyPaymentModal(
        razorpayOrderId: response.orderId,
        razorpayPaymentId: response.paymentId,
        razorpaySignature: response.signature,
      ),
    );

    // 2. Show a confirmation dialog/snackbar
    showDialog(
      context: context,
      builder:
          (context) => Obx(
            () => AlertDialog(
              title: Text("Payment Successful"),
              content: Text(
                "Payment ID: ${response.paymentId}\n Order ID:${response.orderId}\n Amount : ${signupController.paymentOrder.value.amountPaid}",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                    signupController.studentDetailInfo();
                  },
                  child: Text("OK"),
                ),
              ],
            ),
          ),
    );

    // 3. Optionally update your UI or backend status
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint("❌ Payment Failed");
    debugPrint("🔹 Code: ${response.code}");
    debugPrint("🔹 Message: ${response.message}");
    debugPrint("🔹 Error: ${response.error}");

    // Optional: Parse structured error if available
    if (response.error is Map) {
      final errorMap = response.error as Map;
      final description = errorMap['description'];
      final source = errorMap['source'];
      debugPrint("🔍 Detailed Error: $description from $source");
    }

    // Show a user-friendly alert
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Payment Failed"),
            content: Text(
              response.message ?? "Something went wrong during payment.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
    );

    // Optionally log to server or analytics
    // logPaymentFailure(response.code, response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }

  Widget buildRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              "$title  ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 10,
            child: Text(
              ": ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: valueColor ?? Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final studentInfo = signupController.studentDetails.value;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "REGISTRATION DETAILS & REGISTRATION FEE PAYMENT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                buildRow(
                  "Registration Number",
                  studentInfo.enterenceNo.toString(),
                ),
                buildRow(
                  "Candidate Name",
                  studentInfo.candidatename.toString(),
                ),
                buildRow("Father's Name", studentInfo.fathername.toString()),
                buildRow("Mobile Number", studentInfo.mobileNo.toString()),
                buildRow("Mobile Status", "Verified", valueColor: Colors.green),
                buildRow("Email-Id", studentInfo.emailid.toString()),
                buildRow("Gender", studentInfo.gender.toString()),
                buildRow("Date of birth", studentInfo.dateofbirth.toString()),
                buildRow("Category", studentInfo.category.toString()),
                buildRow("Aadhar Id Number", studentInfo.aadharid.toString()),
                buildRow("Course", studentInfo.course.toString()),
                buildRow(
                  "Status",
                  studentInfo.status.toString().toUpperCase(),
                  valueColor:
                      signupController.studentDetails.value.status == 'inactive'
                          ? Colors.red
                          : Colors.green,
                ),
                buildRow(
                  "Application Fees",
                  "850 + Payment Gateway Handling Charge",
                ),

                const SizedBox(height: 20),
                const Text(
                  "Payment Mode:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Visibility(
                  visible:
                      signupController.studentDetails.value.status ==
                      'inactive',
                  child: Row(
                    children: [
                      Radio(
                        value: "Online",
                        groupValue: "Online",
                        onChanged: (_) {},
                      ),
                      Text("Select Payment Mode :${studentInfo.paymentType}"),
                    ],
                  ),
                ),
                Visibility(
                  visible:
                      signupController.studentDetails.value.status == 'active',
                  child: Text(" ${studentInfo.paymentType}"),
                ),

                const SizedBox(height: 20),

                Visibility(
                  visible:
                      signupController.studentDetails.value.status ==
                      'inactive',
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        // 1. Create Razorpay Order and wait
                        await signupController.createOrderByRazorPay();

                        var paymentInfo = signupController.paymentOrder.value;

                        // 2. Defensive check (handle null safely)
                        if (paymentInfo.amountPaid == null ||
                            paymentInfo.razorKey == null ||
                            paymentInfo.orderId == null) {
                          Get.snackbar(
                            "Error",
                            "Payment information not ready. Try again.",
                          );
                          return;
                        }

                        // 3. Now safely open Razorpay
                        var options = {
                          'key': paymentInfo.razorKey,
                          'amount': (paymentInfo.amountPaid! * 100), // in paise
                          'name': paymentInfo.merchantName,
                          'order_id': paymentInfo.orderId,
                          'description': "Registration Fee",
                          'prefill': {
                            'contact': paymentInfo.mobileNo,
                            'email': paymentInfo.email,
                          },
                        };

                        _razorpay.open(options);
                      },

                      child: Text(
                        "Fee",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 40),
                        backgroundColor: const Color(0xFF00306E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      signupController.studentDetails.value.status == 'active',
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Get.toNamed(MyPageNames.login);
                        Get.to(ThreeStepForm());
                      },
                      child: Text(
                        "Three Step Form",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 40),
                        backgroundColor: const Color(0xFF00306E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
