// To parse this JSON data, do
//
//     final createBatchResponse = createBatchResponseFromJson(jsonString);

import 'dart:convert';

CommonResponse createBatchResponseFromJson(String str) => CommonResponse.fromJson(json.decode(str));

String createBatchResponseToJson(CommonResponse data) => json.encode(data.toJson());

class CommonResponse {
  bool success;
  String message;

  CommonResponse({
    required this.success,
    required this.message,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
