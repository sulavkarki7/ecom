import 'dart:async';
// import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecom/models/product_model.dart';
import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    // _loadCart();
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<LoadCartEvent>(_onLoadCart);
  }

  // Future<void> _loadCart() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final cartJson = prefs.getString('cart') ?? '[]';
  //   final cartList = json.decode(cartJson) as List<dynamic>;
  //   final products = cartList.map((e) => Product.fromJson(e)).toList();
  //   add(CartLoaded(products) as CartEvent);
  // }

  // Future<void> _saveCart(List<Product> products) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final cartJson = json.encode(products.map((e) => e.toJson()).toList());
  //   await prefs.setString('cart', cartJson);
  // }

  FutureOr<void> _onAddToCart(
      AddToCartEvent event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedProducts = List<Product>.from(currentState.products)
        ..add(event.product);
      // await _saveCart(updatedProducts);
      emit(CartLoaded(updatedProducts));
    } else {
      // await _saveCart([event.product]);

      emit(CartLoaded([event.product]));
    }
  }

  FutureOr<void> _onRemoveFromCart(
      RemoveFromCartEvent event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedProducts = List<Product>.from(currentState.products)
        ..remove(event.product);
      // await _saveCart(updatedProducts);
      emit(CartLoaded(updatedProducts));
    } else {
      // await _saveCart([event.product]);
      emit(CartLoaded([event.product]));
    }
  }

  FutureOr<void> _onLoadCart(LoadCartEvent event, Emitter<CartState> emit) {
    emit(CartLoading());
    emit(CartLoaded([]));
  }
}
