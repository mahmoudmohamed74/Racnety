// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    this.title,
    this.textButton,
    this.isBack = false,
    this.isBackWithFunc = false,
    this.isTextButton = false,
    this.onSearch,
    this.onTap,
    this.onTapBackFunc,
    Key? key,
  }) : super(key: key);

  String? title;
  String? textButton;
  bool isBack = false;
  bool isBackWithFunc = false;
  bool isTextButton = false;
  VoidCallback? onSearch;
  VoidCallback? onTap;
  Function? onTapBackFunc;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: MediaQuery.of(context).size.height * .2,
      backgroundColor: Colors.transparent,
      leading: isBack
          ? IconButton(
              onPressed: () {
                if (isBackWithFunc) {
                  onTapBackFunc!();
                } else {
                  Navigator.pop(context);
                }
              },
              icon: Icon(
                IconBroken.Arrow___Left,
                color: ColorManager.primary,
              ),
            )
          : IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: ColorManager.primary,
              ),
            ),
      title: Text(
        title!,
        style: TextStyle(
          color: ColorManager.white,
        ),
      ),
      actions: [
        if (isTextButton)
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorManager.primary),
              ),
              onPressed: onTap,
              child: Text(
                textButton!,
                style: TextStyle(
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
