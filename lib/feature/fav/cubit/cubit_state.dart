// import 'package:ap2/feature/fav/model/fav_model.dart';
import 'package:ap2/feature/home/model/product_model.dart';

sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavAddSuccess extends FavState {
  final List<dynamic> list;
  FavAddSuccess({required this.list});
}

final class FavAddFailed extends FavState {}
