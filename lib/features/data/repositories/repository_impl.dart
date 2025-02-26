import 'package:dartz/dartz.dart';
import 'package:ludoapp/features/data/models/request/otp_generate_request.dart';
import 'package:ludoapp/features/data/models/request/otp_submit_request.dart';
import 'package:ludoapp/features/data/models/request/user_register_request.dart';
import 'package:ludoapp/features/data/models/request/user_verification_request.dart';
import 'package:ludoapp/features/data/models/responses/auth_user_response.dart';
import 'package:ludoapp/features/data/models/responses/otp_generate_response.dart';
import 'package:ludoapp/features/data/models/responses/otp_submit_response.dart';
import 'package:ludoapp/features/data/models/responses/user_register_response.dart';
import 'package:ludoapp/features/data/models/responses/user_verification_response.dart';

import '../../../core/network/network_info.dart';
import '../../../error/exceptions.dart';
import '../../../error/failures.dart';
import '../../../error/messages.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote_data_source.dart';
import '../models/common/common_error_response.dart';
import '../models/responses/top_rank_response.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserRegisterResponse>> userRegisterDataAPI(UserRegisterRequest userRegisterRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.userRegisterDataAPI(userRegisterRequest);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return Left(
          ServerFailure(
            ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''),
          ),
        );
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, AuthUserResponse>> authUserGetAPI() async {
    try {
      final response = await remoteDataSource.authUserGetAPI();
      return Right(response);
    } on ServerException catch (ex) {
      return Left(ServerFailure(ex.errorResponseModel));
    } on UnAuthorizedException catch (ex) {
      return Left(AuthorizedFailure(ex.errorResponseModel));
    } on DioException catch (e) {
      return Left(ServerFailure(e.errorResponseModel));
    } on Exception {
      return Left(
        ServerFailure(
          ErrorResponseModel(
              responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
              responseCode: ''),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserVerificationResponse>> userVerificationDataAPI(
      UserVerificationRequest userVerificationRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.userVerificationDataAPI(userVerificationRequest);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return Left(
          ServerFailure(
            ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''),
          ),
        );
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, OtpGenerateResponse>> otpGenerateDataAPI(OtpGenerateRequest otpGenerateRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.otpGenerateDataAPI(otpGenerateRequest);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return Left(
          ServerFailure(
            ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''),
          ),
        );
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, OtpSubmitResponse>> otpSubmitDataAPI(OtpSubmitRequest otpSubmitRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.otpSubmitDataAPI(otpSubmitRequest);
        return Right(response);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return Left(
          ServerFailure(
            ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''),
          ),
        );
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, TopRankResponse>> topRankGetAPI() async {
    try {
      final response = await remoteDataSource.topRankGetAPI();
      return Right(response);
    } on ServerException catch (ex) {
      return Left(ServerFailure(ex.errorResponseModel));
    } on UnAuthorizedException catch (ex) {
      return Left(AuthorizedFailure(ex.errorResponseModel));
    } on DioException catch (e) {
      return Left(ServerFailure(e.errorResponseModel));
    } on Exception {
      return Left(
        ServerFailure(
          ErrorResponseModel(
              responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
              responseCode: ''),
        ),
      );
    }
  }


}
