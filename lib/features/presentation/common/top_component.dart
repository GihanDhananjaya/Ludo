import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_images.dart';
import '../views/home/widget/coins_gem_count_component.dart';
import '../views/home/widget/profile_badge_component.dart';

class TopComponent extends StatelessWidget {
  final int badgeCount;
  final int coins;
  final int gems;
  final VoidCallback onCoinsTap;
  final VoidCallback onGemsTap;
  final VoidCallback setting;
  final VoidCallback notification;

   TopComponent({
    this.badgeCount = 1,
    required this.coins,
    required this.gems,
    required this.onCoinsTap,
    required this.onGemsTap,
    required this.setting,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileBadge(profileImage: AppImages.appAvatar, badgeCount: badgeCount),
        SizedBox(width: 26.w),
        GestureDetector(
            onTap: setting,
            child: Image.asset(AppImages.appSetting, width: 33.w, height: 33.h)),
        SizedBox(width: 16.w),
        GestureDetector(
            onTap: notification,
            child: Image.asset(AppImages.appNotification, width: 33.w, height: 33.h)),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkResponse(
                onTap: onCoinsTap,
                child: CoinsGemCounterComponent(imagePath: AppImages.appCoins, count: coins,)),
            SizedBox(height: 15.h),
            InkResponse(
                onTap: onGemsTap,
                child: CoinsGemCounterComponent(imagePath: AppImages.appGems, count: gems, )),
          ],
        ),
      ],
    );
  }
}
