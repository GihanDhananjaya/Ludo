// To parse this JSON data, do
//
//     final otpSubmitRequest = otpSubmitRequestFromJson(jsonString);

import 'dart:convert';

OtpSubmitRequest otpSubmitRequestFromJson(String str) => OtpSubmitRequest.fromJson(json.decode(str));

String otpSubmitRequestToJson(OtpSubmitRequest data) => json.encode(data.toJson());

class OtpSubmitRequest {
  String mobileNumber;
  String referenceCode;
  String otp;

  OtpSubmitRequest({
    required this.mobileNumber,
    required this.referenceCode,
    required this.otp,
  });

  factory OtpSubmitRequest.fromJson(Map<String, dynamic> json) => OtpSubmitRequest(
    mobileNumber: json["mobile_number"],
    referenceCode: json["reference_code"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "mobile_number": mobileNumber,
    "reference_code": referenceCode,
    "otp": otp,
  };
}
