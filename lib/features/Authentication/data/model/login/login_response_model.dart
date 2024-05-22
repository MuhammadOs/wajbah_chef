
class LoginResponseModel {
  LoginResponseModel({
    this.statusCode,
    this.isSuccess,
    this.errorMessages,
    this.result,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    if (json['errorMessages'] != null) {
      errorMessages = List<String>.from(json['errorMessages']);
    }
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  int? statusCode;
  bool? isSuccess;
  List<String>? errorMessages;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['isSuccess'] = isSuccess;
    if (errorMessages != null) {
      map['errorMessages'] = errorMessages;
    }
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }
}


class Result {
  Result({
    this.customer,
    this.token,
  });

  Result.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    token = json['token'];
  }

  Customer? customer;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    map['token'] = token;
    return map;
  }
}



class Customer {
  Customer({
    this.customerId,
    this.phoneNumber,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.role,
    this.birthDate,
    this.wallet,
    this.favourites,
    this.usedCoupones,
    this.orders,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    birthDate = DateTime.parse(json['birthDate']);
    wallet = json['wallet'];
    favourites = json['favourites'];
    usedCoupones = json['usedCoupones'];
    orders = json['orders'];
  }

  int? customerId;
  int? phoneNumber;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? role;
  DateTime? birthDate;
  double? wallet;
  String? favourites;
  dynamic usedCoupones;
  dynamic orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerId'] = customerId;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['password'] = password;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['role'] = role;
    map['birthDate'] = birthDate?.toIso8601String();
    map['wallet'] = wallet;
    map['favourites'] = favourites;
    map['usedCoupones'] = usedCoupones;
    map['orders'] = orders;
    return map;
  }
}