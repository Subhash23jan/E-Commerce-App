class ProductModel {
  String name;
  String id;
  String url;
  List<String> productType;
  double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.url,
    required this.productType,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      id: json['_id'],
      url: json['url'],
      productType: List<String>.from(json['productType']),
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'productType': productType,
      'price': price,
      '_id':id,
    };
  }
}
