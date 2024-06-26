import 'package:wajbah_chef/features/Home/data/model/request_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';

class StateModel {
  int? statusCode;
  bool? isSuccess;
  List<String>? errorMessages;
  StateResult? result;

  StateModel({this.statusCode, this.isSuccess, this.errorMessages, this.result});

  StateModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    if (json['errorMessages'] != null) {
      errorMessages = [];
      json['errorMessages'].forEach((v) {
        errorMessages!.add(v);
      });
    }
    result = json['result'] != null ? StateResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['statusCode'] = statusCode;
    data['isSuccess'] = isSuccess;
    if (errorMessages != null) {
      data['errorMessages'] = errorMessages;
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class StateResult {
  int? orderId;
  String? notes;
  dynamic totalPrice;
  dynamic subTotal;
  dynamic deliveryFees;
  int? deliveryNumber;
  String? createdOn;
  String? deliveryTime;
  String? status;
  List<int>? quantities;
  dynamic sizes;
  String? copoun;
  bool? cashDelivered;
  String? estimatedTime;
  dynamic promoCodeId;
  dynamic companyId;
  int? customerId;
  List<MenuItem>? menuItems;
  String? chefId;
  String? fname;
  String? lname;
  String? address;

  StateResult({
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
    this.quantities,
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

  StateResult.fromJson(Map<String, dynamic> json) {
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
    quantities = json['quanitities'];
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
        menuItems!.add(MenuItem.fromJson(v));
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
    data['quanitities'] = quantities;
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



class SizesPrices {
  dynamic priceSmall;
  dynamic priceMedium;
  dynamic priceLarge;

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
