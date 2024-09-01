import 'dart:developer';

import 'package:ecom/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:ecom/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          surfaceTintColor: Colors.blue.shade500,
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: const Text(
            'Cart',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.blue.shade200,
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              context.read<CartBloc>().add(LoadCartEvent());
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartLoaded) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87,
                                letterSpacing: 1.1,
                                wordSpacing: 1.2,
                              ),
                            ),
                            subtitle: Text(
                              '\$${product.price}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey[700]),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                log('${product.name} removed from cart');
                                context
                                    .read<CartBloc>()
                                    .add(RemoveFromCartEvent(product));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text('Product removed from cart'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(product: product),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  });
            }

            return const Center(
              child: Text(
                'No products in cart',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            );
          },
        ));
  }
}
