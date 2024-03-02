import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/themes/color_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        ImageAssets.homeBackGrd,
        fit: BoxFit.fill,
        height: double.infinity,
      ),
      Center(
        child: CircularProgressIndicator(
          color: ColorManager.primary,
        ),
      ),
    ]);
  }
}
