// To parse this JSON data, do
//
//     final otpGenerateRequest = otpGenerateRequestFromJson(jsonString);

import 'dart:convert';

OtpGenerateRequest otpGenerateRequestFromJson(String str) => OtpGenerateRequest.fromJson(json.decode(str));

String otpGenerateRequestToJson(OtpGenerateRequest data) => json.encode(data.toJson());

class OtpGenerateRequest {
  String mobileNumber;
  int shouldGenerate;

  OtpGenerateRequest({
    required this.mobileNumber,
    required this.shouldGenerate,
  });

  factory OtpGenerateRequest.fromJson(Map<String, dynamic> json) => OtpGenerateRequest(
    mobileNumber: json["mobile_number"],
    shouldGenerate: json["should_generate"],
  );

  Map<String, dynamic> toJson() => {
    "mobile_number": mobileNumber,
    "should_generate": shouldGenerate,
  };
}
