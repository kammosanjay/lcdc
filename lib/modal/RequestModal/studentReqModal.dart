// ignore: file_names
class StudentRequestModal {
  String? candidatename;
  String? fathername;
  String? mobileNo;
  String? aadharid;
  String? course;
  String? gender;
  String? dateofbirth;
  String? emailid;
  String? category;
  String? eduCourseType;

  StudentRequestModal({
    this.candidatename,
    this.fathername,
    this.mobileNo,
    this.aadharid,
    this.course,
    this.gender,
    this.dateofbirth,
    this.emailid,
    this.category,
    this.eduCourseType,
  });

  StudentRequestModal.fromJson(Map<String, dynamic> json) {
    candidatename = json['candidatename'];
    fathername = json['fathername'];
    mobileNo = json['mobile_no'];
    aadharid = json['aadharid'];
    course = json['course'];
    gender = json['gender'];
    dateofbirth = json['dateofbirth'];
    emailid = json['emailid'];
    category = json['category'];
    eduCourseType = json['edu_course_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['candidatename'] = candidatename;
    data['fathername'] = fathername;
    data['mobile_no'] = mobileNo;
    data['aadharid'] = aadharid;
    data['course'] = course;
    data['gender'] = gender;
    data['dateofbirth'] = dateofbirth;
    data['emailid'] = emailid;
    data['category'] = category;
    data['edu_course_type'] = eduCourseType;
    return data;
  }
}
