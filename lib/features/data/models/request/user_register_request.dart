// To parse this JSON data, do
//
//     final userRegisterRequest = userRegisterRequestFromJson(jsonString);

import 'dart:convert';

UserRegisterRequest userRegisterRequestFromJson(String str) => UserRegisterRequest.fromJson(json.decode(str));

String userRegisterRequestToJson(UserRegisterRequest data) => json.encode(data.toJson());

class UserRegisterRequest {
  String fullName;
  String userName;
  String nicNumber;
  String mobileNumber;

  UserRegisterRequest({
    required this.fullName,
    required this.userName,
    required this.nicNumber,
    required this.mobileNumber,
  });

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) => UserRegisterRequest(
    fullName: json["full_name"],
    userName: json["user_name"],
    nicNumber: json["nic_number"],
    mobileNumber: json["mobile_number"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "user_name": userName,
    "nic_number": nicNumber,
    "mobile_number": mobileNumber,
  };
}
