import 'package:wajbah_chef/features/menu/data/model/size_prices.dart';

class MenuItem {
  int? menuItemId;
  String? name;
  String? estimatedTime;
  String? orderingTime;
  String? category;
  String? occassions;
  SizesPrices? sizesPrices;
  bool? healthyMode;
  String? description;
  dynamic rate;
  String? photo;
  String? restaurantPhoto;
  String? restaurantName;
  String? chefId;

  MenuItem(
      {this.menuItemId,
        this.name,
        this.estimatedTime,
        this.orderingTime,
        this.category,
        this.occassions,
        this.sizesPrices,
        this.healthyMode,
        this.description,
        this.rate,
        this.photo,
        this.restaurantPhoto,
        this.restaurantName,
        this.chefId});

  MenuItem.fromJson(Map<String, dynamic> json) {
    menuItemId = json['menuItemId'];
    name = json['name'];
    estimatedTime = json['estimatedTime'];
    orderingTime = json['orderingTime'];
    category = json['category'];
    occassions = json['occassions'];
    sizesPrices = json['sizesPrices'] != null ? SizesPrices.fromJson(json['sizesPrices']) : null;
    healthyMode = json['healthyMode'];
    description = json['description'];
    rate = json['rate'];
    photo = json['photo'];
    restaurantPhoto = json['restaurantPhoto'];
    restaurantName = json['restaurantName'];
    chefId = json['chefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['menuItemId'] = menuItemId;
    data['name'] = name;
    data['estimatedTime'] = estimatedTime;
    data['orderingTime'] = orderingTime;
    data['category'] = category;
    data['occassions'] = occassions;
    if (sizesPrices != null) {
      data['sizesPrices'] = sizesPrices!.toJson();
    }
    data['healthyMode'] = healthyMode;
    data['description'] = description;
    data['rate'] = rate;
    data['photo'] = photo;
    data['restaurantPhoto'] = restaurantPhoto;
    data['restaurantName'] = restaurantName;
    data['chefId'] = chefId;
    return data;
  }
}