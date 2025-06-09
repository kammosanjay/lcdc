import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lcdc_mobile_app/View/screens/LoginPage/login_controller.dart';
import 'package:lcdc_mobile_app/constant/customWidget.dart';
import 'package:lcdc_mobile_app/constant/myshared_sharedprefrences.dart';
import 'package:lcdc_mobile_app/database/dbHelper.dart';

import 'package:lcdc_mobile_app/modal/RequestModal/login.dart';

import 'package:lcdc_mobile_app/resources/mypagenames/mypage_names.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _focusLoginAs = FocusNode();
  final FocusNode _focusMobile = FocusNode();
  final FocusNode _focusReg = FocusNode();
  final FocusNode _focusCaptcha = FocusNode();
  RxBool isChecked = false.obs;
  RxBool isPhone = false.obs;
  String captchaCode = '';
  RxString? loginType = "".obs;
  LoginController loginController = Get.put(LoginController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController userLoginC;
  TextEditingController mobileC = TextEditingController();
  TextEditingController regisC = TextEditingController();
  TextEditingController captchaC = TextEditingController();

  DBHelper? dbHelper;
  @override
  void initState() {
    super.initState();
    captchaCode = generateCaptcha(6);

    dbHelper = DBHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF00306E),
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20, top: h * 0.1),
        child: GestureDetector(
          onTap: () {
            // _focusName.unfocus();
            // _focusPass.unfocus();
            FocusScope.of(context).unfocus();
            _formKey.currentState?.reset();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/lcdc_logo.png",
                height: 122,
                width: 122,
              ),
              SizedBox(height: h * 0.04),

              Align(
                alignment: Alignment.center,
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ),
              ),

              // SizedBox(height: h * 0.05),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      CustomWidgets.customDropdownField(
                        context: context,
                        focusNode: _focusLoginAs,

                        items: ['UG', 'PG', 'B.P.Ed'],
                        selectedItem:
                            ['UG', 'PG', 'B.P.Ed'].contains(loginType!.value)
                                ? loginType!.value
                                : null,
                        suffixIcon: Image.asset("assets/images/dropArrow.png"),
                        onChanged: (value) {
                          loginType!.value = value.toString();
                        },

                        validate: (userC) {
                          if (userC == null || userC.isEmpty) {
                            return "   Please select a login type";
                          }
                          return null;
                        },
                        hint: 'Login as',
                        icon: Image.asset("assets/images/student_as.png"),
                        iconColor: Colors.lightBlue,
                      ),

                      SizedBox(height: h * 0.02),
                      CustomWidgets.customTextFeild(
                        context: context,
                        focusNode: _focusMobile,

                        controller: mobileC,

                        keyboardtype: TextInputType.text,

                        // validate: (usermobile) {
                        //   if (usermobile.isEmpty || usermobile.length > 10) {
                        //     return "   Enter valid Mobile No";
                        //   }
                        // },
                        hint: "Mobile No",
                        icon: Image.asset("assets/images/mobile.png"),
                        iconColor: Colors.lightBlue,
                        action: TextInputAction.next,
                      ),
                      SizedBox(height: h * 0.02),
                      CustomWidgets.customTextFeild(
                        context: context,
                        focusNode: _focusReg,
                        keyboardtype: TextInputType.text,
                        controller: regisC,

                        validate: (userC) {
                          if (userC.isEmpty) {
                            return "   Invalid Registration No";
                          } else {
                            return null;
                          }
                        },
                        hint: "Registration No",
                        icon: Image.asset("assets/images/regis.png"),
                        iconColor: Colors.lightBlue,
                        action: TextInputAction.next,
                      ),

                      SizedBox(height: h * 0.02),

                      Container(
                        padding: EdgeInsets.only(left: 5, right: 0),
                        height: h * 0.06,
                        width: w,
                        color: Colors.black,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Text(
                                    "Captcha",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 26,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.04),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        captchaCode = generateCaptcha(6);
                                      });
                                    },
                                    child: Image.asset(
                                      "assets/images/refresh.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                captchaCode,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      CustomWidgets.customTextFeild(
                        context: context,
                        focusNode: _focusCaptcha,
                        controller: captchaC,

                        keyboardtype: TextInputType.text,
                        validate: (userC) {
                          if (userC == null ||
                              userC.trim().isEmpty ||
                              userC.trim() != captchaCode) {
                            return "   Invalid Captcha";
                          }
                          return null;
                        },
                        hint: "Enter Captcha",
                        icon: Image.asset("assets/images/captcha.png"),
                        iconColor: Colors.lightBlue,
                        action: TextInputAction.next,
                      ),

                      SizedBox(height: h * 0.05),

                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Obx(
                            () => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFD2093C),
                                minimumSize: Size(w * 0.5, h * 0.06),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                // loginController.loadData();

                                await SharedPrefsHelper.saveUserData(
                                  type: loginType!.value,
                                  mobile: mobileC.text,
                                  password: regisC.text,
                                );
                                var userData =
                                    await SharedPrefsHelper.getUserData();
                                // debugPrint('User Data: $userData');eve
                                // debugPrint(userData['mobile']);
                                  
                                if (_formKey.currentState!.validate()) {
                                  loginController.loginUser(
                                    loginRequest: LoginRequset(
                                      email: mobileC.text,
                                      password: regisC.text,
                                    ),
                                  );
                                  // loginController.postres();
                                }

                                // Get.toNamed(MyPageNames.home);
                              },
                              child:
                                  loginController.isLoading.value
                                      ? CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      )
                                      : Text(
                                        'SUBMIT',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(MyPageNames.signup);
                          },
                          child: Text(
                            "Don't have Registered? Register Now",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String generateCaptcha(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyz!@#^&*1234567890'; // avoid ambiguous chars
    return List.generate(
      length,
      (index) =>
          chars[(DateTime.now().millisecondsSinceEpoch + index) % chars.length],
    ).join();
  }

  PreferredSizeWidget appBar(String title, bool type, Icon icon) {
    return AppBar(
      backgroundColor: Colors.amberAccent,
      title: Text(title),
      centerTitle: type,
      leading: Container(child: icon),
    );
  }

  Widget customButton() {
    return Container(
      color: Colors.amber,
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: double.infinity,
        maxHeight: double.infinity,
        maxWidth: double.infinity,
      ),
    );
  }
}
