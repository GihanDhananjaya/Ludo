import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';

class PinPutComponent extends StatefulWidget {
  final Function(String) onSubmit;
  final TextEditingController? textEditingController;
  final int? length;
  final TextInputType? textInputType;
  final String? errorText;
  final String? Function(String?)? validator;

  PinPutComponent({
    required this.onSubmit,
    this.length = 6,
    this.textEditingController,
    this.textInputType,
    this.validator,
    this.errorText,
  });

  @override
  State<PinPutComponent> createState() => _PinPutComponentState();
}

class _PinPutComponentState extends State<PinPutComponent> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.textEditingController ?? TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          textAlign: TextAlign.center,
          controller: _controller,
          validator: widget.validator,
          maxLength: widget.length ?? 6,
          keyboardType: widget.textInputType ?? TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 11.5.w),
            isDense: true,
            counterText: "",
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
              borderSide: BorderSide(
                color: AppColors.initColors().darkGrey,
                width: 0.8.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
              borderSide: BorderSide(
                color: AppColors.initColors().checkBoxBorder,
                width: 0.85.w,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
              borderSide: BorderSide(
                color: AppColors.initColors().checkBoxBorder,
                width: 0.8.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
              borderSide: BorderSide(
                color: AppColors.initColors().checkBoxBorder,
                width: 0.8.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
              borderSide: BorderSide(
                color: AppColors.initColors().errorRed,
                width: 0.8.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
              borderSide: BorderSide(
                color: AppColors.initColors().errorRed,
                width: 0.8.w,
              ),
            ),
            filled: true,
            fillColor: AppColors.initColors().checkBoxBorder,
            errorStyle: const TextStyle(
              fontSize: 0,
            ),
            hintText: 'Enter OTP',
            hintStyle: TextStyle(
                letterSpacing: 0,
                color: AppColors.initColors().loginSubTitleColor,
                fontSize: AppDimensions.kFontSize16,
                fontWeight: FontWeight.w500),
          ),
          style: TextStyle(
            letterSpacing: 10,
            fontSize: AppDimensions.kFontSize14,
            color: AppColors.initColors().darkGrey,
            fontWeight: FontWeight.w400,
          ),
          onChanged: (value) {},
        ),
        if (widget.errorText != null)
          Center(
            child: Text(
              widget.errorText!,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: AppDimensions.kFontSize12,
                fontWeight: FontWeight.w400,
                color: AppColors.initColors().errorRed,
              ),
            ),
          ),
      ],
    );
  }
}
