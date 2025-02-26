import 'package:flutter/cupertino.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';

class TradeDetailsComponent extends StatelessWidget {
  final String name;
  final int count;
  final String? currencyType;


  TradeDetailsComponent({required this.name, required this.count,this.currencyType});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${name} :',style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: AppDimensions.kFontSize16,
            color: AppColors.initColors().white),),

        RichText(
          text: TextSpan(
            text: '${currencyType}',
            style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: AppDimensions.kFontSize14,
            color: AppColors.initColors().white),
            children:  <TextSpan>[
              TextSpan(text: count.toString(), style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: AppDimensions.kFontSize16,
                  color: AppColors.initColors().white)),
            ],
          ),
        ),
      ],
    );
  }
}
