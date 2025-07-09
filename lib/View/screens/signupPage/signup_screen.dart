import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lcdc_mobile_app/View/screens/FeePayment/payment_page.dart';
import 'package:lcdc_mobile_app/View/screens/Otp/otpPage.dart';
import 'package:lcdc_mobile_app/View/screens/signupPage/signup_controller.dart';
import 'package:lcdc_mobile_app/constant/customWidget.dart';
import 'package:lcdc_mobile_app/constant/myshared_sharedprefrences.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/studentReqModal.dart';
import 'package:lcdc_mobile_app/resources/mypagenames/mypage_names.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController fatherNameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController aadhaarController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController captchaController = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(DateTime.now());
  // Initialize with current date
  RxString selectDegree = "UG".obs;
  RxString? selectCourse = "".obs;
  RxString? selectGender = "".obs;
  RxString? selectCategory = "".obs;
  RxString? signUpType = "".obs;
  String captchaCode = '';

  final _formKey = GlobalKey<FormState>();

  SignupController signupController = Get.put(SignupController());

  @override
  void initState() {
    super.initState();
    captchaCode = generateCaptcha6();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _formKey.currentState!.reset();
      },
      child: Scaffold(
        backgroundColor: Color(0xFF00306E),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Registration form',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 26, color: Color(0xFF4D5765)),
            ),
          ),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 20),

                // eductation drop down
                ///
                Obx(() {
                  final courseTypeList = signupController.courseType;

                  // Show loading or empty state if courseType is not yet loaded
                  if (courseTypeList == null || courseTypeList.isEmpty) {
                    return SizedBox(); // or SizedBox(), or 'Select Degree' hint
                  }

                  final upperCaseItems =
                      courseTypeList.map((e) => e.toUpperCase()).toList();

                  return CustomWidgets.customDropdownField(
                    context: context,
                    items: upperCaseItems,
                    label: "Course Type",
                    color: Colors.white,

                    selectedItem:
                        upperCaseItems.contains(
                              selectDegree.value.toUpperCase(),
                            )
                            ? selectDegree.value.toUpperCase()
                            : null,
                    onChanged: (value) {
                      if (value != null) {
                        selectDegree.value = value;
                      }
                      print(selectDegree.value);
                    },
                    validate: (userC) {
                      if (userC == null || userC.isEmpty) {
                        return "   Please select a login type";
                      }
                      return null;
                    },
                    hint: 'Select Degree',
                    icon: Image.asset("assets/images/student_as.png"),
                    suffixIcon: Image.asset("assets/images/dropArrow.png"),
                  );
                }),
                SizedBox(height: 20),

                /// Student name
                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'Your Name',
                  controller: nameController,
                  keyboardtype: TextInputType.name,

                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return '   Please enter your name';
                    }
                    return null;
                  },
                  hint: 'Enter your name',
                  icon: Image.asset("assets/images/candidate.png"),

                  // focusNode: FocusNode(),
                  iconColor: Colors.blue,
                  isPassword: false,
                  action: TextInputAction.next,
                ),
                SizedBox(height: 20),

                /// father Name
                ///
                CustomWidgets.customTextFeild(
                  context: context,
                  name: 'father name',
                  controller: fatherNameController,
                  label: 'Father Name',
                  keyboardtype: TextInputType.name,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your father name';
                    }
                    return null;
                  },
                  hint: 'Enter your father name',
                  // focusNode: FocusNode(),
                  icon: Image.asset("assets/images/student_as.png"),
                  iconColor: Colors.blue,

                  action: TextInputAction.next,
                ),
                SizedBox(height: 20),

                // mobile number
                ///
                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'Your Mobile Number',
                  controller: mobileController,
                  hint: 'Enter your mobile number',
                  keyboardtype: TextInputType.phone,
                  maxLength: 10,
                  validate: (usermobile) {
                    if (usermobile.isEmpty || usermobile.length > 10) {
                      return "   Enter valid Mobile No";
                    }
                  },
                  // focusNode: FocusNode(),
                  icon: Image.asset("assets/images/mobile.png"),
                  iconColor: Colors.blue,

                  action: TextInputAction.done,
                ),
                SizedBox(height: 20),

                ///
                ///Aadhaar Number
                ///
                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'Aadhaar',
                  controller: aadhaarController,
                  keyboardtype: TextInputType.number,
                  maxLength: 12,
                  validate: (value) {
                    if (value == null || value.length > 12) {
                      return 'Please enter 12-digit your Aadhaar number';
                    }
                    return null;
                  },
                  hint: 'Enter your Aadhaar number',
                  // focusNode: FocusNode(),
                  icon: Image.asset("assets/images/aadhar.png"),
                  iconColor: Colors.blue,

                  action: TextInputAction.done,
                ),
                SizedBox(height: 20),

                ///
                ///Course type if UG
                Obx(
                  () => Visibility(
                    visible: selectDegree.value == "UG",
                    child: CustomWidgets.customDropdownField(
                      context: context,
                      label: 'Course',
                      items: signupController.ugCourse,
                      selectedItem:
                          signupController.ugCourse.contains(
                                selectCourse!.value,
                              )
                              ? selectCourse!.value
                              : null,
                      validate: (userC) {
                        if (userC == null || userC.isEmpty) {
                          return "   Please select a course";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value != null) {
                          selectCourse!.value = value;
                          print(selectCourse!.value);
                        }
                      },
                      hint: 'Course',
                      icon: Image.asset("assets/images/course.png"),
                      suffixIcon: Image.asset("assets/images/dropArrow.png"),
                    ),
                  ),
                ),

                ///
                ///Course type if PG
                Obx(
                  () => Visibility(
                    visible: selectDegree.value == "PG",
                    child: CustomWidgets.customDropdownField(
                      context: context,
                      label: 'Course',
                      items: signupController.pgCourse,
                      selectedItem:
                          signupController.pgCourse.contains(
                                selectCourse!.value,
                              )
                              ? selectCourse!.value
                              : null,
                      onChanged: (value) {
                        if (value != null) {
                          selectCourse!.value = value;
                        }
                      },
                      hint: 'Course',
                      icon: Image.asset("assets/images/course.png"),
                      suffixIcon: Image.asset("assets/images/dropArrow.png"),
                    ),
                  ),
                ),
                //
                /// course type if Bped
                Obx(
                  () => Visibility(
                    visible: selectDegree.value == "BPED",
                    child: CustomWidgets.customDropdownField(
                      context: context,
                      label: 'Course',
                      items: signupController.bpedCourse,
                      selectedItem:
                          signupController.bpedCourse.contains(
                                selectCourse!.value,
                              )
                              ? selectCourse!.value
                              : null,
                      validate: (userC) {
                        if (userC == null || userC.isEmpty) {
                          return "   Please select a course";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value != null) {
                          selectCourse!.value = value;
                        }
                      },
                      hint: 'Course',
                      icon: Image.asset("assets/images/course.png"),
                      suffixIcon: Image.asset("assets/images/dropArrow.png"),
                    ),
                  ),
                ),

                ///
                ///Gender
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomWidgets.customDropdownField(
                        context: context,
                        items: signupController.gender,
                        label: 'Gender',
                        // validate: (userC) {
                        //   if (userC == null || userC.isEmpty) {
                        //     return "  Invalid";
                        //   }
                        //   return null;
                        // },
                        selectedItem: null,

                        // [
                        //       'Male',
                        //       'Female',
                        //       'Other',
                        //     ].contains(selectGender!.value)
                        //     ? selectGender!.value
                        //     : null,
                        onChanged: (value) {
                          if (value != null) {
                            selectGender!.value = value;
                          }
                        },
                        hint: "Gender",
                        icon: Image.asset("assets/images/gender.png"),
                        suffixIcon: Image.asset("assets/images/dropArrow.png"),
                      ),
                    ),
                    SizedBox(width: 10),

                    ///
                    ///Date picker
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime(2025),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2030),
                          ).then((value) {
                            if (value != null) {
                              selectedDate.value = value;
                            }
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DOB",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),

                            Container(
                              height: h * 0.0735,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(
                                    () => Text(
                                      "${selectedDate.value!.day}/${selectedDate.value!.month}/${selectedDate.value!.year}",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/date.png",
                                    width: 24,
                                    height: 24,
                                    color: const Color.fromARGB(
                                      255,
                                      52,
                                      64,
                                      73,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                ///
                ///Email
                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'Email',
                  hint: 'Enter your email',
                  controller: emailController,
                  keyboardtype: TextInputType.emailAddress,

                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  // focusNode: FocusNode(),
                  icon: Image.asset("assets/images/email.png"),
                  iconColor: Colors.blue,

                  action: TextInputAction.done,
                ),
                SizedBox(height: 20),

                ///
                ///Category
                CustomWidgets.customDropdownField(
                  context: context,
                  label: 'Category',
                  items: signupController.category,
                  // Replace with your list of items
                  selectedItem:
                      signupController.category.contains(selectCategory!.value)
                          ? selectCategory!.value
                          : null,
                  validate: (userC) {
                    if (userC == null || userC.isEmpty) {
                      return "   Please select a category";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value != null) {
                      selectCategory!.value = value;
                    }
                  },
                  hint: 'Category',
                  icon: Image.asset("assets/images/category.png"),
                  suffixIcon: Image.asset("assets/images/dropArrow.png"),
                ),
                SizedBox(height: 20),

                ///
                ///Captcha
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
                                  captchaCode = generateCaptcha6();
                                });
                              },
                              child: Image.asset("assets/images/refresh.png"),
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
                SizedBox(height: 20),
                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'Captcha',
                  hint: 'Enter your Captcha',
                  controller: captchaController,
                  validate: (userC) {
                    if (userC == null ||
                        userC.trim().isEmpty ||
                        userC.trim() != captchaCode) {
                      return "   Invalid Captcha";
                    }
                    return null;
                  },
                  // focusNode: FocusNode(),
                  icon: Image.asset("assets/images/captcha.png"),
                  iconColor: Colors.blue,

                  action: TextInputAction.done,
                ),
                SizedBox(height: 20),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          /// convert Date
                          DateTime fullDateTime = DateTime.parse(
                            selectedDate.value.toString(),
                          );
                          String dateOnly =
                              fullDateTime.toIso8601String().split('T')[0];

                          ///
                          print(dateOnly);

                          signupController.studentRegistrationForm(
                            studentReq: StudentRequestModal(
                              candidatename: nameController.text,
                              fathername: fatherNameController.text,
                              mobileNo: mobileController.text,
                              aadharid: aadhaarController.text,
                              course: selectCourse!.value.toString(),
                              gender: selectGender!.value.toString(),
                              dateofbirth: dateOnly,
                              emailid: emailController.text,
                              category: selectCategory!.value.toString(),
                              eduCourseType: selectDegree.value.toLowerCase(),
                            ),
                          );
                          // clearForm();

                          // Get.toNamed(MyPageNames.threeStepForm);

                          // }
                        },
                        child:
                            signupController.isLoading.value
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  'Submit',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            w * 0.5,
                            50,
                          ), // Width: 200, Height: 50
                          backgroundColor: Color(0xFFD2093C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Set border radius
                          ), // Button color
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(MyPageNames.login);
                    },
                    child: Text(
                      "Already Registered? Login Now",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearForm() {
    nameController.clear();
    fatherNameController.clear();
    mobileController.clear();
    aadhaarController.clear();
    emailController.clear();

    selectCourse!.value = '';
    selectGender!.value = '';
    selectCategory!.value = '';
    selectDegree.value = '';
    selectedDate.value = DateTime.now();
  }

  String generateCaptcha6() {
    const chars =
        '05631457521765758136231514318176721881270589879809345164565718894';
    final rand = Random.secure();
    return List.generate(
      4,
      (index) => chars[rand.nextInt(chars.length)],
    ).join();
  }
}
