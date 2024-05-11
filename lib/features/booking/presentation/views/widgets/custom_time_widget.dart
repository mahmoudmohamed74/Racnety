import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';

class CustomTimeWidget extends StatelessWidget {
  const CustomTimeWidget({
    super.key,
    required this.hintText,
    required this.title,
    required this.controller,
    this.onTap,
  });

  final String hintText;
  final String title;
  final void Function()? onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(
          AppPadding.p8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: AppSize.s150,
              height: AppSize.s50,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(
                  AppSize.s10,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    offset: Offset(0.0, 1.0),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: AppSize.s10,
            ),
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding: const EdgeInsets.only(
                    left: 8,
                    bottom: 5,
                    top: 5,
                    right: 5,
                  ),
                ),
                onTap: onTap,
              ),
            ),
            const SizedBox(
              width: AppSize.s10,
            ),
            Icon(
              IconBroken.Time_Circle,
              color: ColorManager.primary,
              size: AppSize.s30,
            ),
          ],
        ),
      ),
    );
  }
}
