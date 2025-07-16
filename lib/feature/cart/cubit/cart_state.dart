
import 'package:el_wekala/feature/cart/model/cart_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartGetState extends CartState {
  final List<CartModel> list;
  CartGetState(this.list);
}

class CartErrorState extends CartState {
  final String message;
  CartErrorState(this.message);
}