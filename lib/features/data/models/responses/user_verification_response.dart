// To parse this JSON data, do
//
//     final userVerificationResponse = userVerificationResponseFromJson(jsonString);

import 'dart:convert';

UserVerificationResponse userVerificationResponseFromJson(String str) => UserVerificationResponse.fromJson(json.decode(str));

String userVerificationResponseToJson(UserVerificationResponse data) => json.encode(data.toJson());

class UserVerificationResponse {
  bool success;
  String message;
  UserVerificationData output;

  UserVerificationResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory UserVerificationResponse.fromJson(Map<String, dynamic> json) => UserVerificationResponse(
    success: json["success"],
    message: json["message"],
    output:json["output"] != null ? UserVerificationData.fromJson(json["output"]):UserVerificationData(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": output.toJson(),
  };
}

class UserVerificationData {
  String? token;

  UserVerificationData({
     this.token,
  });

  factory UserVerificationData.fromJson(Map<String, dynamic> json) => UserVerificationData(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
