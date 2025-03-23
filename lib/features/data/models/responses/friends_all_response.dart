// To parse this JSON data, do
//
//     final friendsAllResponse = friendsAllResponseFromJson(jsonString);

import 'dart:convert';

FriendsAllResponse friendsAllResponseFromJson(String str) => FriendsAllResponse.fromJson(json.decode(str));

String friendsAllResponseToJson(FriendsAllResponse data) => json.encode(data.toJson());

class FriendsAllResponse {
  bool success;
  String message;
  List<FriendsAllData> output;

  FriendsAllResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory FriendsAllResponse.fromJson(Map<String, dynamic> json) => FriendsAllResponse(
    success: json["success"],
    message: json["message"],
    output: json["output"] != null ? List<FriendsAllData>.from(json["output"].map((x) => FriendsAllData.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": List<dynamic>.from(output.map((x) => x.toJson())),
  };
}

class FriendsAllData {
  int id;
  String fullName;
  String userName;
  String nic;
  String mobileNumber;
  int rank;
  int coins;
  int gems;

  FriendsAllData({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.nic,
    required this.mobileNumber,
    required this.rank,
    required this.coins,
    required this.gems,
  });

  factory FriendsAllData.fromJson(Map<String, dynamic> json) => FriendsAllData(
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
