// To parse this JSON data, do
//
//     final userAllResponse = userAllResponseFromJson(jsonString);

import 'dart:convert';

UserAllResponse userAllResponseFromJson(String str) => UserAllResponse.fromJson(json.decode(str));

String userAllResponseToJson(UserAllResponse data) => json.encode(data.toJson());

class UserAllResponse {
  bool success;
  String message;
  List<UserAllData> output;

  UserAllResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory UserAllResponse.fromJson(Map<String, dynamic> json) => UserAllResponse(
    success: json["success"],
    message: json["message"],
    output: json["output"] != null ? List<UserAllData>.from(json["output"].map((x) => UserAllData.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": List<dynamic>.from(output.map((x) => x.toJson())),
  };
}

class UserAllData {
  int id;
  String fullName;
  String userName;
  String nic;
  String mobileNumber;
  int rank;
  int coins;
  int gems;

  UserAllData({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.nic,
    required this.mobileNumber,
    required this.rank,
    required this.coins,
    required this.gems,
  });

  factory UserAllData.fromJson(Map<String, dynamic> json) => UserAllData(
    id: json["id"],
    fullName: json["full_name"],
    userName: json["user_name"],
    nic: json["nic"],
    mobileNumber: json["mobile_number"],
    rank: json["rank"],
    coins: json["coins"],
    gems: json["gems"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "user_name": userName,
    "nic": nic,
    "mobile_number": mobileNumber,
    "rank": rank,
    "coins": coins,
    "gems": gems,
  };
}
