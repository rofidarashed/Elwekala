import 'package:el_wekala/feature/profile/data/profile_model.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileGetDataSuccessState extends ProfileState {
  final ProfileModel model;
  ProfileGetDataSuccessState(this.model);

  ProfileGetDataSuccessState copyWith() {
    return ProfileGetDataSuccessState(model);
  }
}

class ProfileUpdateSuccessState extends ProfileState {} // why is this a separate state? can't remeber its ok baby...

class ProfileDeleteState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;
  ProfileErrorState(this.message);
}
