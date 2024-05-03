// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';

class FormFieldWidget extends StatelessWidget {
  FormFieldWidget({
    super.key,
    this.hintText,
    this.labelText,
    this.headText = "",
    this.onChanged,
    this.obscureText = false,
    required this.controller,
    required this.type,
    this.suffix,
    this.prefix,
    this.suffixPressed,
    this.prefixPressed,
    required this.validator,
  });

  Function(String)? onChanged;
  String? hintText;
  String? labelText;
  String? headText;
  IconData? suffix;
  IconData? prefix;
  TextEditingController controller;
  TextInputType? type;
  Function? suffixPressed;
  Function? prefixPressed;
  String? Function(String? val)? validator;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p5,
        horizontal: AppPadding.p28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$headText",
            style: const TextStyle(
              fontSize: AppSize.s15,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: AppSize.s5,
          ),
          TextFormField(
            controller: controller,
            keyboardType: type,
            obscureText: obscureText!,
            validator: validator,
            onChanged: onChanged,
            style: const TextStyle(fontSize: AppSize.s20),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: ColorManager.darkGrey,
                fontSize: AppSize.s14,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: ColorManager.grey,
                fontSize: AppSize.s16,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  suffix,
                  size: AppSize.s20,
                  color: ColorManager.darkGrey,
                ),
                onPressed: () {
                  suffixPressed!();
                },
              ),
              prefixIcon: IconButton(
                icon: Icon(
                  prefix,
                  size: AppSize.s20,
                  color: ColorManager.primary,
                ),
                onPressed: () {
                  prefixPressed!();
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppPadding.p20,
                horizontal: AppPadding.p10,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
                borderSide: BorderSide(
                  color: ColorManager.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
                borderSide: BorderSide(
                  color: ColorManager.primary,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
                borderSide: BorderSide(
                  width: AppSize.s1_5,
                  color: ColorManager.error,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
                borderSide: BorderSide(
                  width: AppSize.s1_5,
                  color: ColorManager.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
