import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String userType;
  final List<dynamic> cart;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.userType,
    required this.cart
  });

  // Serialization: Convert User object to a map
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'userType': userType,
      'cart':cart
    };
  }

  // Deserialization: Create a User object from a map
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
      userType: json['userType'],
      cart: json['cart']
    );
  }
  // String toJson() => json.encode(toMap());
  // factory User.fromJson(String string) {
  //   return User.fromMap(json.decode(string));
  // }
  String toJson() => json.encode(toMap());
  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
