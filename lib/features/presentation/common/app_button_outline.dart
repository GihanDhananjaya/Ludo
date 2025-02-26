import 'package:flutter/material.dart';


import '../../../utils/app_colors.dart';
import '../../../utils/enums.dart';

class AppButtonOutline extends StatefulWidget {
  final String buttonText;
  final Function onTapButton;
  final double width;
  final ButtonType buttonType;
  final Widget? prefixIcon;
  final Color? buttonColor;
  final Color? textColor;
  final Color? outLineColor;

  AppButtonOutline(
      {required this.buttonText,
        required this.onTapButton,
        this.width = 0,
        this.prefixIcon,
        this.buttonColor,
        this.outLineColor,
        this.textColor,
        this.buttonType = ButtonType.ENABLED});

  @override
  State<AppButtonOutline> createState() => _AppButtonOutlineState();
}

class _AppButtonOutlineState extends State<AppButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11.5),
        width: widget.width == 0 ? double.infinity : widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: widget.outLineColor != null
              ? Border.all(color: widget.outLineColor!)
              : null,
          color: widget.buttonColor != null
              ? widget.buttonType == ButtonType.ENABLED
              ? widget.buttonColor
              : AppColors.initColors().profileArrowColor
              : widget.buttonType == ButtonType.ENABLED
              ? AppColors.initColors().appButtonColor2
              : AppColors.initColors().profileArrowColor,
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
                        AppColors.initColors().nonChangeWhite
                        : widget.textColor != null
                        ? widget.textColor!.withAlpha(180)
                        : AppColors.initColors()
                        .nonChangeWhite
                        .withAlpha(180),
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
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
