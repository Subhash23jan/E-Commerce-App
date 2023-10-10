
import 'dart:convert';

import 'order_product.dart';
class Order {
  List<OrderProduct> products;
  DateTime date;

  Order({
    required this.products,
    required this.date,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
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
    };
  }
}
