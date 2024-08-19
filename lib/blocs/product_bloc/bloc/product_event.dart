part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class LoadProducts extends ProductEvent {}

class getProducts extends ProductEvent {
  final List<Product> products;

  getProducts(this.products);
}
