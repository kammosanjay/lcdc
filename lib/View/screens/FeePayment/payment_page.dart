import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lcdc_mobile_app/View/screens/HomeScreen/new_home_screen.dart';
import 'package:lcdc_mobile_app/View/screens/UPI/upi_payment.dart';
import 'package:lcdc_mobile_app/modal/RequestModal/studentReqModal.dart';

class RegistrationDetailsPage extends StatelessWidget {
  RegistrationDetailsPage({super.key});

  Widget buildRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              "$title : ",
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
    final StudentRequestModal studentRequestModal = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              buildRow("Registration Number", "BB25000278"),
              buildRow(
                "Candidate Name",
                studentRequestModal.candidatename.toString(),
              ),
              buildRow(
                "Father's Name",
                studentRequestModal.fathername.toString(),
              ),
              buildRow(
                "Mobile Number",
                studentRequestModal.mobileNo.toString(),
              ),
              buildRow(
                "Mobile Number Status",
                "Verified",
                valueColor: Colors.green,
              ),
              buildRow("Email-Id", studentRequestModal.emailid.toString()),
              buildRow("Gender", studentRequestModal.gender.toString()),
              buildRow(
                "Date of birth",
                studentRequestModal.dateofbirth.toString(),
              ),
              buildRow("Category", studentRequestModal.category.toString()),
              buildRow(
                "Aadhar Id Number",
                studentRequestModal.aadharid.toString(),
              ),
              buildRow("Course", studentRequestModal.course.toString()),
              buildRow("Status", "INACTIVE", valueColor: Colors.red),
              buildRow(
                "Application Fees",
                "850 + Payment Gateway Handling Charge",
              ),
              const SizedBox(height: 20),
              const Text(
                "Payment Mode:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio(
                    value: "Online",
                    groupValue: "Online",
                    onChanged: (_) {},
                  ),
                  const Text("Select Payment Mode : Online"),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // initiateGooglePay();
                    Get.to(ThreeStepForm());
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
                    fixedSize: Size(100, 40),
                    backgroundColor: Color(0xFF00306E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
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
