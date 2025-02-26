import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../utils/app_colors.dart';
import '../../../utils/enums.dart';

class AppButton extends StatefulWidget {
  final String buttonText;
  final Function onTapButton;
  final double width;
  final ButtonType buttonType;
  final Widget? prefixIcon;
  final Color? buttonColor;
  final Color? textColor;

  AppButton(
      {required this.buttonText,
        required this.onTapButton,
        this.width = 0,
        this.prefixIcon,
        this.buttonColor,
        this.textColor,
        this.buttonType = ButtonType.ENABLED});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11.5),
        width: widget.width == 0 ? double.infinity : widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
           border: Border.all(color: AppColors.initColors().borderGreenColor,width: 1),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[AppColors.initColors().borderGrayColor2,
                AppColors.initColors().borderGrayColor3]),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.prefixIcon ?? const SizedBox.shrink(),
              widget.prefixIcon != null
                  ? SizedBox(width: 5)
                  : const SizedBox.shrink(),
              Text(
                widget.buttonText,
                style: TextStyle(
                    color: widget.buttonType == ButtonType.ENABLED
                        ? widget.textColor ??
                        AppColors.initColors().white
                        : widget.textColor != null
                        ? widget.textColor!.withAlpha(180)
                        : AppColors.initColors()
                        .nonChangeWhite
                        .withAlpha(180),
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        if (widget.buttonType == ButtonType.ENABLED) {
          widget.onTapButton();
        }
      },
    );
  }
}
