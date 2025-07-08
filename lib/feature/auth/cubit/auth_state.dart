import 'package:el_wekala/feature/auth/model/response_model.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthAddSuccessState extends AuthState {
  final ResponseModel model;

  AuthAddSuccessState({required this.model,});
}

final class AuthUpdateImageState extends AuthState {}

final class AuthLoginSuccessState extends AuthState {
  final ResponseModel model;
  final String token;

  AuthLoginSuccessState({required this.model, required this.token});
}
