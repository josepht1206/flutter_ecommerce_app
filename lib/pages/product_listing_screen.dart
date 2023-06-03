import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Product 1'),
            subtitle: const Text('Description of Product 1'),
            trailing: const Text('\$10.00'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProductDetailsScreen(productId: '1'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Product 2'),
            subtitle: const Text('Description of Product 2'),
            trailing: const Text('\$20.00'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProductDetailsScreen(productId: '2'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
