import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_constants.dart';

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

void customSnackBar({
  required BuildContext context,
  required String message,
  Duration duration = const Duration(seconds: 3),
  bool? isError,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: ColorManager.white,
        fontSize: AppSize.s16,
      ),
    ),
    duration: duration,
    behavior: SnackBarBehavior.fixed,
    backgroundColor:
        isError == true ? ColorManager.error : ColorManager.darkPrimary,
  ));
}
