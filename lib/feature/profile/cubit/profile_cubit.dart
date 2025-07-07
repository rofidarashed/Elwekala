import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:el_wekala/feature/profile/data/profile_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  getProfileCubit({required String token}) async {
    emit(ProfileLoadingState());
    var model = await ProfileData.profile(token: token);
    emit(ProfileGetDataSuccessState(model: model));
  }
}
