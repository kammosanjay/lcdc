import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as box;
import 'package:in_app_update/in_app_update.dart';
import 'package:lcdc_mobile_app/View/screens/HomeScreen/home_controller.dart';
import 'package:lcdc_mobile_app/constant/customWidget.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/student_threeStepFrom_request.dart';
import 'package:path/path.dart' as p;
import '../signupPage/signup_controller.dart';

class ThreeStepForm extends StatefulWidget {
  @override
  _ThreeStepFormState createState() => _ThreeStepFormState();
}

class _ThreeStepFormState extends State<ThreeStepForm> {
  int _currentStep = 0;

  // Controllers for the fields (optional)
  final TextEditingController _step1Controller = TextEditingController();
  final TextEditingController _step2Controller = TextEditingController();
  final TextEditingController _step3Controller = TextEditingController();
  final TextEditingController _step4Controller = TextEditingController();
  var mobileController = TextEditingController();
  var lurnController = TextEditingController();
  var categoryController = TextEditingController();
  var GparticipatedController = TextEditingController();
  var fannualController = TextEditingController();
  var mothernameController = TextEditingController();
  var mAnnualController = TextEditingController();
  var nationalityController = TextEditingController();
  var lastExmController = TextEditingController();
  var lastInstController = TextEditingController();
  var BoarduniverController = TextEditingController();
  var mmController = TextEditingController();
  var OmController = TextEditingController();
  var perController = TextEditingController();
  var fatherMobileNoController = TextEditingController();
  var motherMobileNoCont = TextEditingController();
  var presentAddressController = TextEditingController();
  var presentPinController = TextEditingController();
  var NRSController = TextEditingController();
  var NPSController = TextEditingController();
  var permanentAddController = TextEditingController();
  var permanentPinController = TextEditingController();
  var permanNRSController = TextEditingController();
  var permanentNPSController = TextEditingController();
  var nameController = TextEditingController();
  var aadhaarController = TextEditingController();
  var fatherNameController = TextEditingController();
  var emailController = TextEditingController();
  var regisC = TextEditingController();
  FocusNode _focusReg = FocusNode();
  FocusNode _lastExmFocus = FocusNode();

  TextEditingController captchaController = TextEditingController();
  final RxString domicilefileName = ''.obs;
  final RxString domicilefilePath = ''.obs;
  final RxString castefileName = ''.obs;
  final RxString castefilePath = ''.obs;
  final RxString gamefileName = "".obs;
  final RxString gamefilePath = "".obs;
  final RxString aadharfileName = "".obs;
  final RxString aadharfilePath = "".obs;
  final RxString candidatefileName = "".obs;
  final RxString candidatefilePath = "".obs;
  final RxString candidateSignaturefileName = "".obs;
  final RxString candidateSignaturefilePath = "".obs;
  final RxString gra2yrfileName = "".obs;
  final RxString gra2yrfilePath = "".obs;
  final RxString highSchMarkfileName = "".obs;
  final RxString highSchMarkfilePath = "".obs;
  final RxString castCertifileName = "".obs;
  final RxString castCertifilePath = "".obs;
  final RxString graduatinMarkfileName = "".obs;
  final RxString graduatinMarkfilePath = "".obs;
  final RxString ugpart2fileName = "".obs;
  final RxString ugpart2filePath = "".obs;
  final RxString intermediatefileName = "".obs;
  final RxString intermediatefilePath = "".obs;

  bool isChecked = false;
  bool isCheckedTerms = false;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(DateTime.now());
  // Initialize with current date
  RxString selectDegree = "".obs;
  RxString selectBloodGroup = "".obs;
  RxString selectCourse = "".obs;
  RxString selectReligon = "".obs;
  RxString selectYear = "".obs;
  RxString selectFOccupation = "".obs;
  RxString selectMOccupation = "".obs;
  RxString selectStudent = "".obs;
  RxString selectCategory = "".obs;
  RxString selectDomicile = "".obs;
  RxString selectPosition = "".obs;
  RxString selectLevel = "".obs;
  String gender = "";
  RxString selectCaste = "".obs;
  RxString selectSkillTest = "".obs;
  RxString selectYearOfPassing = "".obs;
  final GlobalKey<FormState> _formKey0 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  late SignupController signupController;
  HomeController homeController = Get.put(HomeController());
  StudentRegistrationModel mdl = StudentRegistrationModel();

  @override
  void initState() {
    super.initState();
    //for setting  the category value after edit ,initialize here to get the info

    signupController = Get.find<SignupController>();
    var fetch = signupController.studentDetails.value;
    regisC.text = fetch.enterenceNo.toString();
    nameController.text = fetch.candidatename.toString();
    emailController.text = fetch.emailid.toString();
    mobileController.text = fetch.mobileNo.toString();
    aadhaarController.text = fetch.aadharid.toString();
    fatherNameController.text = fetch.fathername.toString();
    //for setting  the category value after edit ,initialize here to get the info
    selectCategory.value = fetch.category.toString();
    selectCourse.value = fetch.course.toString();

    ///
    ///
    /// Instead of sqflite ,used Getstorage dependencies to store formfields  locally for edit
    final box = GetStorage();

    Map<String, dynamic>? storedData = box.read('formData');
    if (storedData != null) {
      final formDetail = StudentRegistrationModel.fromJson(storedData);
      loadFormDataForEdit(formDetail);
      selectCategory.value = formDetail.category ?? "";
    }
  }

