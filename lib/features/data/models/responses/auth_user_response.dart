// To parse this JSON data, do
//
//     final authUserResponse = authUserResponseFromJson(jsonString);

import 'dart:convert';

AuthUserResponse authUserResponseFromJson(String str) => AuthUserResponse.fromJson(json.decode(str));

String authUserResponseToJson(AuthUserResponse data) => json.encode(data.toJson());

class AuthUserResponse {
  bool success;
  String message;
  AuthUser output;

  AuthUserResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory AuthUserResponse.fromJson(Map<String, dynamic> json) => AuthUserResponse(
    success: json["success"],
    message: json["message"],
    output: json["output"] != null ?AuthUser.fromJson(json["output"]):AuthUser(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": output.toJson(),
  };
}

class AuthUser {
  String? fullName;
  String? userName;
  String? nic;
  String? mobileNumber;
  int? rank;
  int? coins;
  int? gems;

  AuthUser({
     this.fullName,
     this.userName,
     this.nic,
     this.mobileNumber,
     this.rank,
     this.coins,
     this.gems,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
    fullName: json["full_name"],
    userName: json["user_name"],
    nic: json["nic"],
    mobileNumber: json["mobile_number"],
    rank: json["rank"],
    coins: json["coins"],
    gems: json["gems"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "user_name": userName,
    "nic": nic,
    "mobile_number": mobileNumber,
    "rank": rank,
    "coins": coins,
    "gems": gems,
  };
}
