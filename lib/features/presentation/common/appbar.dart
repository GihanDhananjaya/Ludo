import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_images.dart';

class LudoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isGoBackVisible;
  final bool isPreLogin;
  final VoidCallback? onBackPressed;

  LudoAppBar({
    this.title = '',
    this.isGoBackVisible = true,
    this.isPreLogin = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child:  Image.asset(
            AppImages.appBackGround,
            fit: BoxFit.cover,
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 1,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isGoBackVisible
                  ? InkWell(
                onTap: onBackPressed ?? () => Navigator.pop(context),
                child: Container(
                  height: 24.h,
                  width: 24.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: isPreLogin
                          ? AppColors.initColors().nonChangeBlack
                          : AppColors.initColors().white,
                      width: 1.5.w,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: isPreLogin
                          ? AppColors.initColors().nonChangeBlack
                          : AppColors.initColors().white,
                      size: 12.h,
                    ),
                  ),
                ),
              )
                  : const SizedBox.shrink(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: isGoBackVisible ? 20.w : 0, left: 20),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimensions.kFontSize14,
                      color: AppColors.initColors().white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
