import 'package:el_wekala/feature/fav/cubit/fav_state.dart';
import 'package:el_wekala/feature/fav/data/favs_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:el_wekala/feature/home/model/product_model.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  List<ProductModel> _favList = [];

  List<ProductModel> get favList => _favList;

  bool isFav(String id) {
    return _favList.any((product) => product.id == id);
  }

  Future<void> addFavCubit({required String id}) async {
    emit(FavLoading());
    await FavData.addFav(id: id);
    emit(FavAddSuccess());
    await getFavCubit();
  }

  Future<void> deleteFavCubit({required String id}) async {
    emit(FavLoading());
    await FavData.deleteFav(id: id);
    emit(FavDelete());
    await getFavCubit();
  }

  Future<void> getFavCubit() async {
    emit(FavLoading());
    _favList = await FavData.getFav();
    emit(FavSuccess(list: _favList));
  }
}
