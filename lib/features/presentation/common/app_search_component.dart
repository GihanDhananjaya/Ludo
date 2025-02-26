import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_images.dart';

class AppSearchCriteria {
  final List<String> dataset;
  final Function(String) onSubmit;
  final String defaultValue;
  final String title;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final Function(String) onQueryChanged;

  AppSearchCriteria({
    required this.dataset,
    required this.onSubmit,
    required this.defaultValue,
    this.title = 'Search friend',
    this.hintStyle,
    this.borderColor,
    required this.onQueryChanged,
  });
}

class AppSearchComponent extends StatefulWidget {
  final AppSearchCriteria searchCriteria;

  AppSearchComponent({
    required this.searchCriteria,
  });

  @override
  _AppSearchComponentState createState() => _AppSearchComponentState();
}

class _AppSearchComponentState extends State<AppSearchComponent> {
  TextEditingController _searchController = TextEditingController();
  List<String> _filteredList = [];
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    setState(() {
      _searchController.text = widget.searchCriteria.defaultValue ?? '';
      _filteredList.addAll(widget.searchCriteria.dataset);
    });
  }
  @override
  void dispose() {
    super.dispose();
    searchFocusNode.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      controller: _searchController,
      onChanged: (query) {
        setState(() {
          if (query.length >= 2) {
            _filterList(query);
          } else {
            _filteredList = List.from(widget.searchCriteria.dataset);
          }

          widget.searchCriteria.onQueryChanged(
              query); // Call the callback function and pass the query
        });
      },
      focusNode: searchFocusNode,
      maxLength: 50,
      style: TextStyle(
        fontSize: AppDimensions.kFontSize14,
        fontWeight: FontWeight.w600,
        color: AppColors.initColors().white,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 13.h, bottom: 13.h,left: 14.w),
        isDense: true,
        counterText: "",
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: BorderSide(
            color: widget.searchCriteria.borderColor ??
                AppColors.initColors().darkStrokeGrey,
            width: 0.75.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: BorderSide(
            color: widget.searchCriteria.borderColor ??
                AppColors.initColors().darkStrokeGrey,
            width: 0.75.w,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: BorderSide(
            color: widget.searchCriteria.borderColor ??
                AppColors.initColors().darkStrokeGrey,
            width: 0.75.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: BorderSide(
            color: widget.searchCriteria.borderColor ??
                AppColors.initColors().darkStrokeGrey,
            width: 0.75.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: BorderSide(
            color: AppColors.initColors().errorRed,
            width: 0.75.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: BorderSide(
            color: AppColors.initColors().errorRed,
            width: 0.75.w,
          ),
        ),
        // prefixIconConstraints: BoxConstraints(minWidth: 18.w, maxHeight: 18.h),
        // prefixIcon: Padding(
        //   padding: EdgeInsets.only(
        //     left: 13.w,
        //     right: 6.w,
        //   ),
        //   child: Image.asset(
        //     AppImages.appSearch,
        //     color: widget.searchCriteria.borderColor ??
        //         AppColors.initColors().lightGrey,
        //   ),
        // ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 7.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.initColors().disableButtonColor
            ),
            child: Image.asset(
              width: 19,height: 19,
              AppImages.appSearch,
              color: widget.searchCriteria.borderColor ??
                  AppColors.initColors().white,
            ),
          ),
        ),
        //suffixIconConstraints: BoxConstraints(minWidth: 19.w, maxHeight: 19.h),
        hintText: widget.searchCriteria.title,
        errorMaxLines: 2,
        errorStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: AppDimensions.kFontSize8,
          fontWeight: FontWeight.w400,
          color: AppColors.initColors().errorRed,
        ),
        hintStyle: widget.searchCriteria.hintStyle ??
            TextStyle(
                color: AppColors.initColors().darkStrokeGrey,
                fontSize: AppDimensions.kFontSize12,
                fontWeight: FontWeight.w400),
      ),
      onSubmitted: widget.searchCriteria.onSubmit,
    );
  }
  void _filterList(String query) {
    setState(() {
      _filteredList = widget.searchCriteria.dataset
          .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
