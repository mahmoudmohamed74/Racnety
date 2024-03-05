// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:racnety/core/assets/app_assets.dart';
import 'package:racnety/core/global/resources/icons_manger.dart';
import 'package:racnety/core/global/resources/values_manger.dart';
import 'package:racnety/core/themes/color_manager.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    this.title,
    this.textButton,
    this.isBack = false,
    this.isBackWithFunc = false,
    this.isSearch = false,
    this.isHome = false,
    this.isTextButton = false,
    this.controller,
    this.onSearch,
    this.onTap,
    this.onTapBackFunc,
    Key? key,
  }) : super(key: key);

  String? title;
  String? textButton;
  bool isBack = false;
  bool isBackWithFunc = false;
  bool isSearch = false;
  bool isHome = false;
  bool isTextButton = false;
  TextEditingController? controller;
  VoidCallback? onSearch;
  VoidCallback? onTap;
  Function? onTapBackFunc;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: MediaQuery.of(context).size.height * .2,
      backgroundColor: ColorManager.white,
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
          : Image.asset(
              ImageAssets.splashLogo,
              scale: 1.4,
            ),
      title:
          // isSearch
          //     ? SizedBox(
          //         width: MediaQuery.of(context).size.width * .866,
          //         child: SearchBarWidget(
          //           readOnly: false,
          //           onTap: () {},
          //           hintText: 'search...',
          //           controller: controller,
          //           onSearch: onSearch,
          //         ),
          //       )
          //     :
          Text(
        title!,
      ),
      actions: [
        if (isHome)
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconBroken.Notification,
              color: ColorManager.primary,
            ),
          ),
        if (isHome)
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconBroken.Heart,
              color: ColorManager.primary,
            ),
          ),
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
