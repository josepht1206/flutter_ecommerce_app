import 'package:flutter/material.dart';
import 'package:ecommerce_app/pages/cart_screen.dart';
import 'package:ecommerce_app/pages/product_listing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductListingScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_bag),
              label: const Text('Product Listing'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
