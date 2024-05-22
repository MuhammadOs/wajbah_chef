class LoginModel {
  int? phoneNumber;
  String? password;

  LoginModel({this.phoneNumber, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'phoneNumber': phoneNumber,
      'password': password,
    };
    return data;
  }
}