  loadFormDataForEdit(StudentRegistrationModel formDetail) {
    // Populate text fields
    lurnController.text = formDetail.lurnCertificate ?? '';
    mothernameController.text = formDetail.motherName ?? '';
    fannualController.text = formDetail.annualIncomeRs ?? '';
    mAnnualController.text = formDetail.motherAnnualIncomeRs ?? '';
    lastExmController.text = formDetail.examinationName ?? "";
    lastInstController.text = formDetail.institution ?? '';
    nationalityController.text = formDetail.nationality ?? '';
    BoarduniverController.text = formDetail.boardUniversity ?? "";
    mmController.text = formDetail.maximumMarks ?? "";
    OmController.text = formDetail.marksObtained ?? "";
    perController.text = formDetail.marksPercentage ?? "";
    fatherMobileNoController.text = formDetail.fatherMobileNo ?? "";
    motherMobileNoCont.text = formDetail.motherMobileNumber ?? "";
    presentAddressController.text = formDetail.presentAddress ?? "";
    presentPinController.text = formDetail.presentPincode ?? '';
    NRSController.text = formDetail.presentNearRailway ?? "";
    NPSController.text = formDetail.presentNearPolice ?? "";
    permanentAddController.text = formDetail.permanentAddress ?? "";
    permanentPinController.text = formDetail.permanentPincode ?? "";
    permanNRSController.text = formDetail.permanentNearRailway ?? "";
    permanentNPSController.text = formDetail.permanentNearPolice ?? "";

    // Populate dropdown values
    selectFOccupation.value = formDetail.occupation ?? '';
    selectMOccupation.value = formDetail.motherOccupation ?? '';
    selectYear.value = formDetail.passingYear ?? '';
    selectBloodGroup.value = formDetail.bloodGroup ?? '';
    selectReligon.value = formDetail.religion ?? '';
    selectCaste.value = formDetail.caste ?? "";
    selectYear.value = formDetail.passingYear ?? "";
    selectCategory.value = formDetail.category ?? "";

    // Populate file paths

    candidatefileName.value = p.basename(formDetail.casteCertificatePath ?? "");
    candidatefilePath.value = formDetail.casteCertificatePath ?? "";
    intermediatefileName.value = p.basename(
      formDetail.interMarksheetPath ?? "",
    );
    intermediatefilePath.value = formDetail.interMarksheetPath ?? "";
    aadharfileName.value = p.basename(formDetail.addressProofPath ?? "");
    aadharfilePath.value = formDetail.addressProofPath ?? "";
    candidateSignaturefileName.value = p.basename(
      formDetail.studentSignaturePath ?? "",
    );
    candidateSignaturefilePath.value = formDetail.studentSignaturePath ?? "";
    domicilefileName.value = p.basename(
      formDetail.domicileCertificatePath ?? "",
    );
    domicilefilePath.value = formDetail.domicileCertificatePath ?? "";
    castefileName.value = p.basename(formDetail.casteCertificatePath ?? "");
    castefilePath.value = formDetail.casteCertificatePath ?? "";

    highSchMarkfileName.value = p.basename(
      formDetail.highschoolMarksheet ?? "",
    );
    highSchMarkfilePath.value = formDetail.highschoolMarksheet ?? "";
    gra2yrfileName.value = p.basename(formDetail.graduationMarksPath ?? "");
    gra2yrfilePath.value = formDetail.graduationMarksPath ?? "";
    ugpart2fileName.value = p.basename(formDetail.ugPart2SemMarksheet ?? "");
    ugpart2filePath.value = formDetail.ugPart2SemMarksheet ?? "";
  }

  List<String> category = [
    "General",
    "Christian Candidate",
    "LCDC Employees Ward",
    "Blind/Physically Challenged",
    "COATD",
    "NCC",
    "OBC/Grand Children of Freedom Fighters",
    "LC",
    "SCST",
    "FS",
    "Sports Quota",
  ];

  checkForUpdate() async {
    try {
      var update = await InAppUpdate.checkForUpdate();
      if (update.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate();
      }
    } catch (e) {}
  }

