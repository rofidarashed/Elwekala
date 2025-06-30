import 'package:el_wekala/feature/cart/cubit/cart_state.dart';
import 'package:el_wekala/feature/cart/data/cart_data.dart';
import 'package:el_wekala/feature/cart/model/cart_model.dart';
import 'package:bloc/bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> _dataList = [];
  List<CartModel> get dataList => _dataList;

  bool isChosen(String id) {
    return _dataList.any((product) => product.id == id);
  }

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

  updateCartCubit({required String productId, required num quantity}) async {
    emit(CartLoadingState());
    await CartData.updateCart(productId: productId, quantity: quantity);
    emit(CartUpdateState());
    getCartCubit();
  }

  getCartCubit() async {
    emit(CartLoadingState());
    _dataList = await CartData.getCart();
    print("111111444444111aaaaaaa1$_dataList");
    emit(CartGetState(list: _dataList));
  }
}
