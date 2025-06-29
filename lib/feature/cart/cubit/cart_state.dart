sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

final class CartAddSuccessState extends CartState {}

final class CartEditState extends CartState {}

final class CartGetState extends CartState {
  final List<dynamic> list;

  CartGetState({required this.list});
}

final class CartDeleteState extends CartState {}
