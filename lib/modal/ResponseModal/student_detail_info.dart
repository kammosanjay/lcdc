class StudentDetailsInfo {
  String? id;
  String? enterenceNo;
  String? candidatename;
  String? fathername;
  String? mobileNo;
  String? otpNo;
  String? otpVerified;
  String? aadharid;
  String? gender;
  String? course;
  String? dateofbirth;
  String? emailid;
  String? category;
  String? semester;
  String? academicSession;
  String? registrationType;
  String? eduCourseType;
  String? status;
  String? paymentType;
  String? registerDate;

  StudentDetailsInfo({
    this.id,
    this.enterenceNo,
    this.candidatename,
    this.fathername,
    this.mobileNo,
    this.otpNo,
    this.otpVerified,
    this.aadharid,
    this.gender,
    this.course,
    this.dateofbirth,
    this.emailid,
    this.category,
    this.semester,
    this.academicSession,
    this.registrationType,
    this.eduCourseType,
    this.status,
    this.paymentType,
    this.registerDate,
  });

  StudentDetailsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enterenceNo = json['enterence_no'] ?? "";
    candidatename = json['candidatename'] ?? "";
    fathername = json['fathername'] ?? "";
    mobileNo = json['mobile_no'] ?? "";
    otpNo = json['otp_no'] ?? "";
    otpVerified = json['otp_verified'] ?? "";
    aadharid = json['aadharid'] ?? "";
    gender = json['gender'] ?? "";
    course = json['course'] ?? "";
    dateofbirth = json['dateofbirth'] ?? "";
    emailid = json['emailid'] ?? "";
    category = json['category'] ?? "";
    semester = json['semester'] ?? "";
    academicSession = json['academic_session'] ?? "";
    registrationType = json['registration_type'] ?? "";
    eduCourseType = json['edu_course_type'] ?? "";
    status = json['status'] ?? "";
    paymentType = json['payment_type'] ?? "";
    registerDate = json['register_date'] ?? "";
  }
}
