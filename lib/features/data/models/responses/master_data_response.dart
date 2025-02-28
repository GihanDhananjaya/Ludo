// To parse this JSON data, do
//
//     final masterDataResponse = masterDataResponseFromJson(jsonString);

import 'dart:convert';

MasterDataResponse masterDataResponseFromJson(String str) => MasterDataResponse.fromJson(json.decode(str));

String masterDataResponseToJson(MasterDataResponse data) => json.encode(data.toJson());

class MasterDataResponse {
  bool success;
  String message;
  MasterData output;

  MasterDataResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory MasterDataResponse.fromJson(Map<String, dynamic> json) => MasterDataResponse(
    success: json["success"],
    message: json["message"],
    output: json["output"]!= null ? MasterData.fromJson(json["output"]):MasterData(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": output.toJson(),
  };
}

class MasterData {
  int? freeCoins;

  MasterData({
     this.freeCoins,
  });

  factory MasterData.fromJson(Map<String, dynamic> json) => MasterData(
    freeCoins: json["free_coins"],
  );

  Map<String, dynamic> toJson() => {
    "free_coins": freeCoins,
  };
}
