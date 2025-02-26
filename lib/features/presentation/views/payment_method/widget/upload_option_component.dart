
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';

class UploadOptionComponent extends StatelessWidget {
  String image;
  String title;

  UploadOptionComponent({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 14.h),
      decoration: BoxDecoration(
          color: AppColors.initColors().optionGrayColor,
          borderRadius: BorderRadiusDirectional.circular(16.r),
          border: Border.all(
              color: AppColors.initColors().borderGrayColor,
              width: 1
          )
      ),
      child: Column(
        children: [
          Image.asset(image,height: 54.h,width: 54.w,),
          SizedBox(height: 8.h,),
          Text(title,style: TextStyle(
              color: AppColors.initColors().borderGrayColor2,
              fontWeight: FontWeight.w500,
              fontSize: AppDimensions.kFontSize12
          ),)
        ],
      ),
    );
  }

}
