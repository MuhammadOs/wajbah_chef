class Serving {
  late String Request_ID;
  late String Item_name;
  late int num_of_items;
  late String Requester_name;
  late String Requester_location;
  late int Item_price;
  late String Available_time;
  late String Request_condition;
  late String Phone_number;
  Serving(
      {required this.Request_ID,
      required this.Item_name,
      required this.num_of_items,
      required this.Requester_name,
      required this.Requester_location,
      required this.Item_price,
      required this.Available_time,
      required this.Request_condition,
      required this.Phone_number});
}

List<Serving> Serving_data = [
  Serving(
      Request_ID: '2343546',
      Item_name: 'BBQ Pizza',
      num_of_items: 1,
      Requester_name: 'Abdulaziz Ahmed',
      Requester_location: 'Fayoum, Hadqa',
      Item_price: 250,
      Available_time: '0:05',
      Request_condition: 'Available',
      Phone_number: '01061997059'),
  Serving(
      Request_ID: '2543542',
      Item_name: 'Shawarma Double',
      num_of_items: 2,
      Requester_name: 'Mohamed Osama',
      Requester_location: 'Tahrir Square , Sphinx',
      Item_price: 350,
      Available_time: '2:45',
      Request_condition: 'Expired',
      Phone_number: '01222777122'),
];
