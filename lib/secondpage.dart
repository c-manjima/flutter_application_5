import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Youth Face Whitening Cream Original',
      imageUrl: 'https://example.com/image1.jpg',
      description: 'Cream · Hyperpigmentation',
      price: 599.0,
    ),
    Product(
      name: 'Youth Face Cream Superpower Eternal',
      imageUrl: 'https://example.com/image2.jpg',
      description: 'Cream · Hyperpigmentation, Wrinkles · Eye · Jar',
      price: 1799.0,
    ),
    Product(
      name: 'Youth Face Whitening Cream 100% Original',
      imageUrl: 'https://example.com/image3.jpg',
      description: 'Cream',
      price: 549.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Listing'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(product.description),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('₹${product.price.toString()}'),
          ),
        ],
      ),
    );
  }
}
