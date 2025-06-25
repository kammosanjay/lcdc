class ApiConstraints {
  static const String BASE_URL = "https://reqres.in/api/login";
  static const String LOGIN = "${BASE_URL}+login";

  static const String databaseUrl = "http://10.0.2.2/lcdc_new/api";
  // static const String databaseUrl = "http://192.168.29.22/lcdc_new/api";
  // static const String databaseUrl = "http://localhost/lcdc_new/api";
  // static const String databaseUrl = "http://192.168.29.5/lcdc_new/api"; //arjit server ip

  ///
  ///
  static const String courseType = "$databaseUrl/get-course-type";
  static const String studentRegFrom = "$databaseUrl/register";
  static const String getOtp = "$databaseUrl/verify-otp";
  static const String ugSelected =
      "$databaseUrl/get-ug-registration-all-options";
  static const String studentInfo = "$databaseUrl/student";
  static const String paymentOrder = "$databaseUrl/create-order";
  static const String resendOTP = "$databaseUrl/resend-otp";
  static const String verifyPayment = "$databaseUrl/verify-payment";
  static const String loginApi = "$databaseUrl/login";
  static const String dropDownsforUg = "$databaseUrl/get-ug-admission-all-options";

}
