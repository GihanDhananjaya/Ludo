import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/utils/app_dimensions.dart';

class CoinsGemCounterComponent extends StatelessWidget {
  final String imagePath;
  final int count;

  const CoinsGemCounterComponent({
    Key? key,
    required this.imagePath,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.brown[900], // Dark brown background
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 60.w,
            height: 40.h,
          ),
          SizedBox(width: 8.w),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: AppDimensions.kFontSize18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
