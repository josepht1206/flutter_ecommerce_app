import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/models/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: const Text('Your cart is empty.'),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  leading: Image.network(
                    cartItem.product['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text(cartItem.product['title']),
                  subtitle: Text('\$${cartItem.product['price']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          cartProvider.decreaseQuantity(cartItem);
                        },
                      ),
                      Text('${cartItem.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          cartProvider.increaseQuantity(cartItem);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cartProvider.removeItem(cartItem);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cartProvider.clearCart();
                      },
                      child: const Text('Clear Cart'),
                    ),
                    Text(
                      'Total: \$${calculateTotal(cartItems)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  String calculateTotal(List<CartItem> cartItems) {
    double total = 0;
    for (final cartItem in cartItems) {
      final price = double.parse(cartItem.product['price'].toString());
      total += price * cartItem.quantity;
    }
    return total.toStringAsFixed(2);
  }
}
