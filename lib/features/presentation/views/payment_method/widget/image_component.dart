import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePdfComponent extends StatelessWidget {
  File file;

  ImagePdfComponent({required this.file});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(8.r),
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey[300],
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(8.r),
          child: file.path.endsWith('.pdf',)
              ? Center(child: Icon(Icons.picture_as_pdf, size: 40, color: Colors.red))
              : Image.file(file, fit: BoxFit.cover),
        ),
      ),
    );
  }


}
