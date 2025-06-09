class Login_response {
  String? email;
  String? password;
  String? id;
  String? createdAt;

  Login_response({this.email, this.password, this.id, this.createdAt});

  Login_response.fromJson(Map<dynamic, dynamic> json) {
    email = json['email'];
    password = json['password'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
