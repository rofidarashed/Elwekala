import 'package:ap2/feature/fav/cubit/fav_state.dart';
import 'package:ap2/feature/fav/data/favs_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  addFavCubit({required String id}) async {
    emit(FavLoading());
    await FavData.addFav(id: id);
    emit(FavAddSuccess());
    getFavCubit();
  }

  deleteFavCubit({required String id}) async {
    emit(FavLoading());
    await FavData.deleteFav(id: id);
    emit(FavDelete());
    getFavCubit();
  }

  getFavCubit() async {
    emit(FavLoading());
    var get = await FavData.getFav();
    emit(FavSuccess(list: get));
  }
}
