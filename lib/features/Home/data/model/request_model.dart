class RequestModel {
  int? statusCode;
  bool? isSuccess;
  List<String>? errorMessages;
  List<Result>? result;

  RequestModel({this.statusCode, this.isSuccess, this.errorMessages, this.result});

  RequestModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    if (json['errorMessages'] != null) {
      errorMessages = [];
      json['errorMessages'].forEach((v) {
        errorMessages!.add(v);
      });
    }
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['statusCode'] = statusCode;
    data['isSuccess'] = isSuccess;
    if (errorMessages != null) {
      data['errorMessages'] = errorMessages;
    }
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? orderId;
  String? notes;
  double? totalPrice;
  double? subTotal;
  double? deliveryFees;
  int? deliveryNumber;
  String? createdOn;
  String? deliveryTime;
  String? status;
  dynamic quanitities;
  dynamic sizes;
  String? copoun;
  bool? cashDelivered;
  String? estimatedTime;
  dynamic promoCodeId;
  dynamic companyId;
  int? customerId;
  List<MenuItems>? menuItems;
  String? chefId;
  String? fname;
  String? lname;
  String? address;
  Result({
    this.orderId,
    this.notes,
    this.address,
    this.fname,
    this.lname,
    this.totalPrice,
    this.subTotal,
    this.deliveryFees,
    this.deliveryNumber,
    this.createdOn,
    this.deliveryTime,
    this.status,
    this.quanitities,
    this.sizes,
    this.copoun,
    this.cashDelivered,
    this.estimatedTime,
    this.promoCodeId,
    this.companyId,
    this.customerId,
    this.menuItems,
    this.chefId,
  });

  Result.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    notes = json['notes'];
    totalPrice = json['totalPrice'];
    fname = json['customerFirstName'];
    lname = json['customerLastName'];
    address = json['address'];
    subTotal = json['subTotal'];
    deliveryFees = json['deliveryFees'];
    deliveryNumber = json['deliveryNumber'];
    createdOn = json['createdOn'];
    deliveryTime = json['deliveryTime'];
    status = json['status'];
    quanitities = json['quanitities'];
    sizes = json['sizes'];
    copoun = json['copoun'];
    cashDelivered = json['cashDelivered'];
    estimatedTime = json['estimatedTime'];
    promoCodeId = json['promoCodeId'];
    companyId = json['companyId'];
    customerId = json['customerId'];
    if (json['menuItems'] != null) {
      menuItems = [];
      json['menuItems'].forEach((v) {
        menuItems!.add(MenuItems.fromJson(v));
      });
    }
    chefId = json['chefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['orderId'] = orderId;
    data['notes'] = notes;
    data['totalPrice'] = totalPrice;
    data['customerFirstName'] = fname;
    data['customerLastName'] = lname;
    data['address'] = address;
    data['subTotal'] = subTotal;
    data['deliveryFees'] = deliveryFees;
    data['deliveryNumber'] = deliveryNumber;
    data['createdOn'] = createdOn;
    data['deliveryTime'] = deliveryTime;
    data['status'] = status;
    data['quanitities'] = quanitities;
    data['sizes'] = sizes;
    data['copoun'] = copoun;
    data['cashDelivered'] = cashDelivered;
    data['estimatedTime'] = estimatedTime;
    data['promoCodeId'] = promoCodeId;
    data['companyId'] = companyId;
    data['customerId'] = customerId;
    if (menuItems != null) {
      data['menuItems'] = menuItems!.map((v) => v.toJson()).toList();
    }
    data['chefId'] = chefId;
    return data;
  }
}

class MenuItems {
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
  dynamic restaurantPhoto;
  dynamic restaurantName;
  String? chefId;

  MenuItems({
    this.menuItemId,
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
    this.chefId,
  });

  MenuItems.fromJson(Map<String, dynamic> json) {
    menuItemId = json['menuItemId'];
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

class SizesPrices {
  double? priceSmall;
  double? priceMedium;
  double? priceLarge;

  SizesPrices({this.priceSmall, this.priceMedium, this.priceLarge});

  SizesPrices.fromJson(Map<String, dynamic> json) {
    priceSmall = json['priceSmall'];
    priceMedium = json['priceMedium'];
    priceLarge = json['priceLarge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['priceSmall'] = priceSmall;
    data['priceMedium'] = priceMedium;
    data['priceLarge'] = priceLarge;
    return data;
  }
}
