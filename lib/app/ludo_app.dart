import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../core/service/dependency_injection.dart';
import '../features/data/datasources/shared_preference.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/navigation_routes.dart';



class LudoApp extends StatefulWidget {
  @override
  State<LudoApp> createState() => _LudoAppState();
}

class _LudoAppState extends State<LudoApp> {
  final appSharedData = injection<AppSharedData>();



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            initialRoute: Routes.kSplashView,
            onGenerateRoute: Routes.generateRoute,
            theme: ThemeData(
                primaryColor: AppColors.initColors().primaryGreen,
                textTheme: GoogleFonts.interTextTheme().copyWith(
                  bodyMedium: GoogleFonts.interTextTheme().bodyMedium?.copyWith(
                        letterSpacing: -0.5,
                      ),
                ),
                scaffoldBackgroundColor: AppColors.initColors().nonChangeWhite),
          );
        });
  }
}
