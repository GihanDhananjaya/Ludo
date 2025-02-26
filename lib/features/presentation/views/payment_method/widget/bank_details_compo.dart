import 'package:flutter/cupertino.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';

class BankDetailsCompo extends StatelessWidget {
  final String title;
  final String name;

  BankDetailsCompo({required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${title} :',style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: AppDimensions.kFontSize16,
            color: AppColors.initColors().white),),

        Text('${name}',style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: AppDimensions.kFontSize16,
            color: AppColors.initColors().white),),
      ],
    );
  }
}
