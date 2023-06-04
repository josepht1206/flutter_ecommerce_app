import 'package:flutter/material.dart';

import '../models/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartProduct> cartProducts = Cart.getCartProducts();

  void _updateCartProducts() {
    setState(() {
      cartProducts = Cart.getCartProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final cartProduct = cartProducts[index];
          return ListTile(
            leading: Image.network(cartProduct.product.image),
            title: Text(cartProduct.product.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$${cartProduct.product.price}'),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          Cart.decreaseQuantity(cartProduct);
                        });
                      },
                    ),
                    Text(cartProduct.quantity.toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          Cart.increaseQuantity(cartProduct);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Cart.removeProduct(cartProduct);
                _updateCartProducts();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product removed from cart'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CartProduct {
  final Product product;
  int quantity;

  CartProduct({required this.product, this.quantity = 1});
}

class Cart {
  static final List<CartProduct> _cartProducts = [];

  static void addProduct(Product product) {
    final existingProductIndex = _cartProducts.indexWhere(
      (cartProduct) => cartProduct.product.id == product.id,
    );

    if (existingProductIndex != -1) {
      _cartProducts[existingProductIndex].quantity++;
    } else {
      final cartProduct = CartProduct(product: product);
      _cartProducts.add(cartProduct);
    }
  }

  static void removeProduct(CartProduct cartProduct) {
    _cartProducts.remove(cartProduct);
  }

  static void increaseQuantity(CartProduct cartProduct) {
    cartProduct.quantity++;
  }

  static void decreaseQuantity(CartProduct cartProduct) {
    if (cartProduct.quantity > 1) {
      cartProduct.quantity--;
    }
  }

  static List<CartProduct> getCartProducts() {
    return List.from(_cartProducts);
  }
}
