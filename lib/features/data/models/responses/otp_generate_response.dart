// To parse this JSON data, do
//
//     final otpGenerateResponse = otpGenerateResponseFromJson(jsonString);

import 'dart:convert';

OtpGenerateResponse otpGenerateResponseFromJson(String str) => OtpGenerateResponse.fromJson(json.decode(str));

String otpGenerateResponseToJson(OtpGenerateResponse data) => json.encode(data.toJson());

class OtpGenerateResponse {
  bool success;
  String message;
  OtpGenerateData output;

  OtpGenerateResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory OtpGenerateResponse.fromJson(Map<String, dynamic> json) => OtpGenerateResponse(
    success: json["success"],
    message: json["message"],
    output: json["output"] != null ? OtpGenerateData.fromJson(json["output"]):OtpGenerateData(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": output.toJson(),
  };
}

class OtpGenerateData {
  String? referenceCode;

  OtpGenerateData({
     this.referenceCode,
  });

  factory OtpGenerateData.fromJson(Map<String, dynamic> json) => OtpGenerateData(
    referenceCode: json["reference_code"],
  );

  Map<String, dynamic> toJson() => {
    "reference_code": referenceCode,
  };
}
