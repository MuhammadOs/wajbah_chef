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