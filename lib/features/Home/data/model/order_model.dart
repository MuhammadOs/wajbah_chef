import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';

class Order {
  int? orderId;
  String? notes;
  double? totalPrice;
  double? subTotal;
  double? deliveryFees;
  int? deliveryNumber;
  String? createdOn;
  String? deliveryTime;
  String? status;
  List<dynamic>? quanitities;
  List<dynamic>? sizes;
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
  Order({
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

  Order.fromJson(Map<String, dynamic> json) {
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