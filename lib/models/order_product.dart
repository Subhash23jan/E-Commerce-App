class OrderProduct {
  String productId;
  int quantity;

  OrderProduct({
    required this.productId,
    this.quantity = 1,
  });
  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      productId: json['productId'],
      quantity: json['quantity'], // You can provide a default value if 'quantity' is not present in the JSON.
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };

  }
}