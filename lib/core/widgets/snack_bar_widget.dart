import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_constants.dart';
import 'package:parking_app/features/booking/presentation/views/screens/home.dart';

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
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
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
    ),
  );
}

void showBookingConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Booking Confirmed'),
        content: const Text(
          'Your booking has been confirmed successfully.',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text(
              'OK',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
}
