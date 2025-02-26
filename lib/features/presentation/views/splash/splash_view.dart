import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
import '../base_view.dart';

class SplashView extends BaseView {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseViewState<SplashView>
    with TickerProviderStateMixin {
  var bloc = injection<AuthBloc>();

  String version = '';
  bool isRegister = false;

  @override
  void initState() {
    if(appSharedData.hasAppUser() && appSharedData.hasAppToken()){
      final number = appSharedData.getPhoneNumber();
      bloc.add(UserVerificationDataEvent(userVerificationRequest: UserVerificationRequest(
          mobileNumber: number)));
    }else {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.pushReplacementNamed(
            context, Routes.kSignInView);
      });
    }
    super.initState();
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.initColors().nonChangeWhite,
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          listener: (_, state) {
            if (state is UserVerificationDataSuccessState) {
              bloc.add(AuthUserGetEvent(shouldShowProgress: true, token: state.output.token! ));
            }else if(state is UserVerificationDataFailState){
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.kSignInView, (route) => false);
            }else if (state is AuthUserGetSuccessState) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.kDashboardView, (route) => false);
                }
          },
          child: Stack(

            fit: StackFit.expand,
            children: [
              Image.asset(
                AppImages.appBackGround,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.appSkins,height: 183.h,width: 236.w,),
                  Text(
                    "Dice ",
                    style: TextStyle(
                      fontSize: AppDimensions.kFontSize59,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
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
