// To parse this JSON data, do
//
//     final userRegisterResponse = userRegisterResponseFromJson(jsonString);

import 'dart:convert';

UserRegisterResponse userRegisterResponseFromJson(String str) => UserRegisterResponse.fromJson(json.decode(str));

String userRegisterResponseToJson(UserRegisterResponse data) => json.encode(data.toJson());

class UserRegisterResponse {
  bool success;
  String message;
  RegisterData output;

  UserRegisterResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) => UserRegisterResponse(
    success: json["success"],
    message: json["message"],
    output: json["output"] != null ? RegisterData.fromJson(json["output"]): RegisterData(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": output.toJson(),
  };
}

class RegisterData {
  String? token;

  RegisterData({
     this.token,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
