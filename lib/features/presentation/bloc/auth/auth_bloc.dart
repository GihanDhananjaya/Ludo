import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service/cloud_services.dart';
import '../../../../error/messages.dart';
import '../../../../utils/app_constants.dart';
import '../../../data/datasources/shared_preference.dart';
import '../../../data/models/common/common_error_response.dart';
import '../../../data/models/responses/auth_user_response.dart';
import '../../../domain/repositories/repository.dart';
import '../base_bloc.dart';
import '../base_state.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Base<AuthEvent, BaseState<AuthState>> {
  final AppSharedData appSharedData;
  final Repository repository;
  final CloudServices cloudServices;

  AuthBloc(
      {required this.appSharedData,
      required this.repository,
      required this.cloudServices})
      : super(InitialAuthState()){
    on<UserRegisterDataEvent>(_userRegisterAPI);
    on<AuthUserGetEvent>(_authUserGetAPI);
    on<UserVerificationDataEvent>(_userVerificationAPI);
    on<OtpGenerateDataEvent>(_otpGenerateAPI);
    on<OtpSubmitDataEvent>(_otpSubmitAPI);
    on<TopRankGetEvent>(_topRankGetAPI);
    }

  _userRegisterAPI(
      UserRegisterDataEvent event, Emitter<BaseState<AuthState>> emit) async {
    emit(APILoadingState());
    final result = await repository.userRegisterDataAPI(event.userRegisterRequest);
    emit(
      result.fold(
            (l) {
          return APIFailureState(
              errorResponseModel: ErrorResponseModel(
                  responseError: ErrorMessages().mapFailureToMessage(l),
                  responseCode: ''));
        },
            (r) {
          if (r.success) {
            appSharedData.setAppToken(r.output.token!);
            return UserRegisterSuccessState(message: r.message, registerData: r.output);
          } else {
            return APIFailureState(
              errorResponseModel: ErrorResponseModel(
                  responseError: r.message, responseCode: ''),
            );
          }
        },
      ),
    );
  }


  _authUserGetAPI(
      AuthUserGetEvent event, Emitter<BaseState<AuthState>> emit) async {
    if (event.shouldShowProgress) {
      emit(APILoadingState());
    }
    final result = await repository.authUserGetAPI();
    emit(
      result.fold((l) {
        return APIFailureState(
            errorResponseModel: ErrorResponseModel(
                responseError: ErrorMessages().mapFailureToMessage(l),
                responseCode: ''));
      }, (r) {
        if (r.success) {
          appSharedData.setAppUser(r.output);
          appSharedData.setPhoneNumber(r.output.mobileNumber!);
          return AuthUserGetSuccessState(
            message: r.message,
            output: r.output,
          );
        } else {
          return APIFailureState(
              errorResponseModel: ErrorResponseModel(
                  responseError: r.message, responseCode: ''));
        }
      }),
    );
  }

  _userVerificationAPI(
      UserVerificationDataEvent event, Emitter<BaseState<AuthState>> emit) async {
    emit(APILoadingState());
    final result = await repository.userVerificationDataAPI(event.userVerificationRequest);
    emit(
      result.fold(
            (l) {
          return APIFailureState(
              errorResponseModel: ErrorResponseModel(
                  responseError: ErrorMessages().mapFailureToMessage(l),
                  responseCode: ''));
        },
            (r) {
          if (r.success) {
            appSharedData.setAppToken(r.output!.token!);
            appSharedData.setAppCredential(event.userVerificationRequest);
            return UserVerificationDataSuccessState(message: r.message, output: r.output);
          } else {
            return UserVerificationDataFailState(message: r.message ?? 'Error');
          }
        },
      ),
    );
  }

  _otpGenerateAPI(
      OtpGenerateDataEvent event, Emitter<BaseState<AuthState>> emit) async {
    emit(APILoadingState());
    final result = await repository.otpGenerateDataAPI(event.otpGenerateRequest);
    emit(
      result.fold(
            (l) {
          return APIFailureState(
              errorResponseModel: ErrorResponseModel(
                  responseError: ErrorMessages().mapFailureToMessage(l),
                  responseCode: ''));
        },
            (r) {
          if (r.success) {
            appSharedData.setAppToken(r.output!.referenceCode!);
            return OtpGenerateDataSuccessState(message: r.message, output: r.output);
          } else {
            return APIFailureState(
              errorResponseModel: ErrorResponseModel(
                  responseError: r.message, responseCode: ''),
            );
          }
        },
      ),
    );
  }

  _otpSubmitAPI(
      OtpSubmitDataEvent event, Emitter<BaseState<AuthState>> emit) async {
    emit(APILoadingState());
    final result = await repository.otpSubmitDataAPI(event.otpSubmitRequest);
    emit(
      result.fold(
            (l) {
          return APIFailureState(
              errorResponseModel: ErrorResponseModel(
                  responseError: ErrorMessages().mapFailureToMessage(l),
                  responseCode: ''));
        },
            (r) {
          if (r.success) {
            return OtpSubmitDataSuccessState(message: r.message,);
          } else {
            return APIFailureState(
              errorResponseModel: ErrorResponseModel(
                  responseError: r.message, responseCode: ''),
            );
          }
        },
      ),
    );
  }


  _topRankGetAPI(
      TopRankGetEvent event, Emitter<BaseState<AuthState>> emit) async {
    if (event.shouldShowProgress) {
      emit(APILoadingState());
    }
    final result = await repository.topRankGetAPI();
    emit(
      result.fold((l) {
        return APIFailureState(
            errorResponseModel: ErrorResponseModel(
                responseError: ErrorMessages().mapFailureToMessage(l),
                responseCode: ''));
      }, (r) {
        if (r.success) {
          return TopRankGetSuccessState(
            rankData: r.output,
          );
        } else {
          return APIFailureState(
              errorResponseModel: ErrorResponseModel(
                  responseError: r.message, responseCode: ''));
        }
      }),
    );
  }


}
