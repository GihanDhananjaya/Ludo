import 'package:dartz/dartz.dart';


import '../../../error/failures.dart';
import '../../data/models/request/otp_generate_request.dart';
import '../../data/models/request/otp_submit_request.dart';
import '../../data/models/request/user_register_request.dart';
import '../../data/models/request/user_verification_request.dart';
import '../../data/models/responses/auth_user_response.dart';
import '../../data/models/responses/master_data_response.dart';
import '../../data/models/responses/otp_generate_response.dart';
import '../../data/models/responses/otp_submit_response.dart';
import '../../data/models/responses/top_rank_response.dart';
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
}
