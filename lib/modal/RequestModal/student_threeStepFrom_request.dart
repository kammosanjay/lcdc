class StudentRegistrationModel {
  String? registrationNumber;
  String? lurnCertificate;
  String? candidateName;
  String? fatherName;
  String? annualIncomeRs;
  String? occupation;
  String? motherName;
  String? motherAnnualIncomeRs;
  String? motherOccupation;
  String? dateOfBirth;
  String? mobileNumber;
  String? aadharId;
  String? emailId;
  String? gender;
  String? category;
  String? course;
  String? bloodGroup;
  String? religion;
  String? caste;
  String? nationality;
  String? examinationName;
  String? institution;
  String? boardUniversity;
  String? passingYear;
  String? maximumMarks;
  String? marksObtained;
  String? marksPercentage;
  String? fatherMobileNo;
  String? motherMobileNumber;
  String? presentAddress;
  String? presentPincode;
  String? presentNearRailway;
  String? presentNearPolice;
  String? permanentAddress;
  String? permanentPincode;
  String? permanentNearRailway;
  String? permanentNearPolice;
  String? domicileCertificatePath;
  String? casteCertificatePath;
  String? addressProofPath;
  String? studentPhotoPath;
  String? studentSignaturePath;
  String? interMarksheetPath;

  StudentRegistrationModel({
    this.registrationNumber,
    this.lurnCertificate,
    this.candidateName,
    this.fatherName,
    this.annualIncomeRs,
    this.occupation,
    this.motherName,
    this.motherAnnualIncomeRs,
    this.motherOccupation,
    this.dateOfBirth,
    this.mobileNumber,
    this.aadharId,
    this.emailId,
    this.gender,
    this.category,
    this.course,
    this.bloodGroup,
    this.religion,
    this.caste,
    this.nationality,
    this.examinationName,
    this.institution,
    this.boardUniversity,
    this.passingYear,
    this.maximumMarks,
    this.marksObtained,
    this.marksPercentage,
    this.fatherMobileNo,
    this.motherMobileNumber,
    this.presentAddress,
    this.presentPincode,
    this.presentNearRailway,
    this.presentNearPolice,
    this.permanentAddress,
    this.permanentPincode,
    this.permanentNearRailway,
    this.permanentNearPolice,
    this.domicileCertificatePath,
    this.casteCertificatePath,
    this.addressProofPath,
    this.studentPhotoPath,
    this.studentSignaturePath,
    this.interMarksheetPath,
  });
  factory StudentRegistrationModel.fromJson(Map<String, dynamic> json) {
    return StudentRegistrationModel(
      registrationNumber: json['registrationnumber'] ?? "",
      lurnCertificate: json['lurncertificate'] ?? "",
      candidateName: json['candidatename'] ?? "",
      fatherName: json['fathername'] ?? "",
      annualIncomeRs: json['annualincomers'] ?? "",
      occupation: json['occupation'] ?? "",
      motherName: json['mothername'] ?? "",
      motherAnnualIncomeRs: json['motherannualincomers'] ?? "",
      motherOccupation: json['motheroccupation'] ?? "",
      dateOfBirth: json['dateofbirth'] ?? "",
      mobileNumber: json['mobilenumber'] ?? "",
      aadharId: json['aadharid'] ?? "",
      emailId: json['emailid'] ?? "",
      gender: json['gender'] ?? "",
      category: json['category'] ?? "",
      course: json['course'] ?? "",
      bloodGroup: json['bloodgroup'] ?? "",
      religion: json['religion'] ?? "",
      caste: json['caste'] ?? "",
      nationality: json['nationality'] ?? "",
      examinationName: json['examinationname'] ?? "",
      institution: json['institution'] ?? "",
      boardUniversity: json['boarduniversity'] ?? "",
      passingYear: json['passingyear'] ?? "",
      maximumMarks: json['maximummarks'] ?? "",
      marksObtained: json['marksobtained'] ?? "",
      marksPercentage: json['markspercentage'] ?? "",
      fatherMobileNo: json['fathermobileno'] ?? "",
      motherMobileNumber: json['mothermobilenumber'] ?? "",
      presentAddress: json['presentaddress'] ?? "",
      presentPincode: json['presentpincode'] ?? "",
      presentNearRailway: json['presentnearrailway'] ?? "",
      presentNearPolice: json['presentnearpolice'] ?? "",
      permanentAddress: json['permanentaddress'] ?? "",
      permanentPincode: json['permanentpincode'] ?? "",
      permanentNearRailway: json['permanentnearrailway'] ?? "",
      permanentNearPolice: json['permanentnearpolice'] ?? "",
      domicileCertificatePath: json['domicilecertificate'] ?? "",
      casteCertificatePath: json['castecertificate'] ?? "",
      addressProofPath: json['addressproof'] ?? "",
      studentPhotoPath: json['studentphoto'] ?? "",
      studentSignaturePath: json['studentsignature'] ?? "",
      interMarksheetPath: json['intermarksheet'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['registrationnumber'] = registrationNumber;
    data['lurncertificate'] = lurnCertificate;
    data['candidatename'] = candidateName;
    data['fathername'] = fatherName;
    data['annualincomers'] = annualIncomeRs;
    data['occupation'] = occupation;
    data['mothername'] = motherName;
    data['motherannualincomers'] = motherAnnualIncomeRs;
    data['motheroccupation'] = motherOccupation;
    data['dateofbirth'] = dateOfBirth;
    data['mobilenumber'] = mobileNumber;
    data['aadharid'] = aadharId;
    data['emailid'] = emailId;
    data['gender'] = gender;
    data['category'] = category;
    data['course'] = course;
    data['bloodgroup'] = bloodGroup;
    data['religion'] = religion;
    data['caste'] = caste;
    data['nationality'] = nationality;
    data['examinationname'] = examinationName;
    data['institution'] = institution;
    data['boarduniversity'] = boardUniversity;
    data['passingyear'] = passingYear;
    data['maximummarks'] = maximumMarks;
    data['marksobtained'] = marksObtained;
    data['markspercentage'] = marksPercentage;
    data['fathermobileno'] = fatherMobileNo;
    data['mothermobilenumber'] = motherMobileNumber;
    data['presentaddress'] = presentAddress;
    data['presentpincode'] = presentPincode;
    data['presentnearrailway'] = presentNearRailway;
    data['presentnearpolice'] = presentNearPolice;
    data['permanentaddress'] = permanentAddress;
    data['permanentpincode'] = permanentPincode;
    data['permanentnearrailway'] = permanentNearRailway;
    data['permanentnearpolice'] = permanentNearPolice;
    data['domicilecertificate'] = domicileCertificatePath;
    data['castecertificate'] = casteCertificatePath;
    data['addressproof'] = addressProofPath;
    data['studentphoto'] = studentPhotoPath;
    data['studentsignature'] = studentSignaturePath;
    data['intermarksheet'] = interMarksheetPath;
    return data;
  }
}
