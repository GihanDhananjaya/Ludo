// To parse this JSON data, do
//
//     final traderAllResponse = traderAllResponseFromJson(jsonString);

import 'dart:convert';

TraderAllResponse traderAllResponseFromJson(String str) => TraderAllResponse.fromJson(json.decode(str));

String traderAllResponseToJson(TraderAllResponse data) => json.encode(data.toJson());

class TraderAllResponse {
  bool success;
  String message;
  List<TraderAllData> output;

  TraderAllResponse({
    required this.success,
    required this.message,
    required this.output,
  });

  factory TraderAllResponse.fromJson(Map<String, dynamic> json) => TraderAllResponse(
    success: json["success"],
    message: json["message"],
    output: json["output"] != null ? List<TraderAllData>.from(json["output"].map((x) => TraderAllData.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "output": List<dynamic>.from(output.map((x) => x.toJson())),
  };
}

class TraderAllData {
  int id;
  String fullName;
  String traderNumber;
  int isVerified;
  int availableCoins;
  int minCoinLimit;
  int maxCoinLimit;
  double coinValue;
  Account account;

  TraderAllData({
    required this.id,
    required this.fullName,
    required this.traderNumber,
    required this.isVerified,
    required this.availableCoins,
    required this.minCoinLimit,
    required this.maxCoinLimit,
    required this.coinValue,
    required this.account,
  });

  factory TraderAllData.fromJson(Map<String, dynamic> json) => TraderAllData(
    id: json["id"],
    fullName: json["full_name"],
    traderNumber: json["trader_number"],
    isVerified: json["is_verified"],
    availableCoins: json["available_coins"],
    minCoinLimit: json["min_coin_limit"],
    maxCoinLimit: json["max_coin_limit"],
    coinValue: json["coin_value"]?.toDouble(),
    account: Account.fromJson(json["account"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "trader_number": traderNumber,
    "is_verified": isVerified,
    "available_coins": availableCoins,
    "min_coin_limit": minCoinLimit,
    "max_coin_limit": maxCoinLimit,
    "coin_value": coinValue,
    "account": account.toJson(),
  };
}

class Account {
  String accountNumber;
  String holderName;
  String bank;
  String branch;

  Account({
    required this.accountNumber,
    required this.holderName,
    required this.bank,
    required this.branch,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    accountNumber: json["account_number"],
    holderName: json["holder_name"],
    bank: json["bank"],
    branch: json["branch"],
  );

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "holder_name": holderName,
    "bank": bank,
    "branch": branch,
  };
}
