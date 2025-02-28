import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/features/presentation/common/app_button.dart';
import 'package:ludoapp/features/presentation/views/otp_verify/widget/pin_put_component.dart';
import '../../../../core/service/dependency_injection.dart';
import '../../../../error/messages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/navigation_routes.dart';
import '../../../data/models/request/otp_generate_request.dart';
import '../../../data/models/request/otp_submit_request.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../common/app_text_field.dart';
import '../../common/otp_count_down.dart';
import '../base_view.dart';

class OtpVerifyView extends BaseView {
  final String mobileNumber;


  OtpVerifyView({required this.mobileNumber});

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends BaseViewState<OtpVerifyView> {
  var bloc = injection<AuthBloc>();
  final _otpController = TextEditingController();
  final otpKey = GlobalKey<FormState>();
  bool _isCountDownFinished = false;
  OTPCountDown? _otpCountDown;
  String? _countDown;
  String? errorText;
  bool hasError = false;
  String? otpReference;

  @override
  void initState() {
    super.initState();
    _startCountDown(120);
    bloc.add(
        OtpGenerateDataEvent(otpGenerateRequest: OtpGenerateRequest(
            mobileNumber: widget.mobileNumber, shouldGenerate: 1)));
  }

  void _startCountDown(int remainingTime) {
    _isCountDownFinished = false;
    _otpCountDown = OTPCountDown.startOTPTimer(
      timeInMS: remainingTime * 1000,
      currentCountDown: (String countDown) {
        _countDown = countDown;
        if (mounted) {
          setState(() {});
        }
      },
      onFinish: () {
        _isCountDownFinished = true;
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          listener: (_, state) {
            if(state is OtpGenerateDataSuccessState){
                 setState(() {
                   otpReference = state.output.referenceCode;
                 });
            }else if(state is OtpSubmitDataSuccessState){
              bloc.add(AuthUserGetEvent(token: appSharedData.getAppToken()!, shouldShowProgress: true));
            }else if(state is AuthUserGetSuccessState){
              Navigator.pushNamedAndRemoveUntil(context, Routes.kDashboardView, (route) => false);
            }
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppImages.appBackGround,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(AppImages.appSkins),

                      Text(
                        "Dice",
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize59,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        "We've sent a verification code to your mobile number. "
                            "Please enter the code below to verify your account.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: otpKey,
                            child: PinPutComponent(
                              onSubmit: (value) {},
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  setState(() {
                                    errorText = "Verification code is required";
                                  });
                                  return "";
                                } else if (value.length < 6) {
                                  setState(() {
                                    errorText = "Verification code invalid";
                                  });
                                  return "";
                                } else if (hasError &&
                                    errorText != null &&
                                    errorText!.isNotEmpty) {
                                  return "";
                                }
                                setState(() {
                                  errorText = null;
                                });
                                return null;
                              },
                              length: 6,
                              textEditingController: _otpController,
                            ),
                          ),
                          SizedBox(height: 6.h,),
                          Text(
                            (_countDown != null) ? _countDown! : '',
                            style: TextStyle(
                              fontSize: AppDimensions.kFontSize16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.initColors().white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 100.h),
                      AppButton(buttonText: 'Verify', onTapButton: (){
                        if(otpKey.currentState!.validate() ){
                          bloc.add(OtpSubmitDataEvent(otpSubmitRequest: OtpSubmitRequest(
                              mobileNumber: '0757045676', referenceCode: otpReference!, otp: _otpController.text)));
                        }
                      }),
                      SizedBox(height: 37.h),
                      _isCountDownFinished?
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t get OTP? ",
                              style: TextStyle(
                                fontSize: AppDimensions.kFontSize16, // Adjust size
                                fontWeight: FontWeight.w400,
                                color: Colors.white, // Adjust color
                              ),
                            ),
                            TextSpan(text: ' ',), // Space
                            TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: AppDimensions.kFontSize16, // Smaller font for "st"
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ): RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account?",
                              style: TextStyle(
                                fontSize: AppDimensions.kFontSize16, // Adjust size
                                fontWeight: FontWeight.w400,
                                color: Colors.white, // Adjust color
                              ),
                            ),
                            TextSpan(text: ' ',), // Space
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: AppDimensions.kFontSize16, // Smaller font for "st"
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }

}
