import 'Address.dart';

class Chef {
  Chef({
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
      this.profilePicture, 
      this.address, 
      this.extraMenuItems, 
      this.menuItems, 
      this.promoCodes, 
      this.chefPromoCodes,});

  Chef.fromJson(dynamic json) {
    chefId = json['chefId'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    role = json['role'];
    password = json['password'];
    chefFirstName = json['chefFirstName'];
    chefLastName = json['chefLastName'];
    restaurantName = json['restaurantName'];
    birthDate = json['birthDate'];
    description = json['description'];
    rating = json['rating'];
    wallet = json['wallet'];
    profilePicture = json['profilePicture'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    
    extraMenuItems = json['extraMenuItems'];
    menuItems = json['menuItems'];
    promoCodes = json['promoCodes'];
    chefPromoCodes = json['chefPromoCodes'];
  }
  String? chefId;
  int? phoneNumber;
  String? email;
  String? role;
  String? password;
  String? chefFirstName;
  String? chefLastName;
  String? restaurantName;
  String? birthDate;
  String? description;
  int? rating;
  int? wallet;
  String? profilePicture;
  Address? address;
  dynamic extraMenuItems;
  dynamic menuItems;
  dynamic promoCodes;
  dynamic chefPromoCodes;

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
    map['birthDate'] = birthDate;
    map['description'] = description;
    map['rating'] = rating;
    map['wallet'] = wallet;
    map['profilePicture'] = profilePicture;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['extraMenuItems'] = extraMenuItems;
    map['menuItems'] = menuItems;
    map['promoCodes'] = promoCodes;
    map['chefPromoCodes'] = chefPromoCodes;
    return map;
  }

}