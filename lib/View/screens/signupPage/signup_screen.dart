import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lcdc_mobile_app/constant/customWidget.dart';
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
  List<String> category = [
    '1-General',
    '2a-Christian Candidate',
    '2b-LCDC Employees Ward',
    '2c-Blind/Physically Challenged',
    '3a-Children of Alumni/Teachers/Defence Personnel',
    '3b-NCC',
    '3c-OBC/Grand Children of Freedom Fighters',
    '3d-LCIC/CHSS STUDENT',
    '4-SC/ST',
    '5-Foreign Students',
    '6-SPORTS QUOTA',
  ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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

        body:
         Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(height: 20),

              Obx(
                () => CustomWidgets.customDropdownField(
                  context: context,
                  items: ['UG', 'PG', 'B.P.Ed'],
                  selectedItem: selectDegree.value,
                  onChanged: (value) {
                    if (value != null) {
                      selectDegree.value = value;
                    }
                    print(selectDegree.value);
                  },
                  hint: 'Select Degree',
                  icon: Image.asset("assets/images/student_as.png"),
                  suffixIcon: Image.asset("assets/images/dropArrow.png"),
                ),
              ),
              SizedBox(height: 20),
              CustomWidgets.customTextFeild(
                context: context,
                name: 'name',
                controller: nameController,
                keyboardtype: TextInputType.name,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
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
              CustomWidgets.customTextFeild(
                context: context,
                name: 'father name',
                controller: fatherNameController,
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
                isPassword: true,
                action: TextInputAction.next,
              ),
              SizedBox(height: 20),
              CustomWidgets.customTextFeild(
                context: context,
                name: 'mobile',
                controller: mobileController,
                hint: 'Enter your mobile number',
                keyboardtype: TextInputType.phone,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
                // focusNode: FocusNode(),
                icon: Image.asset("assets/images/mobile.png"),
                iconColor: Colors.blue,
                isPassword: true,
                action: TextInputAction.done,
              ),
              SizedBox(height: 20),
              CustomWidgets.customTextFeild(
                context: context,
                name: 'aadhaar',
                controller: aadhaarController,
                keyboardtype: TextInputType.number,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Aadhaar number';
                  }
                  return null;
                },
                hint: 'Enter your Aadhaar number',
                // focusNode: FocusNode(),
                icon: Image.asset("assets/images/aadhar.png"),
                iconColor: Colors.blue,
                isPassword: false,
                action: TextInputAction.done,
              ),
              SizedBox(height: 20),

              Obx(
                () => Visibility(
                  visible: selectDegree.value == "UG",
                  child: CustomWidgets.customDropdownField(
                    context: context,
                    items: ['BCA', 'BCOM', 'BSc(Bio)', 'BSc(Math)'],
                    selectedItem: null,
                    onChanged: (value) {},
                    hint: 'Course',
                    icon: Image.asset("assets/images/course.png"),
                    suffixIcon: Image.asset("assets/images/dropArrow.png"),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: selectDegree.value == "PG",
                  child: CustomWidgets.customDropdownField(
                    context: context,
                    items: ['M.A(English)', 'M.Sc(Chemistry)'],
                    selectedItem: null,
                    onChanged: (value) {},
                    hint: 'Course',
                    icon: Image.asset("assets/images/course.png"),
                    suffixIcon: Image.asset("assets/images/dropArrow.png"),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: selectDegree.value == "B.P.Ed",
                  child: CustomWidgets.customDropdownField(
                    context: context,
                    items: ['B.P.Ed.'],
                    selectedItem: null,
                    onChanged: (value) {},
                    hint: 'Course',
                    icon: Image.asset("assets/images/course.png"),
                    suffixIcon: Image.asset("assets/images/dropArrow.png"),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: CustomWidgets.customDropdownField(
                      context: context,
                      items: ['Male', 'Female', 'Other'],
                      selectedItem: 'Male',
                      onChanged: (value) {},
                      icon: Image.asset("assets/images/gender.png"),
                      suffixIcon: Image.asset("assets/images/dropArrow.png"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2030),
                        ).then((value) {
                          if (value != null) {
                            selectedDate.value = value;
                          }
                        });
                      },
                      child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              color: const Color.fromARGB(255, 52, 64, 73),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomWidgets.customTextFeild(
                context: context,
                name: 'email',
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
                isPassword: false,
                action: TextInputAction.done,
              ),
              SizedBox(height: 20),

              CustomWidgets.customDropdownField(
                context: context,
                items: category,
                selectedItem: null,
                onChanged: (value) {},
                hint: 'Category',
                icon: Image.asset("assets/images/category.png"),
                suffixIcon: Image.asset("assets/images/dropArrow.png"),
              ),
              SizedBox(height: 20),
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
                          Image.asset("assets/images/refresh.png"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "gdgf45",
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
                name: 'Captcha',
                hint: 'Enter your Captcha',

                // focusNode: FocusNode(),
                icon: Image.asset("assets/images/captcha.png"),
                iconColor: Colors.blue,
                isPassword: false,
                action: TextInputAction.done,
              ),
              SizedBox(height: 20),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(MyPageNames.home);
                    },
                    child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(w * 0.5, 50), // Width: 200, Height: 50
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
    );
  }
}
