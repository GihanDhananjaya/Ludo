import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:curved_text/curved_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as bs;


import '../../../core/analytics/app_analytics.dart';
import '../../../core/configurations/app_config.dart';
import '../../../core/service/dependency_injection.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_images.dart';
import '../../../utils/enums.dart';
import '../../../utils/navigation_routes.dart';
import '../../data/datasources/shared_preference.dart';
import '../bloc/base_bloc.dart';
import '../bloc/base_event.dart';
import '../bloc/base_state.dart';
import '../common/app_button.dart';
import '../common/app_button_outline.dart';


abstract class BaseView extends StatefulWidget {
  BaseView({Key? key}) : super(key: key);
}

abstract class BaseViewState<Page extends BaseView> extends State<Page> {
  final appSharedData = injection<AppSharedData>();
  final analytics = injection<AppAnalytics>();

  Base<BaseEvent, BaseState<dynamic>> getBloc();

  Widget buildView(BuildContext context);

  bool _isProgressShow = false;


  @override
  void initState() {
    super.initState();

    if (AppConfig.deviceOS == DeviceOS.ANDROID) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Base>(
        create: (_) => getBloc(),
        child: BlocListener<Base, BaseState>(
          listener: (context, state) {
            if (state is APILoadingState) {
              showProgressBar();
            } else {
              hideProgressBar();
              if (state is APIFailureState) {
                showSnackBar(state.errorResponseModel.responseError ?? '',
                    AlertType.FAIL);
              } else if (state is AuthorizedFailureState) {
                if (state.isSplash) {
                  logOut();
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, Routes.kSignInView, (route) => false);
                } else {
                  showAppDialog(
                    description: state.errorResponseModel.responseError,
                    onPositiveCallback: () {
                      logOut();
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, Routes.kSignInView, (route) => false);
                    },
                  );
                }
              }
            }
          },
          child: Listener(
            child: Container(
                //margin: EdgeInsets.only(bottom: Platform.isIOS ? 5 : 0),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: buildView(context),
                )),
          ),
        ),
      );
  }

  void logOut() {
    setState(() {
      if (appSharedData.hasAppToken()) {
        appSharedData.clearAppToken();
      }


      if (appSharedData.hasPushToken()) {
        appSharedData.clearPushToken();
      }

    });
  }

  void showAppDialog({
    String? title,
    String? description,
    Color? descriptionColor,
    String? positiveButtonText,
    String? negativeButtonText,
    VoidCallback? onPositiveCallback,
    VoidCallback? onNegativeCallback,
    bool? isDismissible,
  }) {
    bs.showMaterialModalBottomSheet(
      context: context,
      expand: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            if (isDismissible != null && isDismissible) {
              return true;
            } else {
              return false;
            }
          },
          child: Center( // Center the dialog vertically
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 336,
              ),
              width: MediaQuery.of(context).size.width * 0.9, // Adjust width if needed
              decoration: BoxDecoration(
                color: AppColors.initColors().wfFillColor1,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: AppColors.initColors().wfFillColor4,width: 12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.initColors().nonChangeBlack.withOpacity(0.35),
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: const Offset(0, 0.5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Ensure it takes only needed space
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 4,
                      width: 35,
                      decoration: BoxDecoration(
                        color: AppColors.initColors().colorImagePlaceholder,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  if (title != null)
                    Column(
                      children: [
                        SizedBox(height: 24.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.w),
                          child: Text(
                            title ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: descriptionColor ??
                                  AppColors.initColors().primaryGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Text(
                      description ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: descriptionColor ?? AppColors.initColors().darkGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Row(
                      mainAxisAlignment: negativeButtonText != null
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                      children: [
                        if (negativeButtonText != null)
                          AppButtonOutline(
                            buttonText: negativeButtonText,
                            onTapButton: onNegativeCallback ??
                                    () {
                                  Navigator.pop(context);
                                },
                            width: 164,
                          ),
                        AppButton(
                          buttonText: positiveButtonText ?? 'Ok',
                          onTapButton: onPositiveCallback ??
                                  () {
                                Navigator.pop(context);
                              },
                          width: 164,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },

    );
  }

  void showCustomDialog(BuildContext context, Widget content,) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              alignment: Alignment.center, // Center content on the image
              children: [
                Image.asset(
                  AppImages.appPopupBackground,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 50, // Adjust as needed
                  child: CurvedText(
                    curvature: 0.003,
                    text: "Settings",
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.kFontSize20,
                        color: AppColors.initColors().white),
                  ), // Custom text or buttons on image
                ),
                Positioned(
                  bottom: 15, // Adjust as needed
                  child: InkResponse(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 60,
                      child: Text("Done",style: TextStyle(
                          color: AppColors.initColors().white,
                          fontWeight: FontWeight.w600,fontSize: AppDimensions.kFontSize20),),
                    ),
                  ), // Custom text or buttons on image
                ),
                Positioned(
                  top: 100, // Adjust as needed
                  child: content, // Custom text or buttons on image
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void exitCustomDialog(BuildContext context, String imageUrl, Widget content,String title,String btnType) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              alignment: Alignment.center, // Center content on the image
              children: [
                Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 80, // Adjust as needed
                  child:  CurvedText(
                    curvature: 0.003,
                    text: title,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.kFontSize20,
                        color: AppColors.initColors().white),
                  ),

                  // Text(title,style: TextStyle(
                  //     color: AppColors.initColors().white,
                  //     fontWeight: FontWeight.w600,fontSize: AppDimensions.kFontSize20),
                  // ), // Custom text or buttons on image
                ),
                Positioned(
                  bottom: 1, // Adjust as needed
                  child: InkResponse(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: Text(btnType,style: TextStyle(
                          color: AppColors.initColors().white,
                          fontWeight: FontWeight.w600,fontSize: AppDimensions.kFontSize15),),
                    ),
                  ), // Custom text or buttons on image
                ),
                Positioned(
                  top: 130, // Adjust as needed
                  child: content, // Custom text or buttons on image
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void crownCustomDialog(BuildContext context, String imageUrl, Widget content,String title,String btnType) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              alignment: Alignment.center, // Center content on the image
              children: [
                Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 90,
                  child: CurvedText(
                    curvature: 0.003,
                    text: title,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.kFontSize20,
                        color: AppColors.initColors().white),
                  ),
                ),
                Positioned(
                  bottom: 1, // Adjust as needed
                  child: InkResponse(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: Text(btnType,style: TextStyle(
                          color: AppColors.initColors().white,
                          fontWeight: FontWeight.w600,fontSize: AppDimensions.kFontSize15),),
                    ),
                  ), // Custom text or buttons on image
                ),
                Positioned(
                  top: 150, // Adjust as needed
                  child: content, // Custom text or buttons on image
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void loginCustomDialog(BuildContext context,int freeCoins) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              alignment: Alignment.center, // Center content on the image
              children: [
                Image.asset(
                  AppImages.appCrownPopup,height: 400,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 100,
                  child: CurvedText(
                    curvature: 0.003,
                    text: "Login In to Start Playing",
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.kFontSize20,
                        color: AppColors.initColors().white),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  left: 135,
                  child: InkResponse(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.kSignInView);
                    },
                    child: SizedBox(
                      width: 100,
                      height: 40,
                      child: Text('Log In',style: TextStyle(
                          color: AppColors.initColors().white,
                          fontWeight: FontWeight.w600,fontSize: AppDimensions.kFontSize20),),
                    ),
                  ), // Custom text or buttons on image
                ),
                Positioned(
                  top: 150, // Adjust as needed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:190,
                        child: Text("You need to log in to access this game mode. Sign in now and start rolling Enjoy exclusive benefits",
                        style: TextStyle(color: AppColors.initColors().white,fontSize: AppDimensions.kFontSize12,
                            fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 18.h,),
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: AppColors.initColors().disableButtonColor,radius: 5,),
                          SizedBox(width: 5.w,),
                          Text("${freeCoins} Free Coins",style:
                          TextStyle(color: AppColors.initColors().white,fontSize: AppDimensions.kFontSize12,
                              fontWeight: FontWeight.w600),)
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: AppColors.initColors().disableButtonColor,radius: 5,),
                          SizedBox(width: 5.w,),
                          Text("Play with Friends",style:
                          TextStyle(color: AppColors.initColors().white,fontSize: AppDimensions.kFontSize12,
                              fontWeight: FontWeight.w600),)
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: AppColors.initColors().disableButtonColor,radius: 5,),
                          SizedBox(width: 5.w,),
                          Text("Compete Online",style:
                          TextStyle(color: AppColors.initColors().white,fontSize: AppDimensions.kFontSize12,
                              fontWeight: FontWeight.w600),)
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: AppColors.initColors().disableButtonColor,radius: 5,),
                          SizedBox(width: 5.w,),
                          Text("Earn Reward",style:
                          TextStyle(color: AppColors.initColors().white,fontSize: AppDimensions.kFontSize12,
                              fontWeight: FontWeight.w600),)
                        ],
                      )
                    ],
                  ), // Custom text or buttons on image
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  showProgressBar() {
    if (!_isProgressShow) {
      _isProgressShow = true;
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          transitionBuilder: (context, a1, a2, widget) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      alignment: FractionalOffset.center,
                      child: Wrap(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: SpinKitFadingFour(
                              color: AppColors.initColors().primaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const SizedBox.shrink();
          });
    }
  }

  hideProgressBar() {
    if (_isProgressShow) {
      Navigator.pop(context);
      _isProgressShow = false;
    }
  }

  showSnackBar(String message, AlertType alertType) {
    Flushbar flushBar = Flushbar(
      duration: const Duration(seconds: 2),
      messageColor: AppColors.initColors().nonChangeWhite,
      isDismissible: true,
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.initColors().nonChangeWhite,
        ),
      ),
      boxShadows: const [
        BoxShadow(
          color: Color(0x0E0E0E40),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(0, 0),
        ),
      ],
      padding: EdgeInsets.symmetric(vertical: 13.5.h, horizontal: 26.w),
      mainButton: Image.asset(
        AppImages.icCross,
        height: 16.h,
      ),
      icon: alertType == AlertType.FAIL
          ? Image.asset(
        AppImages.icWarningRounded,
        height: 25.h,
      )
          : alertType == AlertType.SUCCESS
          ? Image.asset(
        AppImages.icSuccessRounded,
        height: 25.h,
      )
          : Image.asset(
        AppImages.icWarningRounded,
        height: 25.h,
      ),
      backgroundColor: alertType == AlertType.FAIL
          ? AppColors.initColors().errorRed
          : alertType == AlertType.SUCCESS
          ? AppColors.initColors().waitingTimeColor
          : AppColors.initColors().warningColor,
    );
    if (!flushBar.isAppearing() &&
        !flushBar.isShowing() &&
        !flushBar.isHiding()) {
      flushBar.show(context);
    }
  }

  String getFirstCharacters(String input) {
    List<String> words = input.split(" ");
    if (words.length >= 2 && words[1].isNotEmpty) {
      String firstWord = words[0];
      String secondWord = words[1];
      String firstCharacters =
          "${firstWord[0].toUpperCase()}${secondWord[0].toUpperCase()}";
      return firstCharacters;
    } else {
      return words[0][0] + words[0][1];
    }
  }

  void getUserColor() {

  }


}
