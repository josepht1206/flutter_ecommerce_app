import 'package:flutter/foundation.dart';
import 'package:ecommerce_app/models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get cartItemCount => _cartItems.length;

  void addToCart(CartItem item) {
    // Check if the product is already in the cart
    final existingItemIndex = _cartItems.indexWhere(
      (cartItem) => cartItem.product['id'] == item.product['id'],
    );

    if (existingItemIndex != -1) {
      // Increase the quantity if the product is already in the cart
      _cartItems[existingItemIndex].quantity++;
    } else {
      // Add the product to the cart
      _cartItems.add(item);
    }

    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
