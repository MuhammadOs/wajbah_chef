class Address {
  Address({
      this.governorate, 
      this.city, 
      this.street, 
      this.buildingNumber, 
      this.floor, 
      this.flatNumber,});

  Address.fromJson(dynamic json) {
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