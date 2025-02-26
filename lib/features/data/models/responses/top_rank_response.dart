// To parse this JSON data, do
//
//     final topRankResponse = topRankResponseFromJson(jsonString);

import 'dart:convert';

TopRankResponse topRankResponseFromJson(String str) => TopRankResponse.fromJson(json.decode(str));

String topRankResponseToJson(TopRankResponse data) => json.encode(data.toJson());

class TopRankResponse {
  bool success;
  String message;
  List<TopRankData> output;

  TopRankResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory TopRankResponse.fromJson(Map<String, dynamic> json) => TopRankResponse(
    success: json["success"],
    message: json["message"],
    output: json["output"] != null ? List<TopRankData>.from(json["output"].map((x) => TopRankData.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": List<dynamic>.from(output.map((x) => x.toJson())),
  };
}

class TopRankData {
  int? userId;
  String? fullName;
  int? rank;
  String? profileImage;

  TopRankData({
     this.userId,
     this.fullName,
     this.rank,
     this.profileImage,
  });

  factory TopRankData.fromJson(Map<String, dynamic> json) => TopRankData(
    userId: json["user_id"],
    fullName: json["full_name"],
    rank: json["rank"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "full_name": fullName,
    "rank": rank,
    "profile_image": profileImage,
  };
}
