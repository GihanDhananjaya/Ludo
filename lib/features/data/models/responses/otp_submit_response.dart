// To parse this JSON data, do
//
//     final otpSubmitResponse = otpSubmitResponseFromJson(jsonString);

import 'dart:convert';

OtpSubmitResponse otpSubmitResponseFromJson(String str) => OtpSubmitResponse.fromJson(json.decode(str));

String otpSubmitResponseToJson(OtpSubmitResponse data) => json.encode(data.toJson());

class OtpSubmitResponse {
  bool success;
  String message;

  OtpSubmitResponse({
    required this.success,
    required this.message,
  });

  factory OtpSubmitResponse.fromJson(Map<String, dynamic> json) => OtpSubmitResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
