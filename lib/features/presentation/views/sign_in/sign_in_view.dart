import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/features/presentation/common/app_button.dart';
import '../../../../core/service/dependency_injection.dart';
import '../../../../error/messages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/navigation_routes.dart';
import '../../../data/models/request/user_verification_request.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../common/app_text_field.dart';
import '../base_view.dart';

class SignInView extends BaseView {

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends BaseViewState<SignInView> {
  var bloc = injection<AuthBloc>();
  final yourNameController = TextEditingController();
  final userNameController = TextEditingController();
  final nicNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _rememberMe = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          listener: (_, state) {
             if(state is UserVerificationDataSuccessState){
               bloc.add(AuthUserGetEvent(shouldShowProgress: true, token: appSharedData.getAppToken()!));
            }else if(state is AuthUserGetSuccessState){
               Navigator.pushNamed(context, Routes.kOtpVerifyView,arguments: phoneNumberController.text);
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
                        "Welcome back! Enter your details to log in and continue your game.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 52.h,),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AppTextField(
                              isRequired: true,
                              controller: phoneNumberController,
                              hint: 'Enter mobile number',
                              label: 'Mobile Number',
                              validator: (value) {
                                if (phoneNumberController.text.isEmpty) {
                                  return "Phone number is required!";
                                }
                                return null;
                              },
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 100.h,),
                      AppButton(buttonText: 'Continue', onTapButton: (){
                        if(formKey.currentState!.validate() ){
                          bloc.add(UserVerificationDataEvent(userVerificationRequest:
                          UserVerificationRequest(mobileNumber: phoneNumberController.text)));
                        }
                      }),
                      SizedBox(height: 37.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t have account?",
                              style: TextStyle(
                                fontSize: AppDimensions.kFontSize16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(text: ' ',), // Space
                            TextSpan(
                              text: "Register",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: AppDimensions.kFontSize16,
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
