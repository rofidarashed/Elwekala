import 'package:el_wekala/feature/home/cubit/home_state.dart';
import 'package:el_wekala/feature/home/data/get_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
 

  dataCubit() async {
    emit(HomeLoading());
    emit(HomeSuccess(list:await getData()));
  }
}
