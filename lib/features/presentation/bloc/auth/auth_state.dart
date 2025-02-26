import '../../../data/models/responses/auth_user_response.dart';
import '../../../data/models/responses/otp_generate_response.dart';
import '../../../data/models/responses/top_rank_response.dart';
import '../../../data/models/responses/user_register_response.dart';
import '../../../data/models/responses/user_verification_response.dart';
import '../base_state.dart';

abstract class AuthState extends BaseState<AuthState> {}

class InitialAuthState extends AuthState {}

class PushTokenSuccessState extends AuthState {}

class PushTokenFailedState extends AuthState {}

class UserRegisterSuccessState extends AuthState {
  final RegisterData registerData;
  final String message;
  UserRegisterSuccessState({required this.message,required this.registerData});
}

class AuthUserGetSuccessState extends AuthState {
  final String message;
  final AuthUser output;
  AuthUserGetSuccessState({
    required this.message,
    required this.output,
  });
}

class UserVerificationDataSuccessState extends AuthState {
  final String message;
  final UserVerificationData output;
  UserVerificationDataSuccessState({
    required this.message,
    required this.output,
  });
}

class UserVerificationDataFailState extends AuthState {
  final String message;
  UserVerificationDataFailState({
    required this.message,
  });
}

class OtpGenerateDataSuccessState extends AuthState {
  final String message;
  final OtpGenerateData output;
  OtpGenerateDataSuccessState({
    required this.message,
    required this.output,
  });
}

class OtpSubmitDataSuccessState extends AuthState {
  final String message;
  OtpSubmitDataSuccessState({
    required this.message,
  });
}

class TopRankGetSuccessState extends AuthState {
  final List<TopRankData>rankData;
  TopRankGetSuccessState({
    required this.rankData,
  });
}