  List<String> domicile = ['UP', 'Outside UP'];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF00306E),
      appBar: AppBar(
        title: Text(
          'APPLICATION FOR ADMISSION',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          _formKey0.currentState?.reset();
          _formKey1.currentState?.reset();
          _formKey2.currentState?.reset(); // Dismiss the keyboard
        },
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment:
                    _currentStep == 0
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (_currentStep != 0)
                    ElevatedButton(
                      onPressed: () {
                        details.onStepCancel!();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(w * 0.3, h * 0.06),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor:
                            Colors
                                .white, // You can set different color for Back
                      ),
                      child: Text(
                        'Previous',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentStep == 0) {
                        if (_formKey0.currentState!.validate()) {
                          setState(() => _currentStep += 1);
                        }
                      } else if (_currentStep == 1) {
                        if (_formKey1.currentState!.validate()) {
                          setState(() => _currentStep += 1);
                        }
                      } else if (_currentStep == 2) {
                        if (_formKey2.currentState!.validate()) {
                          // Submit form
                          print("Step 1: ${_step1Controller.text}");
                          print("Step 2: ${_step2Controller.text}");
                          print("Step 3: ${_step3Controller.text}");
                          // Add your submit logic here

                          homeController.submitForm(
                            studentform: StudentRegistrationModel(
                              lurnCertificate: lurnController.text,
                              registrationNumber: regisC.text,
                              candidateName: nameController.text,
                              gender:
                                  signupController.studentDetails.value.gender,
                              dateOfBirth:
                                  signupController
                                      .studentDetails
                                      .value
                                      .dateofbirth,
                              emailId: emailController.text,
                              mobileNumber: mobileController.text,
                              aadharId: aadhaarController.text,
                              fatherName: fatherNameController.text,
                              annualIncomeRs: fannualController.text,
                              occupation: selectFOccupation.value,
                              motherName: mothernameController.text,
                              motherAnnualIncomeRs: mAnnualController.text,
                              motherOccupation: selectMOccupation.value,
                              course: selectCourse.value,
                              category: selectCategory.value,
                              domicileCertificatePath: domicilefilePath.value,
                              casteCertificatePath: castefilePath.value,
                              bloodGroup: selectBloodGroup.value,
                              religion: selectReligon.value,
                              caste: selectCaste.value,
                              nationality: nationalityController.text,
                              examinationName: lastExmController.text,
                              institution: lastInstController.text,
                              boardUniversity: BoarduniverController.text,
                              passingYear: selectYear.value,
                              maximumMarks: mmController.text,
                              marksObtained: OmController.text,
                              marksPercentage: perController.text,
                              fatherMobileNo: fatherMobileNoController.text,
                              motherMobileNumber: motherMobileNoCont.text,
                              presentAddress: presentAddressController.text,
                              presentPincode: presentPinController.text,
                              presentNearRailway: NRSController.text,
                              presentNearPolice: NPSController.text,
                              addressProofPath: aadharfilePath.value,
                              permanentAddress:
                                  isChecked
                                      ? presentAddressController.text
                                      : permanentAddController.text,

                              permanentNearPolice: permanentNPSController.text,
                              permanentNearRailway: permanNRSController.text,
                              permanentPincode: permanentPinController.text,
                              studentPhotoPath: candidatefilePath.value,
                              studentSignaturePath:
                                  candidateSignaturefilePath.value,
                              interMarksheetPath:
                                  selectDegree.value == 'UG'
                                      ? intermediatefilePath.value
                                      : null,
                              highschoolMarksheet:
                                  selectDegree.value == 'PG'
                                      ? highSchMarkfilePath.value
                                      : null,
                              graduationMarksPath:
                                  selectDegree.value == 'PG'
                                      ? graduatinMarkfilePath.value
                                      : null,
                              ugPart2SemMarksheet:
                                  selectDegree.value == 'PG'
                                      ? ugpart2filePath.value
                                      : null,
                            ),
                          );
                        }
                      } else {
                        details.onStepContinue!();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(w * 0.3, h * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color(0xFFD2093C),
                    ),
                    child: Text(
                      _currentStep == 2 ? 'Submit' : 'Next',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() => _currentStep += 1);
            } else {
              // Submit form
              print("Step 1: ${_step1Controller.text}");
              print("Step 2: ${_step2Controller.text}");
              print("Step 3: ${_step3Controller.text}");
              // Add your submit logic here
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep -= 1);
            }
          },
          steps: [
            Step(
              title: const Text('Step 1'),
              content: buildStepContentStep1(),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            ),
            //step 2
            Step(
              title: const Text('Step 2'),
              content: buildStepContentStep2(),
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('Step 3'),
              content: buildStepContentStep3(),
              isActive: _currentStep >= 2,
              state: _currentStep == 2 ? StepState.editing : StepState.indexed,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStepContentStep1() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey0,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          // SizedBox(height: 20),

          // Dropdown for Degree
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
              label: 'Degree',
              items: upperCaseItems,
              selectedItem:
                  upperCaseItems.contains(selectDegree.value.toUpperCase())
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
                  return "   Please select Degree";
                }
                return null;
              },
              hint: 'Select Degree',
              icon: Image.asset("assets/images/student_as.png"),
              suffixIcon: Image.asset("assets/images/dropArrow.png"),
            );
          }),
          SizedBox(height: 20),
          // Dropdown for LURN
          CustomWidgets.customTextFeild(
            context: context,
            label: 'LURN',
            controller: lurnController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Lucknow University Registration No(LURN)*';
              }
              return null;
            },
            hint: 'Lucknow University Registration No.(LURN)',
            icon: Image.asset("assets/images/candidate.png"),

            // focusNode: FocusNode(),
            iconColor: Colors.blue,

            action: TextInputAction.next,
          ),
          SizedBox(height: 20),
          // Dropdown for Registration No
          CustomWidgets.customTextFeild(
            context: context,
            isReadyOnly: true,
            label: 'Registration No',
            focusNode: _focusReg,
            keyboardtype: TextInputType.text,
            controller: regisC,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Enter your Registration No';
              }
              return null;
            },
            hint: "Registration No",

            icon: Image.asset("assets/images/regis.png"),
            iconColor: Colors.lightBlue,
            action: TextInputAction.next,
          ),
          SizedBox(height: 20),
          // Dropdown for Name
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Your Name',
            controller: nameController,
            isReadyOnly: true,
            keyboardtype: TextInputType.text,
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

            action: TextInputAction.next,
          ),

          SizedBox(height: 20),
          // Dropdown for Gender and Date of Birth
          Row(
            children: [
              Flexible(
                child: CustomWidgets.customDropdownField(
                  context: context,
                  items: signupController.gender,
                  readOnly: true,
                  label: 'Gender',
                  selectedItem: signupController.studentDetails.value.gender,
                  onChanged: (value) {
                    gender = value.toString();
                    print(gender);
                  },
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                // "${selectedDate.value!.day}/${selectedDate.value!.month}/${selectedDate.value!.year}",
                                signupController
                                    .studentDetails
                                    .value
                                    .dateofbirth
                                    .toString(),
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
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Dropdown for Email
          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Email',
            hint: 'Enter your email',
            controller: emailController,
            isReadyOnly: true,
            keyboardtype: TextInputType.emailAddress,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Please enter your email';
              }
              return null;
            },
            // focusNode: FocusNode(),
            icon: Image.asset("assets/images/email.png"),
            iconColor: Colors.blue,

            action: TextInputAction.done,
          ),
          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Your Mobile',
            controller: mobileController,
            isReadyOnly: true,
            hint: 'Enter your mobile number',
            keyboardtype: TextInputType.number,
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

          // Dropdown for Aadhaar
          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Aadhaar',
            isReadyOnly: true,
            controller: aadhaarController,
            keyboardtype: TextInputType.number,
            validate: (usermobile) {
              if (usermobile.isEmpty || usermobile.length > 12) {
                return "   Enter Aadhaar No";
              }
            },
            hint: 'Enter your Aadhaar number',
            // focusNode: FocusNode(),
            icon: Image.asset("assets/images/aadhar.png"),
            iconColor: Colors.blue,
            isPassword: false,
            action: TextInputAction.done,
          ),
          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Father Name',
            isReadyOnly: true,
            controller: fatherNameController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Enter your father name';
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
          // Dropdown for Father's Annual Income
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Annual Income',
            controller: fannualController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Father Annual Income';
              }
              return null;
            },
            hint: 'Father Annual Income',
            // focusNode: FocusNode(),
            icon: Image.asset("assets/images/aadhar.png"),
            iconColor: Colors.blue,

            action: TextInputAction.done,
          ),
          SizedBox(height: 20),
          Obx(
            () => CustomWidgets.customDropdownField(
              context: context,
              items: homeController.occupation,
              label: 'Father Occupation',
              selectedItem:
                  homeController.occupation.contains(selectFOccupation.value)
                      ? selectFOccupation.value
                      : null,
              onChanged: (value) {
                if (value != null) {
                  selectFOccupation.value = value;
                }
              },
              validate: (userC) {
                if (userC == null || userC.isEmpty) {
                  return "    Father Occupation";
                }
                return null;
              },
              hint: 'Father Occupation',
              icon: Image.asset("assets/images/category.png"),
              suffixIcon: Image.asset("assets/images/dropArrow.png"),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }), // Hide SizedBox
          // Show when not B.P.Ed
          Obx(
            () => Visibility(
              visible: selectDegree.value == "B.P.Ed",
              child: CustomWidgets.customTextFeild(
                context: context,
                label: 'Father mobile',
                controller: fatherMobileNoController,

                keyboardtype: TextInputType.number,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return '   Father mobile number';
                  }
                  return null;
                },
                hint: 'Father mobile number',
                // focusNode: FocusNode(),
                icon: Image.asset("assets/images/aadhar.png"),
                iconColor: Colors.blue,

                action: TextInputAction.done,
              ),
            ),
          ),

          SizedBox(height: 20), // Hide SizedBox
          // Show when not B.P.Ed
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Mother Name',
            controller: mothernameController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Enter your Mother name';
              }
              return null;
            },
            hint: 'Enter your mother name',
            // focusNode: FocusNode(),
            icon: Image.asset("assets/images/student_as.png"),
            iconColor: Colors.blue,

            action: TextInputAction.next,
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hides the widget
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),

          Obx(
            () => Visibility(
              visible: selectDegree.value == "B.P.Ed",
              child: CustomWidgets.customTextFeild(
                context: context,
                label: 'Nationality',
                controller: nationalityController,
                keyboardtype: TextInputType.text,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return '   Nationality*';
                  }
                  return null;
                },
                hint: 'Nationality',
                // focusNode: FocusNode(),
                icon: Image.asset("assets/images/student_as.png"),
                iconColor: Colors.blue,

                action: TextInputAction.next,
              ),
            ),
          ),
          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Annual Income',
            controller: mAnnualController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Mother Annual Income';
              }
              return null;
            },
            hint: 'Mother Annual Income',
            // focusNode: FocusNode(),
            icon: Image.asset("assets/images/aadhar.png"),
            iconColor: Colors.blue,

            action: TextInputAction.done,
          ),
          SizedBox(height: 20),

          // CustomWidgets.customDropdownField(
          //   context: context,
          //   items: homeController.motheroccupation,
          //   selectedItem:
          //       homeController.motheroccupation.contains(
          //             selectMOccupation.value,
          //           )
          //           ? selectMOccupation.value
          //           : null,
          //   onChanged: (value) {
          //     if (value != null) {
          //       selectMOccupation.value = value;
          //     }
          //   },
          //   validate: (userC) {
          //     if (userC == null || userC.isEmpty) {
          //       return "    Mother  Occupation";
          //     }
          //     return null;
          //   },
          //   hint: 'Mother Occupation',
          //   icon: Image.asset("assets/images/category.png"),
          //   suffixIcon: Image.asset("assets/images/dropArrow.png"),
          // ),
          Obx(
            () => CustomWidgets.customDropdownField(
              context: context,
              items: homeController.motheroccupation,
              label: 'Mother Occupation',
              selectedItem:
                  homeController.motheroccupation.contains(
                        selectMOccupation.value,
                      )
                      ? selectMOccupation.value
                      : null,
              onChanged: (value) {
                if (value != null) {
                  selectMOccupation.value = value;
                }
              },
              validate: (userC) {
                if (userC == null || userC.isEmpty) {
                  return "    Mother Occupation";
                }
                return null;
              },
              hint: 'Mother Occupation',
              icon: Image.asset("assets/images/category.png"),
              suffixIcon: Image.asset("assets/images/dropArrow.png"),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }), // Hide SizedBox
          // Show when not B.P.Ed
          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return CustomWidgets.customTextFeild(
                context: context,
                label: 'Mother Mobile',
                controller: motherMobileNoCont,

                keyboardtype: TextInputType.number,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return '   Mother mobile number';
                  }
                  return null;
                },
                hint: 'Mother mobile number',
                // focusNode: FocusNode(),
                icon: Image.asset("assets/images/aadhar.png"),
                iconColor: Colors.blue,

                action: TextInputAction.done,
              );
            }
            return SizedBox.shrink(); // Hides the widget
          }),

          SizedBox(height: 20),
          Obx(
            () => Visibility(
              visible: selectDegree.value == "UG",
              child: CustomWidgets.customDropdownField(
                context: context,

                readOnly: true,
                items: signupController.ugCourse,
                label: 'Course',
                selectedItem:
                    signupController.ugCourse.contains(selectCourse.value)
                        ? selectCourse.value
                        : null,
                // signupController.studentDetails.value.course,
                onChanged: (value) {
                  if (value != null) {
                    selectCourse.value = value;
                  }
                  print(selectCourse.value);
                },
                validate: (userC) {
                  if (userC == null || userC.isEmpty) {
                    return "   Please select Degree";
                  }
                  return null;
                },
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
                items: signupController.pgCourse,
                label: "Course",
                selectedItem:
                    signupController.pgCourse.contains(selectCourse.value)
                        ? selectCourse.value
                        : null,
                onChanged: (value) {
                  if (value != null) {
                    selectCourse.value = value;
                  }
                  print(selectCourse.value);
                },
                validate: (userC) {
                  if (userC == null || userC.isEmpty) {
                    return "   Please select Degree";
                  }
                  return null;
                },
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
                items: signupController.bpedCourse,
                label: "Course",
                selectedItem:
                    signupController.bpedCourse.contains(selectCourse.value)
                        ? selectCourse.value
                        : null,
                onChanged: (value) {
                  if (value != null) {
                    selectCourse.value = value;
                  }
                  print(selectCourse.value);
                },
                validate: (userC) {
                  if (userC == null || userC.isEmpty) {
                    return "   Please select Course";
                  }
                  return null;
                },
                hint: 'Course',
                icon: Image.asset("assets/images/course.png"),
                suffixIcon: Image.asset("assets/images/dropArrow.png"),
              ),
            ),
          ),
          SizedBox(height: 20),

          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return SizedBox.shrink(); // Hides the widget
            }

            return CustomWidgets.customDropdownField(
              context: context,
              readOnly: true,
              items: signupController.category,
              label: 'Category',
              selectedItem:
                  signupController.category.contains(selectCategory.value)
                      ? selectCategory.value
                      : null,
              onChanged: (value) {
                if (value != null) {
                  selectCategory.value = value;
                }
                print(selectDegree.value);
              },
              validate: (userC) {
                if (userC == null || userC.isEmpty) {
                  return "   Please select Category";
                }
                return null;
              },
              hint: 'Category',
              icon: Image.asset("assets/images/category.png"),
              suffixIcon: Image.asset("assets/images/dropArrow.png"),
            );
          }),

          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox.shrink() // Hide SizedBox
                : SizedBox(height: 20); // Show when not B.P.Ed
          }),
          Obx(
            () => Visibility(
              visible: selectDegree.value == "B.P.Ed",
              child: CustomWidgets.customDropdownField(
                context: context,
                label: 'Domicile Certificate',
                items: domicile,
                selectedItem:
                    domicile.contains(selectDomicile.value)
                        ? selectDomicile.value
                        : null,
                onChanged: (value) {
                  if (value != null) {
                    selectDomicile.value = value;
                  }
                  print(selectDomicile.value);
                },
                validate: (userC) {
                  if (userC == null || userC.isEmpty) {
                    return "   Select Domicile";
                  }
                  return null;
                },
                hint: 'Domicile',
                icon: Image.asset("assets/images/category.png"),
                suffixIcon: Image.asset("assets/images/dropArrow.png"),
              ),
            ),
          ),
          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return SizedBox(height: 20); // Hides the widget
            }
            return SizedBox.shrink();
          }), // Show when not B.P.Ed}),

          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return SizedBox.shrink(); // Hides the widget
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                '*only .jpg .jpeg .gif .png format and less than 100 kb file\n accepted.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            );
          }),
          Obx(() {
            // Replace this with your actual selected course variable
            if (selectDegree.value == 'B.P.Ed') {
              return SizedBox.shrink(); // Hides the widget
            }

            return GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                );

                if (result != null) {
                  domicilefileName.value = result.files.single.name;
                  domicilefilePath.value = result.files.single.path ?? '';
                  print("Selected path: ${domicilefilePath.value}");
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Domicile Certificate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            domicilefileName.value.isNotEmpty
                                ? domicilefileName.value
                                : "Domicile Certificate (jpg, png, gif)",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.upload_file, color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),

          SizedBox(height: 20),
          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return SizedBox.shrink(); // Hides the widget
            }

            return GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                );

                if (result != null) {
                  castefileName.value = result.files.single.name;
                  castefilePath.value = result.files.single.path ?? '';
                  print("Selected path: ${castefilePath.value}");
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Caste Certificate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            castefileName.value.isNotEmpty
                                ? castefileName.value
                                : "Caste Certificate (jpg, png, gif)",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.upload_file, color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget buildStepContentStep2() {
    return Form(
      key: _formKey1,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          // SizedBox(height: 20),
          Obx(
            () => CustomWidgets.customDropdownField(
              context: context,
              items: homeController.bloodgroup,
              label: 'Blood Group',
              selectedItem:
                  homeController.bloodgroup.contains(selectBloodGroup.value)
                      ? selectBloodGroup.value
                      : null,
              onChanged: (value) {
                if (value != null) {
                  selectBloodGroup.value = value;
                }
                print(selectBloodGroup.value);
              },
              validate: (userC) {
                if (userC == null || userC.isEmpty) {
                  return "   Please select Blood Group";
                }
                return null;
              },
              hint: 'Select Blood Group',
              icon: Image.asset("assets/images/student_as.png"),
              suffixIcon: Image.asset("assets/images/dropArrow.png"),
            ),
          ),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: SizedBox(height: 20),
          ),

          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: CustomWidgets.customTextFeild(
              context: context,
              label: 'Category',
              // focusNode: _lastExmFocus,
              keyboardtype: TextInputType.text,
              controller: categoryController,
              validate: (userC) {
                if (userC!.isEmpty) {
                  return "  Select Category";
                } else {
                  return null;
                }
              },
              hint: "Category",
              icon: Image.asset("assets/images/regis.png"),
              iconColor: Colors.lightBlue,
              action: TextInputAction.next,
            ),
          ),
          SizedBox(height: 20),
          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return SizedBox.shrink(); // Hides the widget
            }

            return CustomWidgets.customDropdownField(
              context: context,
              items: homeController.religion,
              label: 'Religion',
              selectedItem:
                  homeController.religion.contains(selectReligon.value)
                      ? selectReligon.value
                      : null,
              onChanged: (value) {
                if (value != null) {
                  selectReligon.value = value;
                }
                print(selectReligon.value);
              },
              validate: (userC) {
                if (userC == null || userC.isEmpty) {
                  return "   Please select Religion";
                }
                return null;
              },
              hint: 'Select Religion',
              icon: Image.asset("assets/images/course.png"),
              suffixIcon: Image.asset("assets/images/dropArrow.png"),
            );
          }),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox.shrink() // Hide SizedBox
                : SizedBox(height: 20); // Show when not B.P.Ed
          }),

          Obx(
            () => CustomWidgets.customDropdownField(
              context: context,
              items: homeController.caste,
              label: 'Caste',
              selectedItem:
                  homeController.caste.contains(selectCaste.value)
                      ? selectCaste.value
                      : null,
              onChanged: (value) {
                if (value != null) {
                  selectCaste.value = value;
                }
                print(selectCaste.value);
              },
              validate: (userC) {
                if (userC == null || userC.isEmpty) {
                  return "   Please select Caste";
                }
                return null;
              },
              hint: 'Select Caste',
              icon: Image.asset("assets/images/course.png"),
              suffixIcon: Image.asset("assets/images/dropArrow.png"),
            ),
          ),

          //Bped for skill test
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),

          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return CustomWidgets.customDropdownField(
                context: context,
                items: ["1st", "2nd", "3rd", "4th"],
                selectedItem:
                    ["1st", "2nd", "3rd", "4th"].contains(selectSkillTest.value)
                        ? selectSkillTest.value
                        : null,
                onChanged: (value) {
                  if (value != null) {
                    selectSkillTest.value = value;
                  }
                  print(selectSkillTest.value);
                },
                validate: (userC) {
                  if (userC == null || userC.isEmpty) {
                    return "   Please select Skill Test";
                  }
                  return null;
                },
                hint: 'Skill Test',
                icon: Image.asset("assets/images/course.png"),
                suffixIcon: Image.asset("assets/images/dropArrow.png"),
              );
            }
            return SizedBox.shrink(); // Hides the widget
          }),

          //
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox.shrink() // Hide SizedBox
                : SizedBox(height: 20); // Show when not B.P.Ed
          }),
          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return SizedBox.shrink(); // Hides the widget
            }

            return CustomWidgets.customTextFeild(
              context: context,
              label: 'Nationality',
              controller: nationalityController,
              keyboardtype: TextInputType.text,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return '   Nationality*';
                }
                return null;
              },
              hint: 'Nationality*',
              icon: Image.asset("assets/images/candidate.png"),

              // focusNode: FocusNode(),
              iconColor: Colors.blue,

              action: TextInputAction.next,
            );
          }),
          SizedBox(height: 20),

          CustomWidgets.customTextFeild(
            context: context,
            focusNode: _lastExmFocus,
            label: 'Last Examination Passed',
            keyboardtype: TextInputType.text,
            controller: lastExmController,
            validate: (userC) {
              if (userC!.isEmpty) {
                return "   Name of Last Examination Passed";
              } else {
                return null;
              }
            },
            hint: "Name of Last Examination Passed",
            icon: Image.asset("assets/images/regis.png"),
            iconColor: Colors.lightBlue,
            action: TextInputAction.next,
          ),
          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Last Institution Attended',
            controller: lastInstController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '    Last Institution Attended';
              }
              return null;
            },
            hint: 'Institution(Last Attended)',
            icon: Image.asset("assets/images/candidate.png"),

            // focusNode: FocusNode(),
            iconColor: Colors.blue,
            isPassword: false,
            action: TextInputAction.next,
          ),
          SizedBox(height: 20),

          CustomWidgets.customTextFeild(
            context: context,
            label: 'Board/University',
            hint: 'Board/University',
            controller: BoarduniverController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Board/University';
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
            label: 'Passing Year',
            items: homeController.passingyear,
            selectedItem:
                homeController.passingyear.contains(selectYear.value)
                    ? selectYear.value
                    : null,
            onChanged: (value) {
              if (value != null) {
                selectYear.value = value;
              }
              print(selectYear.value);
            },
            validate: (userC) {
              if (userC == null || userC.isEmpty) {
                return "    Year of Passing";
              }
              return null;
            },
            hint: 'Select Year of Passing',
            icon: Image.asset("assets/images/course.png"),
            suffixIcon: Image.asset("assets/images/dropArrow.png"),
          ),

          SizedBox(height: 20),

          Text(
            '*if Current Result is Not Available Kindly Mark “0”(Zero)\n For Marks.',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),

          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Maximum Marks',
            controller: mmController,
            hint: 'Maximum Marks*',
            keyboardtype: TextInputType.number,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '  Please enter your Maximum Marks*';
              }
              return null;
            },
            // focusNode: FocusNode(),
            icon: Image.asset("assets/images/mobile.png"),
            iconColor: Colors.blue,

            action: TextInputAction.done,
          ),
          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Obtained Marks*',
            controller: OmController,
            keyboardtype: TextInputType.number,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Please enter your Obtained Marks*';
              }
              return null;
            },
            hint: 'Obtained Marks*',
            // focusNode: FocusNode(),
            icon: Image.asset("assets/images/aadhar.png"),
            iconColor: Colors.blue,
            isPassword: false,
            action: TextInputAction.done,
          ),
          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Percentage(%)*',
            controller: perController,
            keyboardtype: TextInputType.number,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Please enter your Percentage(%)*';
              }
              return null;
            },
            hint: 'Percentage(%)*',
            // focusNode: FocusNode(),
            icon: Image.asset("assets/images/student_as.png"),
            iconColor: Colors.blue,

            action: TextInputAction.next,
          ),
          SizedBox(height: 20),
          Text(
            "(*Total of best five Subjects )",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: CustomWidgets.customTextFeild(
              context: context,
              label: 'Name of Game Participated**',
              controller: GparticipatedController,
              keyboardtype: TextInputType.text,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return '   Name of Game Participated**';
                }
                return null;
              },
              hint: 'Name of Game Participated*',
              // focusNode: FocusNode(),
              icon: Image.asset("assets/images/student_as.png"),
              iconColor: Colors.blue,

              action: TextInputAction.next,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Visibility(
              visible: selectDegree.value == "B.P.Ed",
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "See Instructions",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),

          Obx(
            () => Visibility(
              visible: selectDegree.value == "B.P.Ed",
              child: CustomWidgets.customDropdownField(
                context: context,
                label: 'Lebel of Participation',
                items: ["1st-level", "2nd-level", "3rd-level", "4th-level"],
                selectedItem:
                    [
                          "1st-level",
                          "2nd-level",
                          "3rd-level",
                          "4th-level",
                        ].contains(selectLevel.value)
                        ? selectLevel.value
                        : null,
                onChanged: (value) {
                  if (value != null) {
                    selectLevel.value = value;
                  }
                  print(selectLevel.value);
                },
                validate: (userC) {
                  if (userC == null || userC.isEmpty) {
                    return "   Level of Participation*";
                  }
                  return null;
                },
                hint: 'Lebel of Participation*',
                icon: Image.asset("assets/images/course.png"),
                suffixIcon: Image.asset("assets/images/dropArrow.png"),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),

          Obx(
            () => Visibility(
              visible: selectDegree.value == "B.P.Ed",
              child: CustomWidgets.customDropdownField(
                context: context,
                items: [
                  "1st-Position",
                  "2nd-Position",
                  "3rd-Position",
                  "4th-Position",
                ],
                selectedItem:
                    [
                          "1st-Position",
                          "2nd-Position",
                          "3rd-Position",
                          "4th-Position",
                        ].contains(selectPosition.value)
                        ? selectPosition.value
                        : null,
                onChanged: (value) {
                  if (value != null) {
                    selectPosition.value = value;
                  }
                  print(selectPosition.value);
                },
                validate: (userC) {
                  if (userC == null || userC.isEmpty) {
                    return "   Position Held*";
                  }
                  return null;
                },
                hint: 'Position Held*',
                icon: Image.asset("assets/images/course.png"),
                suffixIcon: Image.asset("assets/images/dropArrow.png"),
              ),
            ),
          ),

          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: Text(
              "*Only .jpg .jpeg .gif .png format and less than 100 kb file accepted.",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: Text(
              "Upload 1 Game-Participation Certificate*",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 10),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: Obx(
              () => GestureDetector(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                      );

                  if (result != null) {
                    gamefileName.value = result.files.single.name;
                    gamefilePath.value = result.files.single.path ?? '';
                    print("Selected path: ${gamefilePath.value}");
                  }
                },
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          gamefileName.value.isNotEmpty
                              ? gamefileName.value
                              : "Upload 1 Game-Participation Certificate*",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.upload_file, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: Text(
              "Were You a Student of Lko. Christian Collage*",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 10) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),

          Obx(
            () => Visibility(
              visible: selectDegree.value == "B.P.Ed",
              child: CustomWidgets.customDropdownField(
                context: context,
                items: ["Yes", "No"],
                selectedItem:
                    ["Yes", "No"].contains(selectStudent.value)
                        ? selectStudent.value
                        : null,
                onChanged: (value) {
                  if (value != null) {
                    selectStudent.value = value;
                  }
                  print(selectStudent.value);
                },
                validate: (userC) {
                  if (userC == null || userC.isEmpty) {
                    return "   Please select Student of Lko. Christian Collage*";
                  }
                  return null;
                },
                hint: 'Student of Lko. Christian Collage*',
                icon: Image.asset("assets/images/course.png"),
                suffixIcon: Image.asset("assets/images/dropArrow.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStepContentStep3() {
    return Form(
      key: _formKey2,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          // Obx(() {
          //   return selectDegree.value == 'B.P.Ed'
          //       ? SizedBox.shrink() // Hide SizedBox
          //       : SizedBox(height: 20); // Show when not B.P.Ed
          // }),
          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return SizedBox.shrink(); // Hides the widget
            }
            return CustomWidgets.customTextFeild(
              context: context,
              label: "Father's Mobile",
              controller: fatherMobileNoController,
              keyboardtype: TextInputType.number,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return '   Father name*';
                }
                return null;
              },
              hint: "Father's Mobile*",
              icon: Image.asset("assets/images/candidate.png"),

              // focusNode: FocusNode(),
              iconColor: Colors.blue,
              isPassword: false,
              action: TextInputAction.next,
            );
          }),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox.shrink() // Hide SizedBox
                : SizedBox(height: 20); // Show when not B.P.Ed
          }),

          Obx(() {
            if (selectDegree.value == 'B.P.Ed') {
              return SizedBox.shrink(); // Hides the widget
            }
            return CustomWidgets.customTextFeild(
              context: context,
              label: "Mother's Mobile",
              keyboardtype: TextInputType.number,
              controller: motherMobileNoCont,
              validate: (userC) {
                if (userC!.isEmpty) {
                  return "   Mother's Mobile*";
                } else {
                  return null;
                }
              },
              hint: "Mother's Mobile*",
              icon: Image.asset("assets/images/regis.png"),
              iconColor: Colors.lightBlue,
              action: TextInputAction.next,
            );
          }),
          SizedBox(height: 20),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Present Address',
            controller: presentAddressController,
            maxLines: 5,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Please enter your present address';
              }
              return null;
            },
            hint: 'Present address',

            // icon: Image.asset("assets/images/candidate.png"),

            // focusNode: FocusNode(),
            iconColor: Colors.blue,
            isPassword: false,
            action: TextInputAction.next,
          ),
          SizedBox(height: 20),

          CustomWidgets.customTextFeild(
            context: context,
            label: 'Pincode',
            hint: 'Pincode',
            controller: presentPinController,
            keyboardtype: TextInputType.number,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Please enter your pincode';
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
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Nearest Railway Station',
            hint: 'Nearest Railway Station',

            controller: NRSController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Nearest Railway Station*';
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
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Nearest Police Station',
            hint: 'Nearest Police Station',

            controller: NPSController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Nearest Police Station*';
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

          SizedBox(height: 10),
          Obx(
            () => GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                );

                if (result != null) {
                  aadharfileName.value = result.files.single.name;
                  aadharfilePath.value = result.files.single.path ?? '';
                  print("Selected path: ${aadharfilePath.value}");
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aadhar Card",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            aadharfileName.value.isNotEmpty
                                ? aadharfileName.value
                                : "Aadhaar Card (jpg, png, gif)",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.upload_file, color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "*Only .jpg .jpeg .gif .png format and less than 100 kb\n file accepted.",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Same As above (if Applicable)",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Container(
                height: 16,
                width: 16,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isChecked
                            ? Colors.transparent
                            : Colors.white, // White border when not selected
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    4,
                  ), // Optional: Make edges rounded
                ),
                child: Checkbox(
                  value: isChecked,
                  checkColor: Colors.red, // Tick color
                  activeColor: Colors.white, // Background color when selected
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Permanent Address',
            controller:
                isChecked ? presentAddressController : permanentAddController,
            maxLines: 5,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Please enter your Permanent address';
              }
              return null;
            },
            hint: 'Permanent address',

            // icon: Image.asset("assets/images/candidate.png"),

            // focusNode: FocusNode(),
            iconColor: Colors.blue,
            isPassword: false,
            action: TextInputAction.next,
          ),
          SizedBox(height: 20),

          CustomWidgets.customTextFeild(
            context: context,
            label: 'Pincode',
            hint: 'Pincode',
            controller: permanentPinController,
            keyboardtype: TextInputType.number,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Please enter your pincode';
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
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Nearest Railway Dtation',
            hint: 'Nearest Railway Station',

            controller: permanNRSController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Nearest Railway Station*';
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
          CustomWidgets.customTextFeild(
            context: context,
            label: 'Nearest Police Station',
            hint: 'Nearest Police Station',

            controller: permanentNPSController,
            keyboardtype: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return '   Nearest Police Station*';
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

          Obx(
            () => GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                );

                if (result != null) {
                  candidatefileName.value = result.files.single.name;
                  candidatefilePath.value = result.files.single.path ?? '';
                  print("Selected path: ${candidatefilePath.value}");
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Candidate Photo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            candidatefileName.value.isNotEmpty
                                ? candidatefileName.value
                                : "Candidate Photo (jpg, png, gif)",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.upload_file, color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "*Only .jpg .jpeg .gif .png format and less than 100 kb\n file accepted.",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          SizedBox(height: 20),

          Obx(
            () => GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                );

                if (result != null) {
                  candidateSignaturefileName.value = result.files.single.name;
                  candidateSignaturefilePath.value =
                      result.files.single.path ?? '';
                  print("Selected path: ${candidateSignaturefilePath.value}");
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Candidate Signature",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            candidateSignaturefileName.value.isNotEmpty
                                ? candidateSignaturefileName.value
                                : "Candidate Signature (jpg, png, gif)",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.upload_file, color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Graduation 2nd
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: Text(
              "Graduation 2nd Year(For App. Ca. Marksheet)*",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 10) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: Obx(
              () => GestureDetector(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                      );

                  if (result != null) {
                    gra2yrfileName.value = result.files.single.name;
                    gra2yrfilePath.value = result.files.single.path ?? '';
                    print("Selected path: ${gra2yrfilePath.value}");
                  }
                },
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          gra2yrfileName.value.isNotEmpty
                              ? gra2yrfilePath.value
                              : "Graduation 2nd Year (jpg, png, gif)",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.upload_file, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //
          //high school mark
          Obx(() {
            return selectDegree.value == 'B.P.Ed' || selectDegree.value == 'PG'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible:
                selectDegree.value == 'B.P.Ed' || selectDegree.value == 'PG',
            child: Text(
              "High School Marksheet*",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed' || selectDegree.value == 'PG'
                ? SizedBox(height: 10) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible:
                selectDegree.value == 'B.P.Ed' || selectDegree.value == 'PG',
            child: Obx(
              () => GestureDetector(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                      );

                  if (result != null) {
                    highSchMarkfileName.value = result.files.single.name;
                    highSchMarkfilePath.value = result.files.single.path ?? '';
                    print("Selected path: ${highSchMarkfilePath.value}");
                  }
                },
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          highSchMarkfileName.value.isNotEmpty
                              ? highSchMarkfileName.value
                              : "High School Marksheet* (jpg, png, gif)",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.upload_file, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //
          // CasteCertificate
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: Text(
              "Caste Certificate*",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 10) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: Obx(
              () => GestureDetector(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                      );

                  if (result != null) {
                    castCertifileName.value = result.files.single.name;
                    castCertifilePath.value = result.files.single.path ?? '';
                    print("Selected path: ${castCertifilePath.value}");
                  }
                },
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          castCertifileName.value.isNotEmpty
                              ? castCertifileName.value
                              : "Caste Certificate* (jpg, png, gif)",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.upload_file, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //
          Obx(() {
            return selectDegree.value == 'B.P.Ed'
                ? SizedBox(height: 10) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "B.P.Ed",
            child: Text(
              "*Only .jpg .jpeg .gif .png format and less than 100 kb\n file accepted.",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
          Visibility(
            visible: selectDegree.value == "PG",
            child: SizedBox(height: 20),
          ),
          Visibility(
            visible: selectDegree.value == "PG",
            child: Text(
              "Graduation/Marksheet*",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          SizedBox(height: 10),
          Obx(
            () => GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                );

                if (result != null) {
                  graduatinMarkfileName.value = result.files.single.name;
                  graduatinMarkfilePath.value = result.files.single.path ?? '';
                  print("Selected path: ${graduatinMarkfilePath.value}");
                }
              },
              child: Visibility(
                visible: selectDegree.value == "PG",
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          graduatinMarkfileName.value.isNotEmpty
                              ? graduatinMarkfileName.value
                              : "Graduation/Marksheet (jpg, png, gif)",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.upload_file, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Visibility(
            visible: selectDegree.value == "PG",
            child: Text(
              "*Only .jpg .jpeg .gif .png format and less than 100 kb\n file accepted.",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),

          // SizedBox(height: 20),
          Visibility(
            visible: selectDegree.value == "PG",
            child: SizedBox(height: 20),
          ),
          Visibility(
            visible: selectDegree.value == "PG",
            child: Text(
              "UG part-2/5th Sem. Marksheet*",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          SizedBox(height: 10),
          Obx(
            () => GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                );

                if (result != null) {
                  ugpart2fileName.value = result.files.single.name;
                  ugpart2filePath.value = result.files.single.path ?? '';
                  print("Selected path: ${ugpart2filePath.value}");
                }
              },
              child: Visibility(
                visible: selectDegree.value == "PG",
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          ugpart2fileName.value.isNotEmpty
                              ? ugpart2fileName.value
                              : "UG part-2/5th Sem. Marksheet* (jpg, png, gif)",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.upload_file, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'PG'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "PG",
            child: Text(
              "*Only .jpg .jpeg .gif .png format and less than 100 kb\n file accepted.",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),

          // SizedBox(height: 20),
          Visibility(
            visible: selectDegree.value == "UG",
            child: Text(
              "Intermediate/equivalent Marksheet*",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'UG'
                ? SizedBox(height: 10) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Obx(
            () => GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                );

                if (result != null) {
                  intermediatefileName.value = result.files.single.name;
                  intermediatefilePath.value = result.files.single.path ?? '';
                  print("Selected path: ${intermediatefilePath.value}");
                }
              },
              child: Visibility(
                visible: selectDegree.value == "UG",
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          intermediatefileName.value.isNotEmpty
                              ? intermediatefileName.value
                              : "Intermediate/equivalent Marksheet(jpg, png, gif)",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.upload_file, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            return selectDegree.value == 'UG'
                ? SizedBox(height: 20) // Hide SizedBox
                : SizedBox.shrink(); // Show when not B.P.Ed
          }),
          Visibility(
            visible: selectDegree.value == "UG",
            child: Text(
              "*Only .jpg .jpeg .gif .png format and less than 100 kb\n file accepted.",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16,
                width: 16,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isCheckedTerms
                            ? Colors.transparent
                            : Colors.white, // White border when not selected
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    4,
                  ), // Optional: Make edges rounded
                ),
                child: Checkbox(
                  value: isCheckedTerms,
                  checkColor: Colors.red, // Tick color
                  activeColor: Colors.white, // Background color when selected
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedTerms = value ?? false;
                    });
                  },
                ),
              ),
              Visibility(
                visible: selectDegree.value == "UG",
                child: Expanded(
                  child: Text(
                    "  I certify that the particulars given by me in this Application Form are correct to the best of my knowledge and belief; any mistake/misinformation detected at the time of counseling or at any later stage will result in the cancellation of my Admission. I have carefully read the information/Prospectus of LCDC-2025-2026 and agree to abide by the terms and conditions laid down therein. Further, it is entirely my responsibility for admission to Under Graduate Courses of B.A./B.Sc.(Maths)/B.Sc.(Bio)/B.Com in respect of qualification and entitlement for admission against reserved category, if claimed, should be to the satisfaction of LCDC. Further, I undertake that I will be visiting the website (http://lcdc.edu.in) regularly for any information and I declare that all the information regarding Online Admission of LCDC-2025-2026, provided on the college website will be treated as served. I also understand that the application fees paid will not be refunded at any cost.",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: selectDegree.value == "PG",
                child: Expanded(
                  child: Text(
                    "  I certify that the particulars given by me in this Application Form are correct to the best of my knowledge and belief; any mistake/misinformation detected at the time of counseling or at any later stage will result in the cancellation of my Admission. I have carefully read the information/Prospectus of LCDC-2025-2026 and agree to abide by the terms and conditions laid down therein. Further, it is entirely my responsibility for admission to Post Graduate Courses of M.Sc.(Chemistry)/M.A.(English) in respect of qualification and entitlement for admission against reserved category, if claimed, should be to the satisfaction of LCDC. Further, I undertake that I will be visiting the website (http://lcdc.edu.in) regularly for any information and I declare that all the information regarding Online Admission of LCDC-2025-2026, provided on the college website will be treated as served. I also understand that the application fees paid will not be refunded at any cost.",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: selectDegree.value == "B.P.Ed",
                child: Expanded(
                  child: Text(
                    "  I hereby declare that all the above information given by me is true and accurate. There is no criminal case pending in any court of Law against me. If any information is found incorrect or misleading, my candidature shall be liable to be cancellation by the College at any time and I shall not be entitled for refund of any fee paid by me to the College.",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          Text(
            "*Please fill all steps (step 1, Step 2 and Step 3) / field / column. If any of the field is blank_ then The form will not get submitted.",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
