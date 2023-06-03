import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          const Text('Product Name'),
          const Text('Product Price'),
          const Text('Product Description'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
