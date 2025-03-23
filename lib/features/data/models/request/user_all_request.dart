// To parse this JSON data, do
//
//     final userAllRequest = userAllRequestFromJson(jsonString);

import 'dart:convert';

UserAllRequest userAllRequestFromJson(String str) => UserAllRequest.fromJson(json.decode(str));

String userAllRequestToJson(UserAllRequest data) => json.encode(data.toJson());

class UserAllRequest {
  String searchQuery;

  UserAllRequest({
    required this.searchQuery,
  });

  factory UserAllRequest.fromJson(Map<String, dynamic> json) => UserAllRequest(
    searchQuery: json["search_query"],
  );

  Map<String, dynamic> toJson() => {
    "search_query": searchQuery,
  };
}
