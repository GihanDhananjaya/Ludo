import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/utils/app_colors.dart';
import 'package:ludoapp/utils/app_dimensions.dart';

import '../../../../../utils/app_images.dart';
import '../../../common/app_button.dart';

class PlayerCard extends StatelessWidget {
  final String playerName;
  final int level;
  final int points;
  final VoidCallback onChallenge;
  final VoidCallback onChat;

  const PlayerCard({
    Key? key,
    required this.playerName,
    required this.level,
    required this.points,
    required this.onChallenge,
    required this.onChat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.initColors().mainBlackColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 65,width: 65,
                 decoration: BoxDecoration(
                     gradient: const LinearGradient(
                       colors: [Color(0xFF3B6FD6), Color(0xFF1E3A8A)], // Gradient colors
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                     ),
                   borderRadius: BorderRadius.circular(11.r),
                   border: Border.all(color: AppColors.initColors().profileGrayColor,width: 4)
                 ),
                  child: Image.asset(AppImages.appMan), // Change to network image if needed,
                ),
                // Positioned(
                //   top: 0,
                //   right: -4,
                //   child: Container(
                //     padding: const EdgeInsets.all(4),
                //     decoration: BoxDecoration(
                //       color: Colors.orange,
                //       shape: BoxShape.circle,
                //     ),
                //     child: Text(
                //       level.toString(),
                //       style: const TextStyle(
                //         fontSize: 12,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playerName,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      color: AppColors.initColors().colorBlack,
                      fontSize: AppDimensions.kFontSize18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(AppImages.appCrown,width: 19.w,height: 17.h,),
                      const SizedBox(width: 4),
                      Text(
                        points.toString(),
                        style: TextStyle(
                          color: AppColors.initColors().textFieldTitleColor,
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onChat,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 7.5.h),
                  decoration: BoxDecoration(
                    color: AppColors.initColors().profileGrayColor,
                    borderRadius: BorderRadius.circular(14.r)
                  ),
                  child: Image.asset(
                    AppImages.appMsg,
                    height: 20.h,
                    width: 20.w,
                    color: AppColors.initColors().white,)),
            ),
            SizedBox(width: 10.w,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: AppColors.initColors().blue1Color
                ),
                gradient: LinearGradient(colors: [AppColors.initColors().mainGrayColor,
                  AppColors.initColors().borderGrayColor]),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text('Challenge',style: TextStyle(
                  color: AppColors.initColors().white,
                  fontSize: AppDimensions.kFontSize18,
                  fontWeight: FontWeight.w700
              ),),
            )
          ],
        ),
      ),
    );
  }
}
