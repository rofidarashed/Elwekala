import 'package:el_wekala/feature/auth/cubit/auth_state.dart';
import 'package:el_wekala/feature/auth/data/auth_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  authCubit({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,

  }) async {
    emit(AuthLoadingState());
    var model = await AuthData.register(
      name: name,
      email: email,
      phone: phone,
      nationalId: nationalId,
      gender: gender,
      password: password, 
    );
    emit(AuthAddSuccessState(model: model));
  }
}
