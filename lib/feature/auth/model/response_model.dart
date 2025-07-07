class ResponseModel {
  final String message;
  final String status;
   final String? token;

  ResponseModel({required this.message, required this.status,this.token,  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {

    final token = json["token"] ?? 
               (json["user"] != null ? json["user"]["token"] : null);
  
    return ResponseModel(
    token:  token,
      message: json["message"],
      status: json["status"],
    );
  }
}
