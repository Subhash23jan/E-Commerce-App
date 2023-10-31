
class CartItem {
  String ? email;
  int quantity;
  String productId;
  CartItem(this.quantity, this.productId,this.email);

  // Convert CartItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'productId': productId,
      'email':email
    };
  }
  // Create a CartItem from JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(json['quantity'], json['productId'],
        json['email']
    );
  }
    static List<CartItem> fromJsonToCartList(List<Map<String, dynamic>> list) {
    List<CartItem>cartItems=[];
    for(Map<String,dynamic> item in list){
      cartItems.add(CartItem.fromJson(item));
    }
    return cartItems;
  }
}
