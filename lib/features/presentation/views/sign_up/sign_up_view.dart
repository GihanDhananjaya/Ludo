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
import '../../../data/models/request/user_register_request.dart';
import '../../../data/models/request/user_verification_request.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../common/app_text_field.dart';
import '../base_view.dart';

class SignUpView extends BaseView {

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends BaseViewState<SignUpView> {
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
            if(state is UserRegisterSuccessState){
              bloc.add(UserVerificationDataEvent(userVerificationRequest:
              UserVerificationRequest(mobileNumber: phoneNumberController.text)));
            }else if(state is UserVerificationDataSuccessState){
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.kSignInView, (route) => false);
            }else{
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.kOtpVerifyView, (route) => false,arguments: phoneNumberController.text);
            }
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppImages.appBackGround,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
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

                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AppTextField(
                              controller: yourNameController,
                              isRequired: true,
                              hint: 'Enter name here',
                              label: 'Your Name',
                              validator: (value) {
                                if (yourNameController.text.isEmpty) {
                                  return "Your name is required!";
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 18.h,),

                            AppTextField(
                              isRequired: true,
                              controller: userNameController,
                              hint: 'Enter user name',
                              label: 'User Name',
                              validator: (value) {
                                if (userNameController.text.isEmpty) {
                                  return "User name is required!";
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 18.h,),

                            AppTextField(
                              isRequired: true,
                              controller: nicNumberController,
                              hint: 'Enter NIC',
                              label: 'NIC Number',
                              validator: (value) {
                                if (nicNumberController.text.isEmpty) {
                                  return "NIC number is required!";
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 18.h,),

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

                            SizedBox(height: 18.h,),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor:
                                AppColors.initColors()
                                    .appButtonGradient2,
                              ),
                              child: Checkbox(
                                value: _rememberMe,
                                activeColor: AppColors.initColors()
                                    .loginTitleColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(4.r),
                                ),
                                side: BorderSide(
                                  color: AppColors.initColors()
                                      .loginTitleColor,
                                  width: 2.w,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I accept the', // The main number
                                  style: TextStyle(
                                    fontSize: AppDimensions.kFontSize16, // Adjust size
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white, // Adjust color
                                  ),
                                ),
                                TextSpan(text: ' ',), // Space
                                TextSpan(
                                  text: "teams and conditions.",
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
                      SizedBox(height: 31.h),
                      AppButton(buttonText: 'Continue', onTapButton: (){
                        // if(formKey.currentState!.validate() ){
                        //
                        // }
                        bloc.add(UserRegisterDataEvent(
                            userRegisterRequest: UserRegisterRequest(
                                fullName: yourNameController.text,
                                userName: userNameController.text,
                                nicNumber: nicNumberController.text,
                                mobileNumber: phoneNumberController.text)));
                      }),

                      SizedBox(height: 37.h),
                      RichText(
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
