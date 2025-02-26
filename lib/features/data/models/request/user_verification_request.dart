// To parse this JSON data, do
//
//     final userVerificationRequest = userVerificationRequestFromJson(jsonString);

import 'dart:convert';

UserVerificationRequest userVerificationRequestFromJson(String str) => UserVerificationRequest.fromJson(json.decode(str));

String userVerificationRequestToJson(UserVerificationRequest data) => json.encode(data.toJson());

class UserVerificationRequest {
  String mobileNumber;

  UserVerificationRequest({
    required this.mobileNumber,
  });

  factory UserVerificationRequest.fromJson(Map<String, dynamic> json) => UserVerificationRequest(
    mobileNumber: json["mobile_number"],
  );

  Map<String, dynamic> toJson() => {
    "mobile_number": mobileNumber,
  };
}
