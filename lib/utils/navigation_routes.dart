import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../features/domain/entities/transection_entity.dart';
import '../features/presentation/views/dashboard/bottom_bar_view.dart';
import '../features/presentation/views/dashboard/image_bottom_bar.dart';
import '../features/presentation/views/dice/dice_view.dart';
import '../features/presentation/views/home/home_view.dart';
import '../features/presentation/views/otp_verify/otp_verify_view.dart';
import '../features/presentation/views/payment_method/payment_method_view.dart';
import '../features/presentation/views/select_room/select_room_view.dart';
import '../features/presentation/views/sign_in/sign_in_view.dart';
import '../features/presentation/views/sign_up/sign_up_view.dart';
import '../features/presentation/views/splash/splash_view.dart';
import 'enums.dart';

class Routes {

   static const String kSplashView = "kSplashView";
   static const String kDashboardView = "kDashboardView";
   static const String kImageDashboardView = "kImageDashboardView";
   static const String kSignUpView = "kSignUpView";
   static const String kOtpVerifyView = "kOtpVerifyView";
   static const String kSignInView = "kSignInView";
   static const String kPaymentMethodView = "kPaymentMethodView";
   static const String kDiceView = "kDiceView";
   static const String kSelectRoomView = "kSelectRoomView";
   static const String kHomeView = "kHomeView";



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.kSplashView:
        return PageTransition(
            child: SplashView(), type: PageTransitionType.fade);
      case Routes.kDashboardView:
        return PageTransition(
            child: DashboardView(), type: PageTransitionType.fade);
      case Routes.kImageDashboardView:
        return PageTransition(
            child: ImageDashboardView(), type: PageTransitionType.fade);
      case Routes.kSignUpView:
        return PageTransition(
            child: SignUpView(), type: PageTransitionType.fade);
      case Routes.kOtpVerifyView:
        return PageTransition(
            child: OtpVerifyView(mobileNumber: settings.arguments as String,), type: PageTransitionType.fade);
      case Routes.kSignInView:
        return PageTransition(
            child: SignInView(), type: PageTransitionType.fade);
      case Routes.kPaymentMethodView:
        return PageTransition(
            child: PaymentMethodView(), type: PageTransitionType.fade);
      case Routes.kDiceView:
        return PageTransition(
            child: DiceView(), type: PageTransitionType.fade);
      case Routes.kSelectRoomView:
        return PageTransition(
            child: SelectRoomView(), type: PageTransitionType.fade);
      case Routes.kHomeView:
        return PageTransition(
            child: HomeView(onTapJoinButton: () {  }, onTapBack: () {  },freeCoins:settings.arguments as int,), type: PageTransitionType.fade);


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}
