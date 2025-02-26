import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';

class ImageBottomBarItem extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final bool isHidden;
  final String name;
  final bool isSelected;

  ImageBottomBarItem(
      {required this.icon,
        required this.onTap,
        this.isHidden = false,
        required this.name,
        required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelected? Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.initColors().wfTextColor3,
            ),
            child: Column(
              children: [
                Image.asset(
                  icon,
                  width: isSelected? 35.w:45.w,
                  height: isSelected? 35.h:45.h,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: AppDimensions.kFontSize10,
                    color: isSelected
                        ? AppColors.initColors().darkGrey
                        : AppColors.initColors().blueButtonColor,
                  ),
                )
              ],
            ),
          ):Image.asset(
            icon,
            width: 25.w,
            height: 25.h,
          ),
          SizedBox(height: 3,),
          isSelected?SizedBox.shrink():
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: AppDimensions.kFontSize10,
              color:AppColors.initColors().white,
            ),
          )
        ],
      ),
    );
  }
}
