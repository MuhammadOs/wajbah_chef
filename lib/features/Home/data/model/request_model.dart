import 'package:wajbah_chef/features/home/data/model/order_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';

class RequestModel {
  int? statusCode;
  bool? isSuccess;
  List<String>? errorMessages;
  List<Order>? result;

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
        result!.add(Order.fromJson(v));
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
