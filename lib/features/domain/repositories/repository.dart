import 'package:dartz/dartz.dart';


import '../../../error/failures.dart';
import '../../data/models/common/common_response.dart';
import '../../data/models/request/coin_buy_request.dart';
import '../../data/models/request/friends_all_request.dart';
import '../../data/models/request/otp_generate_request.dart';
import '../../data/models/request/otp_submit_request.dart';
import '../../data/models/request/user_all_request.dart';
import '../../data/models/request/user_register_request.dart';
import '../../data/models/request/user_verification_request.dart';
import '../../data/models/responses/auth_user_response.dart';
import '../../data/models/responses/friends_all_response.dart';
import '../../data/models/responses/master_data_response.dart';
import '../../data/models/responses/otp_generate_response.dart';
import '../../data/models/responses/otp_submit_response.dart';
import '../../data/models/responses/top_rank_response.dart';
import '../../data/models/responses/trader_all_response.dart';
import '../../data/models/responses/user_all_response.dart';
import '../../data/models/responses/user_register_response.dart';
import '../../data/models/responses/user_verification_response.dart';


abstract class Repository {
  Future<Either<Failure, UserRegisterResponse>> userRegisterDataAPI(
      UserRegisterRequest userRegisterRequest);
  Future<Either<Failure, AuthUserResponse>> authUserGetAPI();
  Future<Either<Failure, UserVerificationResponse>> userVerificationDataAPI(
      UserVerificationRequest userVerificationRequest);
  Future<Either<Failure, OtpGenerateResponse>> otpGenerateDataAPI(
      OtpGenerateRequest otpGenerateRequest);
  Future<Either<Failure, OtpSubmitResponse>> otpSubmitDataAPI(
      OtpSubmitRequest otpSubmitRequest);
  Future<Either<Failure, TopRankResponse>> topRankGetAPI();
  Future<Either<Failure, MasterDataResponse>> masterDataGetAPI();
  Future<Either<Failure, FriendsAllResponse>> friendsAllDataAPI(
      FriendsAllRequest friendsAllRequest);
  Future<Either<Failure, UserAllResponse>> userAllDataAPI(
      UserAllRequest userAllRequest);
  Future<Either<Failure, TraderAllResponse>> traderAllGetAPI();
  Future<Either<Failure, CommonResponse>> coinBuyDataAPI(
      CoinBuyRequest coinBuyRequest);
}
