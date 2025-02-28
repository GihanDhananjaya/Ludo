import '../../../data/models/request/otp_generate_request.dart';
import '../../../data/models/request/otp_submit_request.dart';
import '../../../data/models/request/user_register_request.dart';
import '../../../data/models/request/user_verification_request.dart';
import '../base_event.dart';

abstract class AuthEvent extends BaseEvent {}

class SessionRefreshEvent extends AuthEvent {}

class GetPushTokenEvent extends AuthEvent {}

class SplashEvent extends AuthEvent {}

class GetBasicDataEvent extends AuthEvent {}

class UserRegisterDataEvent extends AuthEvent{
  final UserRegisterRequest userRegisterRequest;

  UserRegisterDataEvent({required this.userRegisterRequest});
}

class AuthUserGetEvent extends AuthEvent {
  String token;
  final bool shouldShowProgress;
  AuthUserGetEvent({
    required this.token,
    required this.shouldShowProgress,
  });
}

class UserVerificationDataEvent extends AuthEvent {
  final UserVerificationRequest userVerificationRequest;

  UserVerificationDataEvent({required this.userVerificationRequest});
}

class OtpGenerateDataEvent extends AuthEvent {
  final OtpGenerateRequest otpGenerateRequest;

  OtpGenerateDataEvent({required this.otpGenerateRequest});
}

class OtpSubmitDataEvent extends AuthEvent {
  final OtpSubmitRequest otpSubmitRequest;

  OtpSubmitDataEvent({required this.otpSubmitRequest});
}

class TopRankGetEvent extends AuthEvent {
  final bool shouldShowProgress;
  TopRankGetEvent({
    required this.shouldShowProgress,
  });
}

class MasterDataGetEvent extends AuthEvent {
  final bool shouldShowProgress;
  MasterDataGetEvent({
    required this.shouldShowProgress,
  });
}
