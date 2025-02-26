import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';
import '../../../../../utils/app_images.dart';

class UploadButtonComponent extends StatelessWidget {
  const UploadButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 0.4,
      color: AppColors.initColors().white,
      borderType: BorderType.RRect,
      radius: Radius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.initColors().loginTitleColor.withOpacity(0.4),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.appUpload,height: 30.h,width: 30.w,),
              SizedBox(width: 10.w,),
              Text(
                'Upload slip',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.initColors().white,
                    fontSize: AppDimensions.kFontSize14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
