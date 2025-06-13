class LoginRequset {
  String? mobile;
  String? entranceNo;

  LoginRequset({this.mobile, this.entranceNo});

  LoginRequset.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile_no'];
    entranceNo = json['enterence_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mobile_no'] = mobile;
    data['enterence_no'] = entranceNo;
    return data;
  }
}
