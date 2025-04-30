


import 'package:flutter/material.dart';





class OTPScreen extends StatefulWidget {
  String? verID;
  OTPScreen({super.key, this.verID});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var OtpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: OtpController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.lightBlue,
                      ),
                      borderRadius: BorderRadius.circular(10))),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    // PhoneAuthCredential phoneAuthCredential =
                    //     await PhoneAuthProvider.credential(
                    //         verificationId: widget.verID.toString(),
                    //         smsCode: OtpController.text.toString());

                    // FirebaseAuth.instance
                    //     .signInWithCredential(phoneAuthCredential)
                    //     .then((value) {
                    //   Get.toNamed(MyPageNames.home);
                    // });
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text("OTP"))
          ],
        ),
      ),
    );
  }
}
