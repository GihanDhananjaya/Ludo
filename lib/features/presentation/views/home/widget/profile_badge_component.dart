import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBadge extends StatelessWidget {
  final String profileImage;
  final int badgeCount;

  const ProfileBadge({
    Key? key,
    required this.profileImage,
    required this.badgeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 4.w),
            borderRadius: BorderRadius.circular(11.r),
            gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11.r),
            child: Image.asset(
              profileImage,
              width: 81.w,
              height: 72.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        //if (badgeCount > 0)
          // Positioned(
          //   top: 0.w,
          //   right: -4.w,
          //   child: Container(
          //     padding: EdgeInsets.all(5.w),
          //     decoration: BoxDecoration(
          //       color: Colors.orange,
          //       shape: BoxShape.circle,
          //     ),
          //     child: Text(
          //       badgeCount.toString(),
          //       style: TextStyle(
          //         fontSize: 14.sp,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
      ],
    );
  }
}
