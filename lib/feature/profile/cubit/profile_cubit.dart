import 'package:el_wekala/core/helper/values.dart';
import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:el_wekala/feature/profile/data/profile_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  bool isEdit = true;

  edit() {
    isEdit = false;
    emit(ProfileEditState());
    getProfileCubit();
  }

  cancelEdit() {
    isEdit = true;
    emit(ProfileEditState());
    getProfileCubit();
  }

  getProfileCubit() async {
    emit(ProfileLoadingState());
    var model = await ProfileData.profile(token: token);
    emit(ProfileGetDataSuccessState(model: model));
  }

  updateProfileCubit({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(ProfileLoadingState());
    await ProfileData.updateProfile(name: name, email: email, phone: phone);
    isEdit = true;
    getProfileCubit();
  }
}
