import 'package:ap2/feature/fav/cubit/cubit_state.dart';
import 'package:ap2/feature/fav/data/get_fav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  GetFav getFav =   GetFav();
  addFavCubit(String id) async {
    emit(FavLoading());
    emit(FavAddSuccess(list: await getFav.getFav(id)));
  }
}
