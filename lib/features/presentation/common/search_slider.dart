import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/app_dimensions.dart';
import '../../../utils/app_colors.dart';

class SearchSlider extends StatelessWidget {
  final String title;
  final String? subTitle;
  final double min;
  final double max;
  final double value;
  final ValueChanged<double>? onChanged;

  const SearchSlider({
    Key? key,
    required this.title,
    this.subTitle,
    required this.min,
    required this.max,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 24.0),
          child: RichText(
            text: TextSpan(
              text: title,
              style: TextStyle(
                  fontSize: AppDimensions.kFontSize14,
                  color: AppColors.initColors().dark1ButtonColor,
                  fontWeight: FontWeight.w700),
              children:  <TextSpan>[
                TextSpan(text:  subTitle,
                    style: TextStyle(
                        fontSize: AppDimensions.kFontSize10,
                        color: AppColors.initColors().gauge1Gradient1,
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 15.0,
            trackShape: RoundedRectSliderTrackShape(),
            activeTrackColor: AppColors.initColors().primaryGreen,
            inactiveTrackColor: AppColors.initColors().gauge2Gradient2,
            thumbColor: AppColors.initColors().primaryGreen,
          ),
          child: Stack(
            children: [
              Slider(
                min: min,
                max: max,
                value: value,
                onChanged: onChanged,
              ),
              // Positioned(
              //   top: -5,
              //   left: (value - min) / (max - min) * MediaQuery.of(context).size.width - 15,
              //   child: Text(
              //     '${value.toStringAsFixed(0)}', // Display the current value of the slider
              //     style: TextStyle(color: Colors.black),
              //   ),
              // ),
              Positioned(
                left: 20,
                top: -5,
                right: 0,

                child: Text(
                  '${min.toStringAsFixed(0)}', // Display the minimum value
                  style: TextStyle(color: AppColors.initColors().gauge2Gradient2),
                ),
              ),
              Positioned(
                right: 20,
                top: -5,
                child: Text(
                  '${max.toStringAsFixed(0)}', // Display the maximum value
                  style: TextStyle(color: AppColors.initColors().gauge2Gradient2),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
