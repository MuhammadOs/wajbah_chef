class ProfileUpdateRequest {
  final String? chefId;
  final int? phoneNumber;
  final String? email;
  final String? password;
  final String? chefFirstName;
  final String? chefLastName;
  final String? restaurantName;
  final DateTime? birthDate;
  final String? description;
  final String? profilePicture;
  final Address? address;

  ProfileUpdateRequest({
    this.chefId,
    this.phoneNumber,
    this.email,
    this.password,
    this.chefFirstName,
    this.chefLastName,
    this.restaurantName,
    this.birthDate,
    this.description,
    this.profilePicture,
    this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'chefId': chefId,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'chefFirstName': chefFirstName,
      'chefLastName': chefLastName,
      'restaurantName': restaurantName,
      'birthDate': birthDate?.toIso8601String(),
      'description': description,
      'profilePicture': profilePicture,
      'address': address?.toJson(),
    };
  }

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) {
    return ProfileUpdateRequest(
      chefId: json['chefId'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
      chefFirstName: json['chefFirstName'],
      chefLastName: json['chefLastName'],
      restaurantName: json['restaurantName'],
      birthDate: DateTime.parse(json['birthDate']),
      description: json['description'],
      profilePicture: json['profilePicture'],
      address: Address.fromJson(json['address']),
    );
  }
}

class Address {
  final String? governorate;
  final String? city;
  final String? street;
  final String? buildingNumber;
  final String? floor;
  final String? flatNumber;

  Address({
    this.governorate,
    this.city,
    this.street,
    this.buildingNumber,
    this.floor,
    this.flatNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'governorate': governorate,
      'city': city,
      'street': street,
      'buildingNumber': buildingNumber,
      'floor': floor,
      'flatNumber': flatNumber,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      governorate: json['governorate'],
      city: json['city'],
      street: json['street'],
      buildingNumber: json['buildingNumber'],
      floor: json['floor'],
      flatNumber: json['flatNumber'],
    );
  }
}
