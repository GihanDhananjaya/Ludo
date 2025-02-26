import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ludoapp/utils/app_colors.dart';
import 'package:ludoapp/utils/app_dimensions.dart';

class NotificationComponent extends StatelessWidget {
  const NotificationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Payment Sent! Check your account.',style: TextStyle(
          fontSize: AppDimensions.kFontSize18,
          fontWeight: FontWeight.w400,
          color: AppColors.initColors().white
        ),),
        Divider()
      ],
    );
  }
}
