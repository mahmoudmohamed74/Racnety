import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racnety/core/themes/color_manager.dart';

abstract class AppStyles {
  static const titleStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const titleStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const titleStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    // fontFamily: kGtSectraFine,
  );
  static const titleStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static final textStyle15 = TextStyle(
    fontSize: 13.sp,
    color: ColorManager.grey,
  );
  static const titleStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
