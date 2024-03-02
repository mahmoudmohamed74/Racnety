import 'package:flutter/material.dart';
import 'package:racnety/core/themes/color_manager.dart';
import 'package:racnety/core/utils/app_strings.dart';

import '../icons/icons_broken.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.mnjz,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary,
            ),
          ),
          const SizedBox(
            height: 25,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                AppStrings.store,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const Spacer(),
          Icon(
            IconBroken.Profile,
            color: ColorManager.primary,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
