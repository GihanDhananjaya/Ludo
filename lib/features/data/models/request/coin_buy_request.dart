// To parse this JSON data, do
//
//     final coinBuyRequest = coinBuyRequestFromJson(jsonString);

import 'dart:convert';

CoinBuyRequest coinBuyRequestFromJson(String str) => CoinBuyRequest.fromJson(json.decode(str));

String coinBuyRequestToJson(CoinBuyRequest data) => json.encode(data.toJson());

class CoinBuyRequest {
  int userId;
  int traderId;
  int amount;
  String slipUrl;
  int paymentType;

  CoinBuyRequest({
    required this.userId,
    required this.traderId,
    required this.amount,
    required this.slipUrl,
    required this.paymentType,
  });

  factory CoinBuyRequest.fromJson(Map<String, dynamic> json) => CoinBuyRequest(
    userId: json["user_id"],
    traderId: json["trader_id"],
    amount: json["amount"],
    slipUrl: json["slip_url"],
    paymentType: json["payment_type"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "trader_id": traderId,
    "amount": amount,
    "slip_url": slipUrl,
    "payment_type": paymentType,
  };
}
