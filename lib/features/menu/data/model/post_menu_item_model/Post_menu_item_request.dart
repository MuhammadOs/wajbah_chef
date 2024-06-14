import '../size_prices.dart';

class PostMenuItemRequest {
  PostMenuItemRequest({
    this.name,
    this.estimatedTime,
    this.orderingTime,
    this.category,
    this.occassions,
    this.sizesPrices,
    this.healthyMode,
    this.description,
    this.photo,
    this.chefId,
  });

  PostMenuItemRequest.fromJson(dynamic json) {
    name = json['name'];
    estimatedTime = json['estimatedTime'];
    orderingTime = json['orderingTime'];
    category = json['category'];
    occassions = json['occassions'];
    sizesPrices = json['sizesPrices'] != null
        ? SizesPrices.fromJson(json['sizesPrices'])
        : null;
    healthyMode = json['healthyMode'];
    description = json['description'];
    photo = json['photo'];
    chefId = json['chefId'];
  }

  String? name;
  String? estimatedTime;
  String? orderingTime;
  String? category;
  String? occassions;
  SizesPrices? sizesPrices;
  bool? healthyMode;
  String? description;
  String? photo;
  String? chefId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['estimatedTime'] = estimatedTime;
    map['orderingTime'] = orderingTime;
    map['category'] = category;
    map['occassions'] = occassions;
    if (sizesPrices != null) {
      map['sizesPrices'] = sizesPrices?.toJson();
    }
    map['healthyMode'] = healthyMode;
    map['description'] = description;
    map['photo'] = photo;
    map['chefId'] = chefId;
    return map;
  }
}
