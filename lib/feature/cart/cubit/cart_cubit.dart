import 'package:bloc/bloc.dart';
import 'package:el_wekala/feature/cart/cubit/cart_state.dart';
import 'package:el_wekala/feature/cart/data/cart_data.dart';
import 'package:el_wekala/feature/cart/model/cart_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  List<CartModel> cartItems = [];
  List<CartModel> get dataList => cartItems;

  bool isChosen(String id) {
    return cartItems.any((product) => product.id == id);
  }

  Future<void> getCart() async {
    emit(CartLoadingState());
    try {
      cartItems = await CartData.getCart();

      emit(CartGetState(cartItems));
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  Future<void> addToCart(String productId) async {
    try {
      await CartData.addCart(productId: productId);
      await getCart();
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  Future<void> deleteCartItem(String productId) async {
    try {
      await CartData.deleteCart(productId: productId);
      await getCart();
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  Future<void> updateCartItem(String productId, int quantity) async {
    try {
      await CartData.updateCart(productId: productId, quantity: quantity,);
      await getCart();
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  bool isInCart(String productId) {
    if (state is CartGetState) {
      return (state as CartGetState).list.any((item) => item.id == productId);
    }
    return false;
  }
}
