import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  static const _cartKey = 'cart';

  List<CartItem> _cartItems = [];
  SharedPreferences? _sharedPreferences;

  List<CartItem> get cartItems => _cartItems;

  CartProvider() {
    _initCart();
  }

  Future<void> _initCart() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final savedCart = _sharedPreferences!.getString(_cartKey);
    if (savedCart != null) {
      final List<dynamic> cartData = jsonDecode(savedCart);
      _cartItems = cartData.map((item) => CartItem.fromJson(item)).toList();
      notifyListeners();
    }
  }

  void _saveCart() {
    final cartData = _cartItems.map((item) => item.toJson()).toList();
    _sharedPreferences!.setString(_cartKey, jsonEncode(cartData));
  }

  void addToCart(CartItem item) {
    final existingItemIndex = _cartItems.indexWhere(
      (cartItem) => cartItem.product['id'] == item.product['id'],
    );

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity++;
    } else {
      _cartItems.add(item);
    }

    _saveCart();
    notifyListeners();
  }

  void removeCartItem(CartItem item) {
    _cartItems.remove(item);
    _saveCart();
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _saveCart();
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    }
    _saveCart();
    notifyListeners();
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    _saveCart();
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _cartItems.remove(item);
    _saveCart();
    notifyListeners();
  }
}
