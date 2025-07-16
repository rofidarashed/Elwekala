import 'package:el_wekala/core/helper/values.dart';
import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:el_wekala/feature/profile/data/profile_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  bool isEdit = true;

  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    try {
      final profile = await ProfileData.profile(token: token);
      emit(ProfileGetDataSuccessState(profile));
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      emit(ProfileLoadingState());
      await ProfileData.updateProfile(name: name, email: email, phone: phone);
      await getProfile();
      isEdit = true;
      emit(ProfileGetDataSuccessState(await ProfileData.profile(token: token)));
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  Future<void> deleteProfile() async {
    try {
      emit(ProfileLoadingState());
      await ProfileData.deleteProfile();
      emit(ProfileDeleteState());
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  void toggleEdit() {
    isEdit = !isEdit;
    if (state is ProfileGetDataSuccessState) {
      emit((state as ProfileGetDataSuccessState).copyWith());
    }
  }

  void cancelEdit() {
    isEdit = true;
    if (state is ProfileGetDataSuccessState) {
      emit((state as ProfileGetDataSuccessState).copyWith());
    }
  }
}
