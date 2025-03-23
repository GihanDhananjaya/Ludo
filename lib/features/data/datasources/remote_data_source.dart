import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../core/network/api_helper.dart';
import '../../../core/network/mock_api_helper.dart';
import '../models/common/common_response.dart';
import '../models/request/coin_buy_request.dart';
import '../models/request/friends_all_request.dart';
import '../models/request/otp_generate_request.dart';
import '../models/request/otp_submit_request.dart';
import '../models/request/user_all_request.dart';
import '../models/request/user_register_request.dart';
import '../models/request/user_verification_request.dart';
import '../models/responses/auth_user_response.dart';
import '../models/responses/friends_all_response.dart';
import '../models/responses/master_data_response.dart';
import '../models/responses/otp_generate_response.dart';
import '../models/responses/otp_submit_response.dart';
import '../models/responses/top_rank_response.dart';
import '../models/responses/trader_all_response.dart';
import '../models/responses/user_all_response.dart';
import '../models/responses/user_register_response.dart';
import '../models/responses/user_verification_fail_response.dart';
import '../models/responses/user_verification_response.dart';


abstract class RemoteDataSource {
  Future<UserRegisterResponse> userRegisterDataAPI(
      UserRegisterRequest userRegisterRequest);
  Future<AuthUserResponse> authUserGetAPI();
  Future<UserVerificationResponse> userVerificationDataAPI(
      UserVerificationRequest userVerificationRequest);
  Future<OtpGenerateResponse> otpGenerateDataAPI(
      OtpGenerateRequest otpGenerateRequest);
  Future<OtpSubmitResponse> otpSubmitDataAPI(
      OtpSubmitRequest otpSubmitRequest);
  Future<TopRankResponse> topRankGetAPI();
  Future<MasterDataResponse> masterDataGetAPI();
  Future<FriendsAllResponse> friendsAllDataAPI(
      FriendsAllRequest friendsAllRequest);
  Future<UserAllResponse> userAllDataAPI(
      UserAllRequest userAllRequest);
  Future<TraderAllResponse> traderAllAPI();
  Future<CommonResponse> coinBuyAPI(
      CoinBuyRequest coinBuyRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final APIHelper apiHelper;
  final MockAPIHelper mockAPIHelper;

  RemoteDataSourceImpl({required this.apiHelper,  required this.mockAPIHelper});

  @override
  Future<UserRegisterResponse> userRegisterDataAPI(UserRegisterRequest userRegisterRequest) async {
    try {
      final response = await mockAPIHelper.post(
        "user/register",
        body: userRegisterRequest.toJson(),
      );
      return UserRegisterResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<AuthUserResponse> authUserGetAPI() async {
    try {
      final response = await mockAPIHelper.post("user/data", body: null);
      return AuthUserResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<UserVerificationResponse> userVerificationDataAPI(UserVerificationRequest userVerificationRequest) async {
    try {
      final response = await mockAPIHelper.post(
        "user/verify",
        body: userVerificationRequest.toJson(),
      );
      return UserVerificationResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }



  @override
  Future<OtpGenerateResponse> otpGenerateDataAPI(OtpGenerateRequest otpGenerateRequest) async {
    try {
      final response = await mockAPIHelper.post(
        "otp/generate",
        body: otpGenerateRequest.toJson(),
      );
      return OtpGenerateResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<OtpSubmitResponse> otpSubmitDataAPI(OtpSubmitRequest otpSubmitRequest) async {
    try {
      final response = await mockAPIHelper.post(
        "otp/submit",
        body: otpSubmitRequest.toJson(),
      );
      return OtpSubmitResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<TopRankResponse> topRankGetAPI() async {
    try {
      final response = await mockAPIHelper.post("rank/top", body: null);
      return TopRankResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<MasterDataResponse> masterDataGetAPI() async {
    try {
      final response = await mockAPIHelper.post("master/get", body: null);
      return MasterDataResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<FriendsAllResponse> friendsAllDataAPI(FriendsAllRequest friendsAllRequest) async {
    try {
      final response = await mockAPIHelper.post(
        "user/friend/all",
        body: friendsAllRequest.toJson(),
      );
      return FriendsAllResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<UserAllResponse> userAllDataAPI(UserAllRequest userAllRequest) async {
    try {
      final response = await mockAPIHelper.post(
        "user/all",
        body: userAllRequest.toJson(),
      );
      return UserAllResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<TraderAllResponse> traderAllAPI() async {
    try {
      final response = await mockAPIHelper.post("trader/all", body: null);
      return TraderAllResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<CommonResponse> coinBuyAPI(CoinBuyRequest coinBuyRequest) async {
    try {
      final response = await mockAPIHelper.post(
        "coin/buy",
        body: coinBuyRequest.toJson(),
      );
      return CommonResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

}
