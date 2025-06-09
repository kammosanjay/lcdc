import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lcdc_mobile_app/View/screens/FeePayment/payment_page.dart';
import 'package:lcdc_mobile_app/View/screens/signupPage/signup_controller.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/studentReqModal.dart';
import 'package:otp_resend_timer/otp_resend_timer.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var OtpController = TextEditingController();
  final controller = OtpResendTimerController(initialTime: 30);
  SignupController signupController = Get.find<SignupController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final StudentRequestModal studentRequestModal = Get.arguments;
    return Scaffold(
      backgroundColor: Color(0xFF00306E),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'OTP Screen',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 26, color: Color(0xFF4D5765)),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/lcdc_logo.png", height: 150),
            Text(
              "OTP Verification",
              style: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: OtpController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffffffff),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButtonTheme(
              data: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: Colors.white),
              ),
              child: OtpResendTimer(
                controller: controller,
                autoStart: true,
                // timerMessage: "",

                // readyMessage: "",
                // onFinish: () {},
                // onResendClicked: () {},
                // onStart: () {},
                // holdMessageStyle: TextStyle(
                //   color: Color.fromARGB(255, 218, 220, 224),
                // ),
                timerMessageStyle: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 245, 246, 247),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                readyMessageStyle: TextStyle(
                  color: Colors.white, // 👈 Set Resend text color to white
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => ElevatedButton(
                onPressed: () async {
                  try {
                    // PhoneAuthCredential phoneAuthCredential =
                    //     await PhoneAuthProvider.credential(
                    //         verificationId: widget.verID.toString(),
                    //         smsCode: OtpController.text.toString());

                    // FirebaseAuth.instance
                    //     .signInWithCredential(phoneAuthCredential)
                    //     .then((value) {
                    signupController.otpVerification(otp: OtpController.text);
                    print(OtpController.text);
                    Future.delayed(Duration(seconds: 3), () {
                      Get.to(
                        RegistrationDetailsPage(),
                        arguments: studentRequestModal,
                      );
                    });

                    // });
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child:
                    signupController.isLoading.value
                        ? Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                        : Text(
                          "Verify",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  fixedSize: Size(100, 40),
                  backgroundColor: Color.fromARGB(255, 164, 12, 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
