

import 'order_product.dart';
class Order {
  String orderId;
  List<OrderProduct> products;
  DateTime date;

  Order({
    required this.products,
    required this.date,
    required this.orderId
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId:json['_id'],
      products: (json['products'] as List<dynamic>)
          .map((item) => OrderProduct.fromJson(item))
          .toList(),
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product.toJson()).toList(),
      'date': date.toIso8601String(),
      '_id':orderId
    };
  }
  static List<Order> fromJsonToOrderList(List<Map<String, dynamic>> list) {
    List<Order>orderItems=[];
    for(Map<String,dynamic> item in list){
      orderItems.add(Order.fromJson(item));
    }
    return orderItems;
  }
}
