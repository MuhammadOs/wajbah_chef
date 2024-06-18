import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';

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
    this.chef,
    this.token,
  });

  Result.fromJson(Map<String, dynamic> json) {
    chef = json['chef'] != null ? ChefRespnse.fromJson(json['chef']) : null;
    token = json['token'];
  }

  ChefRespnse? chef;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (chef != null) {
      map['chef'] = chef?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class ChefRespnse {
  ChefRespnse({
    this.chefId,
    this.phoneNumber,
    this.email,
    this.role,
    this.password,
    this.chefFirstName,
    this.chefLastName,
    this.restaurantName,
    this.birthDate,
    this.description,
    this.rating,
    this.wallet,
    this.state,
    this.profilePicture,
    this.address,
    this.active,
    this.extraMenuItems,
    this.menuItems,
    this.promoCodes,
    this.chefPromoCodes,
    this.orders,
  });

  ChefRespnse.fromJson(Map<String, dynamic> json) {
    chefId = json['chefId'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    role = json['role'];
    password = json['password'];
    chefFirstName = json['chefFirstName'];
    chefLastName = json['chefLastName'];
    restaurantName = json['restaurantName'];
    birthDate = DateTime.parse(json['birthDate']);
    description = json['description'];
    rating = json['rating'];
    wallet = json['wallet'];
    state = json['state'];
    profilePicture = json['profilePicture'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    active = json['active'];
    extraMenuItems = json['extraMenuItems'];
    if (json['menuItems'] != null) {
      menuItems = [];
      json['menuItems'].forEach((v) {
        menuItems?.add(MenuItem.fromJson(v));
      });
    }
    promoCodes = json['promoCodes'];
    chefPromoCodes = json['chefPromoCodes'];
    orders = json['orders'];
  }

  String? chefId;
  int? phoneNumber;
  String? email;
  String? role;
  String? password;
  String? chefFirstName;
  String? chefLastName;
  String? restaurantName;
  DateTime? birthDate;
  String? description;
  int? rating;
  double? wallet;
  bool? state;
  String? profilePicture;
  Address? address;
  bool? active;
  dynamic extraMenuItems;
  List<MenuItem>? menuItems;
  dynamic promoCodes;
  dynamic chefPromoCodes;
  dynamic orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['chefId'] = chefId;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['role'] = role;
    map['password'] = password;
    map['chefFirstName'] = chefFirstName;
    map['chefLastName'] = chefLastName;
    map['restaurantName'] = restaurantName;
    map['birthDate'] = birthDate?.toIso8601String();
    map['description'] = description;
    map['rating'] = rating;
    map['wallet'] = wallet;
    map['state'] = state;
    map['profilePicture'] = profilePicture;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['active'] = active;
    map['extraMenuItems'] = extraMenuItems;
    if (menuItems != null) {
      map['menuItems'] = menuItems?.map((v) => v.toJson()).toList();
    }
    map['promoCodes'] = promoCodes;
    map['chefPromoCodes'] = chefPromoCodes;
    map['orders'] = orders;
    return map;
  }
}

class Address {
  Address({
    this.governorate,
    this.city,
    this.street,
    this.buildingNumber,
    this.floor,
    this.flatNumber,
  });

  Address.fromJson(Map<String, dynamic> json) {
    governorate = json['governorate'];
    city = json['city'];
    street = json['street'];
    buildingNumber = json['buildingNumber'];
    floor = json['floor'];
    flatNumber = json['flatNumber'];
  }

  String? governorate;
  String? city;
  String? street;
  String? buildingNumber;
  String? floor;
  String? flatNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['governorate'] = governorate;
    map['city'] = city;
    map['street'] = street;
    map['buildingNumber'] = buildingNumber;
    map['floor'] = floor;
    map['flatNumber'] = flatNumber;
    return map;
  }
}
