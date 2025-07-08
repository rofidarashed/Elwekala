import 'package:el_wekala/feature/profile/data/profile_model.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileEditState extends ProfileState {}

final class ProfileGetDataSuccessState extends ProfileState {
  final ProfileModel model;

  ProfileGetDataSuccessState({required this.model});
}
