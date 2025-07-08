import 'package:el_wekala/feature/profile/data/profile_model.dart';

class ResponseModel {
  final String message;
  final String status;
  final ProfileModel? userModel;

  ResponseModel({required this.message, required this.status, this.userModel});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      userModel: json["user"] != null
          ? ProfileModel.fromJson(json['user'])
          : null,
      message: json["message"],
      status: json["status"],
    );
  }
}
