// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';

class ProfileItemWidget extends StatelessWidget {
  ProfileItemWidget({
    required this.icon,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  IconData icon;
  String text;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: AppSize.s60,
        child: Row(
          children: [
            Icon(
              icon,
            ),
            const SizedBox(
              width: AppSize.s20,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Spacer(),
            const Icon(
              IconBroken.Arrow___Right_2,
            ),
          ],
        ),
      ),
    );
  }
}
