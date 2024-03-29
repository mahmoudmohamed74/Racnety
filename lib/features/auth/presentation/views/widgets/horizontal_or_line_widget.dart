import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';

class HorizontalOrLineWidget extends StatelessWidget {
  const HorizontalOrLineWidget({
    super.key,
    required this.label,
    required this.height,
  });

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: AppPadding.p25,
              right: AppPadding.p16,
            ),
            child: Divider(
              color: ColorManager.grey,
              height: height,
              thickness: AppSize.s1_5,
            ),
          ),
        ),
        SizedBox(
          child: Text(
            label,
            textAlign: TextAlign.end,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: AppPadding.p16,
              right: AppPadding.p25,
            ),
            child: Divider(
              color: ColorManager.grey,
              height: height,
              thickness: AppSize.s1_5,
            ),
          ),
        ),
      ],
    );
  }
}
