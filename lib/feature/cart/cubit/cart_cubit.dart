import 'package:ap2/feature/cart/cubit/cart_state.dart';
import 'package:ap2/feature/cart/data/cart_data.dart';
import 'package:bloc/bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  addCartCubit({required String productId}) async {
    emit(CartLoadingState());
    await CartData.addCart(productId: productId);
    emit(CartAddSuccessState());
    getCartCubit();
  }

  deleteCartCubit({required String productId}) async {
    emit(CartLoadingState());
    await CartData.deleteCart(productId: productId);
    emit(CartDeleteState());
    getCartCubit();
  }

  getCartCubit() async {
    emit(CartLoadingState());
    var dataList = await CartData.getCart();
    print("111111444444111aaaaaaa1$dataList");
    emit(CartGetState(list: dataList));
  }
}
