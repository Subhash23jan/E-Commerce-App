import 'dart:convert';
class Favourites {
  String? email;
  String productId;

  Favourites(this.email, this.productId);

  // Convert Favourites object to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'productId': productId,
    };
  }

  // Create a Favourites object from JSON
  factory Favourites.fromJson(Map<String, dynamic> json) {
    return Favourites(json['email'], json['productId']);
  }
}