import 'dart:convert';
import 'dart:io';
import 'package:el_wekala/core/helper/values.dart';
import 'package:el_wekala/feature/auth/cubit/auth_state.dart';
import 'package:el_wekala/feature/auth/data/auth_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  String? profileImage;
  File? image;

  ImagePicker picker = ImagePicker();

  saveImage() async {
    final picked = await picker.pickImage(source: ImageSource.camera);
    image = File(picked!.path);
    var bytes = image!.readAsBytesSync();
    profileImage = base64Encode(bytes);
    emit(AuthUpdateImageState());
  }

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
      profileImage: profileImage ?? "",
    );
    emit(AuthAddSuccessState(model: model));
  }

  loginCubit({required String email, required String password}) async {
    try {
      emit(AuthLoadingState());
      var model = await AuthData.login(email: email, password: password);
      print("login success $model");
    
      emit(AuthLoginSuccessState(model: model, token: token));
    } catch (e) {
      ScaffoldMessenger(child: SnackBar(content: Text("Error $e")));
    }
  }
}
