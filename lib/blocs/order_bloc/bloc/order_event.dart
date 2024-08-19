part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class LoadOrders extends OrderEvent {}
