import 'package:wajbah_chef/features/Home/data/model/request_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';

class Request {
  late String Request_ID;
  late List<dynamic> num_of_items;
  late String Requester_name;
  late String Requester_location;
  late double Item_price;
  late String Available_time;
  late String Request_condition;
  late String Phone_number;
  final List<MenuItem>? menuItems;

  Request(
    this.menuItems, {
    required this.Request_ID,
    required this.num_of_items,
    required this.Requester_name,
    required this.Requester_location,
    required this.Item_price,
    required this.Available_time,
    required this.Request_condition,
    required this.Phone_number,
  });
}
