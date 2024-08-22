import 'dart:developer';

import 'package:ecom/blocs/cart_bloc/bloc/cart_bloc.dart';

import 'package:ecom/models/product_model.dart';
import 'package:ecom/ui/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.product});

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length > 3) {
      return '${words[0]} ${words[1]} ${words[2]}...';
    }
    return title;
  }

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        // title: Text(product.name),
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text(
          truncateTitle(product.name),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blue.shade200,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 32,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.network(product.imageUrl, height: 300),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    // letterSpacing: 1.1,
                    // wordSpacing: 1.2,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                '\$${product.price}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700]),
              ),
              SizedBox(height: Get.height * 0.03),
              ElevatedButton(
                onPressed: () {
                  // log('${product.name} added to cart');
                  log('${product.name} added to cart');
                  context.read<CartBloc>().add(AddToCartEvent(product));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Product added to cart'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text('Add to Cart'),
              ),
              SizedBox(height: Get.height * 0.01),
              ElevatedButton(
                onPressed: () {
                  // log('${product.name} added to cart');
                  log('${product.name} ready to buy');
                  context.read<CartBloc>().add(AddToCartEvent(product));
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     duration: Duration(seconds: 1),
                  //     content: Text('Product added to cart'),
                  //     backgroundColor: Colors.green,
                  //   ),
                  // );
                },
                child: const Text('Buy Now'),
              ),
              ElevatedButton(
                onPressed: () {
                  // // log('${product.name} added to cart');
                  // log('${product.name} ready to buy');
                  // context.read<CartBloc>().add(AddToCartEvent(product));
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     duration: Duration(seconds: 1),
                  //     content: Text('Product added to cart'),
                  //     backgroundColor: Colors.green,
                  //   ),
                  // );
                },
                child: const Text('More Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
