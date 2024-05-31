import 'package:wajbah_chef/features/Authentication/data/model/login/login_response_model.dart';

import 'Result.dart';

class ChefRegisterRequest {
  ChefRegisterRequest({
      this.statusCode, 
      this.isSuccess, 
      this.errorMessages, 
      this.result,});

  ChefRegisterRequest.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    errorMessages = json['errorMessages'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  int? statusCode;
  bool? isSuccess;
  String? errorMessages;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['isSuccess'] = isSuccess;
    map['errorMessages'] = errorMessages;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}