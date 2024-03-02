import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:racnety/core/utils/app_constants.dart';
import 'package:racnety/core/utils/assets.dart';

import '../themes/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: AppConstants.size100h,
            width: AppConstants.size100h,
            child: Lottie.asset(AssetsData.warningError),
          ),
          Text(
            errorMessage,
            style: AppStyles.titleStyle20.copyWith(
              // fontFamily: kGtSectraFine,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
