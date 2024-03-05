import 'package:flutter/material.dart';
import 'package:racnety/core/utils/app_constants.dart';

class SnackBarWidget extends SnackBar {
  final Color? backGroundColor;
  final Widget? text;

  SnackBarWidget({
    Key? key,
    required this.text,
    required this.backGroundColor,
  }) : super(
          key: key,
          content: text!,
          duration: const Duration(seconds: Constants.three),
          backgroundColor: backGroundColor,
          behavior: SnackBarBehavior.floating,
        );
}
