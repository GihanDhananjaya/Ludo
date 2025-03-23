// To parse this JSON data, do
//
//     final friendsAllRequest = friendsAllRequestFromJson(jsonString);

import 'dart:convert';

FriendsAllRequest friendsAllRequestFromJson(String str) => FriendsAllRequest.fromJson(json.decode(str));

String friendsAllRequestToJson(FriendsAllRequest data) => json.encode(data.toJson());

class FriendsAllRequest {
  int userId;

  FriendsAllRequest({
    required this.userId,
  });

  factory FriendsAllRequest.fromJson(Map<String, dynamic> json) => FriendsAllRequest(
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
  };
}
