class CartItem {
  final dynamic product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: json['product'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'quantity': quantity,
    };
  }
}
