// To parse this JSON data, do
//
//     final userVerificationFailResponse = userVerificationFailResponseFromJson(jsonString);

import 'dart:convert';

UserVerificationFailResponse userVerificationFailResponseFromJson(String str) => UserVerificationFailResponse.fromJson(json.decode(str));

String userVerificationFailResponseToJson(UserVerificationFailResponse data) => json.encode(data.toJson());

class UserVerificationFailResponse {
  bool success;
  String message;
  dynamic output;

  UserVerificationFailResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory UserVerificationFailResponse.fromJson(Map<String, dynamic> json) => UserVerificationFailResponse(
    success: json["success"],
    message: json["message"],
    output: json["output"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": output,
  };
}
