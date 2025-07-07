import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart' as pw;
import 'package:google_fonts/google_fonts.dart';
import 'package:lcdc_mobile_app/View/screens/HomeScreen/new_home_screen.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/student_threeStepFrom_request.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class ApplicationFormPage extends StatefulWidget {
  StudentRegistrationModel studentformdetail;
  ApplicationFormPage({super.key, required this.studentformdetail});

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  bool ifUGselected = true;
  bool ifPGselected = true;
  bool ifBPEDselected = true;

  Future<void> printDocument({
    required StudentRegistrationModel formDetail,
  }) async {
    // var logo = await AssetImage("assets/images/lcdc_logo.png");
    // var student = await formDetail.studentPhotoPath;
    // var intmark = await formDetail.interMarksheetPath;
    // var addpath = await formDetail.addressProofPath;
    // var sign = await formDetail.studentSignaturePath;

    final pw.MemoryImage logo = await imageFromAssetBundle(
      'assets/images/lcdc_logo.png',
    );
    final pw.MemoryImage? stude = await loadFileImage(
      formDetail.studentPhotoPath,
    );
    final pw.MemoryImage? inter = await loadFileImage(
      formDetail.interMarksheetPath,
    );
    final pw.MemoryImage? sign = await loadFileImage(
      formDetail.studentSignaturePath,
    );
    final pw.MemoryImage? addproof = await loadFileImage(
      formDetail.addressProofPath,
    );
    final pw.MemoryImage? graduation = await loadFileImage(
      formDetail.graduationMarksPath,
    );
    final pw.MemoryImage? highSchool = await loadFileImage(
      formDetail.highschoolMarksheet,
    );
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        margin: pw.EdgeInsets.all(10),
        pageFormat: PdfPageFormat.a4,
        build:
            (pw.Context context) => [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  // pw.Image(logo as pw.ImageProvider, height: 80),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Image(logo, height: 30),
                      pw.SizedBox(width: 10),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "LUCKNOW CHRISTIAN COLLEGE",
                            style: pw.TextStyle(
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "(AN ASSOCIATE POST GRADUATE COLLEGE OF LUCKNOW UNIVERSITY)",
                            style: pw.TextStyle(
                              fontSize: 8,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 5),
                  pw.Text(
                    "APPLICATION FOR ADMISSION\nSESSION : 2025-2026\nB.A. Semester - 1\nLURN : dgdsagsa\nPayment Type: Online",
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Text(
                    "Payment Id: pay_0ca6988NuvTFMsH (02-07-2025 11:50:34)",
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 10),

                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Table(
                          columnWidths: {
                            0: pw.IntrinsicColumnWidth(),
                            1: pw.FlexColumnWidth(),
                          },
                          children: [
                            pdfsave(
                              "1. Registration No.",
                              formDetail.registrationNumber.toString(),
                            ),
                            pdfsave(
                              "2. Name of Candidate",
                              formDetail.candidateName.toString(),
                            ),
                            pdfsave(
                              "3. Father's Name",
                              formDetail.fatherName.toString(),
                            ),
                            pdfsave(
                              "4. Annual Income",
                              formDetail.annualIncomeRs.toString(),
                            ),
                            pdfsave(
                              "5. Occupation",
                              formDetail.occupation.toString(),
                            ),
                            pdfsave(
                              "6. Mother's Name",
                              formDetail.motherName.toString(),
                            ),
                            pdfsave(
                              "7. Annual Income",
                              formDetail.motherAnnualIncomeRs.toString(),
                            ),
                            pdfsave(
                              "8. Occupation",
                              formDetail.motherOccupation.toString(),
                            ),
                            pdfsave(
                              "9. Date Of Birth",
                              formDetail.dateOfBirth.toString(),
                            ),
                            pdfsave(
                              "10. Mobile No.",
                              formDetail.mobileNumber.toString(),
                            ),
                            pdfsave(
                              "11. Email ID",
                              formDetail.emailId.toString(),
                            ),
                            pdfsave(
                              "12. Blood Group",
                              formDetail.bloodGroup.toString(),
                            ),
                            pdfsave("13. Gender", formDetail.gender.toString()),
                            pdfsave(
                              "14. Category",
                              formDetail.category.toString(),
                            ),
                            pdfsave(
                              "15. Nationality",
                              formDetail.nationality.toString(),
                            ),
                            pdfsave(
                              "16. Religion",
                              formDetail.religion.toString(),
                            ),
                            pdfsave(
                              "17. Course Applied",
                              formDetail.course.toString(),
                            ),
                            pdfsave(
                              "18. Name Of Last Exam",
                              formDetail.examinationName.toString(),
                            ),
                            pdfsave(
                              "19. Name Of Institute",
                              formDetail.institution.toString(),
                            ),
                            pdfsave(
                              "20. Board/University",
                              formDetail.boardUniversity.toString(),
                            ),
                            pdfsave(
                              "21. Year of Passing",
                              formDetail.passingYear.toString(),
                            ),
                            pdfsave(
                              "22. Max Marks",
                              formDetail.maximumMarks.toString(),
                            ),
                            pdfsave(
                              "23. Marks Obtained",
                              formDetail.marksObtained.toString(),
                            ),
                            pdfsave(
                              "24. Percentage",
                              formDetail.marksPercentage.toString(),
                            ),
                            pdfsave(
                              "25. Present Address",
                              formDetail.presentAddress.toString(),
                            ),
                            pdfsave(
                              "26. Pin Code",
                              formDetail.presentPincode.toString(),
                            ),
                            pdfsave(
                              "27. Near Railway Station",
                              formDetail.presentNearRailway.toString(),
                            ),
                            pdfsave(
                              "28. Police Station",
                              formDetail.presentNearPolice.toString(),
                            ),
                            pdfsave(
                              "29. Aadhaar ID",
                              formDetail.aadharId.toString(),
                            ),
                            pdfsave(
                              "30. Father's Mobile",
                              formDetail.fatherMobileNo.toString(),
                            ),
                            pdfsave(
                              "31. Mother's Mobile",
                              formDetail.motherMobileNumber.toString(),
                            ),
                            // add all rows similarly...
                          ],
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Column(
                        children: [
                          // pw.Image(student as pw.ImageProvider),
                          if (stude != null)
                            pw.Column(
                              children: [
                                pw.ClipRRect(
                                  horizontalRadius: 5,
                                  verticalRadius: 5,

                                  child: pw.Image(stude, height: 144, width: 144),
                                ),

                                pw.Text(
                                  "Candidate Photo",
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          // pw.SizedBox(height: 10),
                          // pw.Column(
                          //   children: [
                          //     // pw.Image(intmark as pw.ImageProvider),
                          //     if (inter != null)
                          //       pw.Column(
                          //         children: [
                          //           pw.ClipRRect(
                          //             horizontalRadius: 5,
                          //             verticalRadius: 5,
                          //             child: pw.Image(
                          //               inter,
                          //               height: 50,
                          //               width: 80,
                          //             ),
                          //           ),
                          //           pw.Image(inter, height: 50, width: 80),
                          //           pw.Text(
                          //             "Intermediate Marksheet",
                          //             style: pw.TextStyle(
                          //               fontSize: 8,
                          //               fontWeight: pw.FontWeight.bold,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //   ],
                          // ),
                          // pw.SizedBox(height: 10),
                          // pw.Column(
                          //   children: [
                          //     // pw.Image(intmark as pw.ImageProvider),
                          //     if (graduation != null)
                          //       pw.Column(
                          //         children: [
                          //           pw.ClipRRect(
                          //             horizontalRadius: 5,
                          //             verticalRadius: 5,
                          //             child: pw.Image(
                          //               graduation,
                          //               height: 50,
                          //               width: 80,
                          //             ),
                          //           ),

                          //           pw.Text(
                          //             "Graduation Marksheet",
                          //             style: pw.TextStyle(
                          //               fontSize: 8,
                          //               fontWeight: pw.FontWeight.bold,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //   ],
                          // ),
                          // pw.SizedBox(height: 10),
                          // pw.Column(
                          //   children: [
                          //     // pw.Image(intmark as pw.ImageProvider),
                          //     if (highSchool != null)
                          //       pw.Column(
                          //         children: [
                          //           pw.ClipRRect(
                          //             horizontalRadius: 5,
                          //             verticalRadius: 5,
                          //             child: pw.Image(
                          //               highSchool,
                          //               height: 50,
                          //               width: 80,
                          //             ),
                          //           ),

                          //           pw.Text(
                          //             "HighSchool Marksheet",
                          //             style: pw.TextStyle(
                          //               fontSize: 8,
                          //               fontWeight: pw.FontWeight.bold,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //   ],
                          // ),
                          // pw.SizedBox(height: 10),
                          // pw.Column(
                          //   children: [
                          //     // pw.Image(addpath as pw.ImageProvider),
                          //     if (addproof != null)
                          //       pw.Column(
                          //         children: [
                          //           pw.ClipRRect(
                          //             horizontalRadius: 5,
                          //             verticalRadius: 5,
                          //             child: pw.Image(
                          //               addproof,
                          //               height: 50,
                          //               width: 80,
                          //             ),
                          //           ),

                          //           pw.Text(
                          //             "Address Proof",
                          //             style: pw.TextStyle(
                          //               fontSize: 8,
                          //               fontWeight: pw.FontWeight.bold,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 10),

                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Column(
                        children: [
                          // pw.Image(intmark as pw.ImageProvider),
                          if (inter != null)
                            pw.Column(
                              children: [
                                pw.ClipRRect(
                                  horizontalRadius: 5,
                                  verticalRadius: 5,
                                  child: pw.Image(inter, height: 50, width: 80),
                                ),

                                pw.Text(
                                  "Intermediate Marksheet",
                                  style: pw.TextStyle(
                                    fontSize: 8,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      pw.Column(
                        children: [
                          // pw.Image(intmark as pw.ImageProvider),
                          if (graduation != null)
                            pw.Column(
                              children: [
                                pw.ClipRRect(
                                  horizontalRadius: 5,
                                  verticalRadius: 5,
                                  child: pw.Image(
                                    graduation,
                                    height: 50,
                                    width: 80,
                                  ),
                                ),

                                pw.Text(
                                  "Graduation Marksheet",
                                  style: pw.TextStyle(
                                    fontSize: 8,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      pw.Column(
                        children: [
                          // pw.Image(intmark as pw.ImageProvider),
                          if (highSchool != null)
                            pw.Column(
                              children: [
                                pw.ClipRRect(
                                  horizontalRadius: 5,
                                  verticalRadius: 5,
                                  child: pw.Image(
                                    highSchool,
                                    height: 50,
                                    width: 80,
                                  ),
                                ),

                                pw.Text(
                                  "HighSchool Marksheet",
                                  style: pw.TextStyle(
                                    fontSize: 8,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      pw.Column(
                        children: [
                          // pw.Image(addpath as pw.ImageProvider),
                          if (addproof != null)
                            pw.Column(
                              children: [
                                pw.ClipRRect(
                                  horizontalRadius: 5,
                                  verticalRadius: 5,
                                  child: pw.Image(
                                    addproof,
                                    height: 50,
                                    width: 80,
                                  ),
                                ),

                                pw.Text(
                                  "Address Proof",
                                  style: pw.TextStyle(
                                    fontSize: 8,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                  // pw.SizedBox(height: 8),
                  if (formDetail.course!.contains('B.A') ||
                      formDetail.course!.contains('B.Com') ||
                      formDetail.course!.contains('B.Sc(Bio)') ||
                      formDetail.course!.contains('B.Sc(Maths)')) ...[
                    pw.Padding(
                      padding: pw.EdgeInsets.all(2),
                      child: pw.Text(
                        "I certify that the particulars given by me in this Application Form are correct to the best of my knowledge and belief; any mistake/misinformation detected at the time of counseling or at any later stage will result in the cancellation of my Admission. I have carefully read the information/Prospectus of LCDC-2025-2026 and agree to abide by the terms and conditions laid down therein. Further, it is entirely my responsibility for admission to Under Graduate Courses of B.A./B.Sc.(Maths)/B.Sc.(Bio)/B.Com in respect of qualification and entitlement for admission against reserved category, if claimed, should be to the satisfaction of LCDC. Further, I undertake that I will be visiting the website (http://lcdc.edu.in) regularly for any information and I declare that all the information regarding Online Admission of LCDC-2025-2026, provided on the college website will be treated as served. I also understand that the application fees paid will not be refunded at any cost.",
                        textAlign: pw.TextAlign.justify,
                        style: pw.TextStyle(
                          fontSize: 5,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  if (formDetail.course!.contains('M.A. (English)') ||
                      formDetail.course!.contains('M.Sc.(Chemistry)')) ...[
                    pw.Padding(
                      padding: pw.EdgeInsets.all(2),
                      child: pw.Text(
                        "I certify that the particulars given by me in this Application Form are correct to the best of my knowledge and belief; any mistake/misinformation detected at the time of counseling or at any later stage will result in the cancellation of my Admission. I have carefully read the information/Prospectus of LCDC-2025-2026 and agree to abide by the terms and conditions laid down therein. Further, it is entirely my responsibility for admission to Post Graduate Courses of M.Sc.(Chemistry)/M.A.(English) in respect of qualification and entitlement for admission against reserved category, if claimed, should be to the satisfaction of LCDC. Further, I undertake that I will be visiting the website (http://lcdc.edu.in) regularly for any information and I declare that all the information regarding Online Admission of LCDC-2025-2026, provided on the college website will be treated as served. I also understand that the application fees paid will not be refunded at any cost.",
                        textAlign: pw.TextAlign.justify,
                        style: pw.TextStyle(
                          fontSize: 5,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  if (formDetail.course!.contains('B.P.Ed.')) ...[
                    pw.Padding(
                      padding: pw.EdgeInsets.all(2),
                      child: pw.Text(
                        "I hereby declare that all the above information given by me is true and accurate. There is no criminal case pending in any court of Law against me. If any information is found incorrect or misleading, my candidature shall be liable to be cancellation by the College at any time and I shall not be entitled for refund of any fee paid by me to the College.",
                        textAlign: pw.TextAlign.justify,
                        style: pw.TextStyle(
                          fontSize: 5,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ],

                  pw.SizedBox(height: 2),
                  pw.Text(
                    "Your Application form submission process is completed successfully...",
                    style: pw.TextStyle(
                      color: PdfColors.green,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Align(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Column(
                      children: [
                        // pw.Image(sign as pw.ImageProvider),
                        if (sign != null)
                          pw.Column(
                            children: [
                              pw.ClipRRect(
                                horizontalRadius: 5,
                                verticalRadius: 5,
                                child: pw.Image(sign, height: 20, width: 80),
                              ),

                              pw.Text(
                                "Full Signature of the Student",
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  pw.TableRow pdfsave(String label, String value) {
    return pw.TableRow(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 20, right: 100),
          child: pw.Text(
            label,
            style: pw.TextStyle(fontSize:8, fontWeight: pw.FontWeight.bold),
          ),
        ),

        pw.Padding(
          padding: const pw.EdgeInsets.all(4),
          child: pw.Text(
            value,
            style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Future<pw.ImageProvider> networkImageOrPlaceholder(String? url) async {
    try {
      final img = await networkImage(url ?? '');
      return img;
    } catch (_) {
      return pw.MemoryImage(Uint8List(0));
    }
  }

  // Future<pw.MemoryImage> loadFileImage(String filePath) async {
  //   final File file = File(filePath);
  //   final Uint8List bytes = await file.readAsBytes();
  //   return pw.MemoryImage(bytes);
  // }
  Future<pw.MemoryImage?> loadFileImage(String? path) async {
    if (path == null || path.isEmpty) return null;

    final file = File(path);
    if (await file.exists()) {
      final bytes = await file.readAsBytes();
      return pw.MemoryImage(bytes);
    }
    return null;
  }

  Future<pw.MemoryImage> imageFromAssetBundle(String path) async {
    final bytes = await rootBundle.load(path);
    return pw.MemoryImage(bytes.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    var formDetail = widget.studentformdetail;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Application Form"), centerTitle: true),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/images/lcdc_logo.png", height: 80),
                  const SizedBox(height: 10),
                  const Text(
                    "LUCKNOW CHRISTIAN COLLEGE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const FittedBox(
                    child: Text(
                      "(AN ASSOCIATE POST GRADUATE COLLEGE OF LUCKNOW UNIVERSITY)",
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "APPLICATION FOR ADMISSION\nSESSION : 2025–2026\nB.A. Semester - 1\nLURN : dgdsagsa\nPayment Type: Online",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  // const Text(
                  //   "Payment Id: pay_0ca6988NuvTFMsH (02-07-2025 11:50:34)",
                  // ),
                  FittedBox(
                    child: Text(
                      "Payment Id: pay_0ca6988NuvTFMsH (02-07-2025 11:50:34)",
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      _buildRow(
                        "1. Registration No.",
                        formDetail.registrationNumber.toString(),
                      ),
                      _buildRow(
                        "2. Name of Candidate",
                        formDetail.candidateName.toString(),
                      ),
                      _buildRow(
                        "3. Father’s Name",
                        formDetail.fatherName.toString(),
                      ),
                      _buildRow(
                        "4. Annual Income",
                        formDetail.annualIncomeRs.toString(),
                      ),
                      _buildRow(
                        "5. Occupation",
                        formDetail.occupation.toString(),
                      ),
                      _buildRow(
                        "6. Mother’s Name",
                        formDetail.motherName.toString(),
                      ),
                      _buildRow(
                        "7. Annual Income",
                        formDetail.motherAnnualIncomeRs.toString(),
                      ),
                      _buildRow(
                        "8. Occupation",
                        formDetail.motherOccupation.toString(),
                      ),
                      _buildRow(
                        "9. Date Of Birth",
                        formDetail.dateOfBirth.toString(),
                      ),
                      _buildRow(
                        "10. Mobile No.",
                        formDetail.mobileNumber.toString(),
                      ),
                      _buildRow("11. Email ID", formDetail.emailId.toString()),
                      _buildRow(
                        "12. Blood Group",
                        formDetail.bloodGroup.toString(),
                      ),
                      _buildRow("13. Gender", formDetail.gender.toString()),
                      _buildRow("14. Category", formDetail.category.toString()),
                      _buildRow(
                        "15. Nationality",
                        formDetail.nationality.toString(),
                      ),
                      _buildRow("16. Religion", formDetail.religion.toString()),
                      _buildRow(
                        "17. Course Applied",
                        formDetail.course.toString(),
                      ),
                      _buildRow(
                        "18. Name Of Last Exam",
                        formDetail.examinationName.toString(),
                      ),
                      _buildRow(
                        "19. Name Of Institute",
                        formDetail.institution.toString(),
                      ),
                      _buildRow(
                        "20. Board/University",
                        formDetail.boardUniversity.toString(),
                      ),
                      _buildRow(
                        "21. Year of Passing",
                        formDetail.passingYear.toString(),
                      ),
                      _buildRow(
                        "22. Max Marks",
                        formDetail.maximumMarks.toString(),
                      ),
                      _buildRow(
                        "23. Marks Obtained",
                        formDetail.marksObtained.toString(),
                      ),
                      _buildRow(
                        "24. Percentage",
                        formDetail.marksPercentage.toString(),
                      ),
                      _buildRow(
                        "25. Present Address",
                        formDetail.presentAddress.toString(),
                      ),
                      _buildRow(
                        "26. Pin Code",
                        formDetail.presentPincode.toString(),
                      ),
                      _buildRow(
                        "27. Near Railway Station",
                        formDetail.presentNearRailway.toString(),
                      ),
                      _buildRow(
                        "28. Police Station",
                        formDetail.presentNearPolice.toString(),
                      ),
                      _buildRow(
                        "29. Aadhaar ID",
                        formDetail.aadharId.toString(),
                      ),
                      _buildRow(
                        "30. Father Mobile",
                        formDetail.fatherMobileNo.toString(),
                      ),
                      _buildRow(
                        "31. Mother Mobile",
                        formDetail.motherMobileNumber.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  children: [
                    // Image.asset("assets/student_photo.png", height: 100),
                    buildCandidatePhoto(formDetail.studentPhotoPath),
                    const Text("Canditate Photo"),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible:
                    formDetail.course!.contains('B.A') ||
                    formDetail.course!.contains('B.Com') ||
                    formDetail.course!.contains('B.Sc(Bio)') ||
                    formDetail.course!.contains('B.Sc(Maths)'),
                child: Column(
                  children: [
                    buildCandidatePhoto(formDetail.interMarksheetPath),

                    const Text("Certificate"),
                  ],
                ),
              ),
              Visibility(
                visible:
                    formDetail.course!.contains('M.A.(English)') ||
                    formDetail.course!.contains('M.Sc.(Chemistry)'),
                child: Column(
                  children: [
                    buildCandidatePhoto(formDetail.graduationMarksPath),

                    const Text("UG Certificate"),
                  ],
                ),
              ),
              Visibility(
                visible:
                    formDetail.course!.contains('M.A. (English)') ||
                    formDetail.course!.contains('M.Sc.(Chemistry)'),
                child: Column(
                  children: [
                    buildCandidatePhoto(formDetail.highschoolMarksheet),

                    const Text("10th Certificate"),
                  ],
                ),
              ),
              Column(
                children: [
                  // Image.asset("assets/address_proof.png", height: 60),
                  buildCandidatePhoto(formDetail.addressProofPath),
                  const Text("Address Proof"),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),
          Visibility(
            visible:
                formDetail.course!.contains('B.A') ||
                formDetail.course!.contains('B.Com') ||
                formDetail.course!.contains('B.Sc(Bio)') ||
                formDetail.course!.contains('B.Sc(Maths)'),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                "I certify that the particulars given by me in this Application Form are correct to the best of my knowledge and belief; any mistake/misinformation detected at the time of counseling or at any later stage will result in the cancellation of my Admission. I have carefully read the information/Prospectus of LCDC-2025-2026 and agree to abide by the terms and conditions laid down therein. Further, it is entirely my responsibility for admission to Under Graduate Courses of B.A./B.Sc.(Maths)/B.Sc.(Bio)/B.Com in respect of qualification and entitlement for admission against reserved category, if claimed, should be to the satisfaction of LCDC. Further, I undertake that I will be visiting the website (http://lcdc.edu.in) regularly for any information and I declare that all the information regarding Online Admission of LCDC-2025-2026, provided on the college website will be treated as served. I also understand that the application fees paid will not be refunded at any cost.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Visibility(
            visible:
                formDetail.course!.contains('M.A. (English)') ||
                formDetail.course!.contains('M.Sc.(Chemistry)'),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                "I certify that the particulars given by me in this Application Form are correct to the best of my knowledge and belief; any mistake/misinformation detected at the time of counseling or at any later stage will result in the cancellation of my Admission. I have carefully read the information/Prospectus of LCDC-2025-2026 and agree to abide by the terms and conditions laid down therein. Further, it is entirely my responsibility for admission to Post Graduate Courses of M.Sc.(Chemistry)/M.A.(English) in respect of qualification and entitlement for admission against reserved category, if claimed, should be to the satisfaction of LCDC. Further, I undertake that I will be visiting the website (http://lcdc.edu.in) regularly for any information and I declare that all the information regarding Online Admission of LCDC-2025-2026, provided on the college website will be treated as served. I also understand that the application fees paid will not be refunded at any cost.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Visibility(
            visible: formDetail.course!.contains('BPED'),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                "I hereby declare that all the above information given by me is true and accurate. There is no criminal case pending in any court of Law against me. If any information is found incorrect or misleading, my candidature shall be liable to be cancellation by the College at any time and I shall not be entitled for refund of any fee paid by me to the College.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Text(
              "Your Application form submission process is completed successfully...",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                // Image.asset("assets/signature.png", height: 50),
                buildCandidatePhoto(formDetail.studentSignaturePath),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: const Text("Full Signature of the Student"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  printDocument(formDetail: formDetail);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(w * 0.3, h * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor:
                      Colors.indigo, // You can set different color for Back
                ),
                child: Text(
                  'Print',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(ThreeStepForm());
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(w * 0.3, h * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor:
                      Colors.indigo, // You can set different color for Back
                ),
                child: Text(
                  'Edit',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget buildCandidatePhoto(String? studentPhotoPath) {
    if (studentPhotoPath == null || studentPhotoPath.isEmpty) {
      return const Icon(Icons.person, size: 80);
    } else if (studentPhotoPath.startsWith("http")) {
      return Image.network(
        studentPhotoPath,
        height: 80,
        width: 80,
        fit: BoxFit.cover,
      );
    } else {
      return Image.file(
        File(studentPhotoPath),
        height: 80,
        width: 80,
        fit: BoxFit.cover,
      );
    }
  }
}
