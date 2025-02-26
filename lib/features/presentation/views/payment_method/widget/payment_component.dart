import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/utils/app_colors.dart';
import 'package:ludoapp/utils/app_dimensions.dart';

class PaymentComponent extends StatelessWidget {
  final String profileImage;
  final String name;
  final bool isVerified;
  final double likePercentage;
  final int followers;
  final int minLimit;
  final int maxLimit;
  final double pricePerCoin;
  final bool isOnline;

  const PaymentComponent({
    required this.profileImage,
    required this.name,
    required this.isVerified,
    required this.likePercentage,
    required this.followers,
    required this.minLimit,
    required this.maxLimit,
    required this.pricePerCoin,
    this.isOnline = true
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Profile Image
                Stack(
                  children: [
                    // Profile Image Container
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          profileImage,
                          width: 50, // Adjust size
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (isOnline)
                      Positioned(
                        bottom: 2,
                        right: -2,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.initColors().borderGrayColor3,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.initColors().white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 8),
                // Name & Verification
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: AppDimensions.kFontSize18,
                            color: AppColors.initColors().profileArrowColor
                        ),
                      ),
                      Row(
                        children: [
                          if (isVerified)
                            Row(
                              children: [
                                const Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                  size: 16,
                                ),
                                SizedBox(width: 4.w,),
                                Text("Verified",style: TextStyle(
                                    color: AppColors.initColors().chipColor,
                                    fontSize: AppDimensions.kFontSize14,
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),
                          SizedBox(width: 8),
                          Icon(Icons.thumb_up, size: 14, color: Colors.grey),
                          Text(" $likePercentage%",style: TextStyle(
                              color: AppColors.initColors().chipColor,
                              fontSize: AppDimensions.kFontSize14,
                              fontWeight: FontWeight.w600
                          ),),
                          SizedBox(width: 8),
                          Icon(Icons.volunteer_activism, size: 14, color: Colors.grey),
                          Text(" $followers",style: TextStyle(
                              color: AppColors.initColors().chipColor,
                              fontSize: AppDimensions.kFontSize14,
                              fontWeight: FontWeight.w600
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
