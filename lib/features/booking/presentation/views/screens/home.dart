// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/utils/service_locator.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/drawer.dart';
import 'package:parking_app/features/garages/data/repo/base_garage_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'About Us',
        isBack: false,
        isTextButton: true,
        textButton: 'LOGOUT',
        onTap: () {
          sl.get<BaseGarageRepo>().getGarages();
          sl.get<BaseGarageRepo>().getGaragesInfo();
          sl.get<BaseGarageRepo>().getSlotsByGarage(garageId: 1);
        },
      ),
      drawer: Align(
        alignment: Alignment.topLeft,
        child: MyDrawer(
          onTap: () {},
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: AppSize.s50,
          ),
          const Image(
            fit: BoxFit.fitHeight,
            height: AppSize.s150,
            image: AssetImage(
              ImageAssets.splashLogo,
            ),
          ),
          const SizedBox(
            height: AppSize.s50,
          ),
          Center(
            child: Text(
              "Parking app for malls is to provide a parking solution \nthat includes features to enhance the parking \nexperience ,parking experience for Shopping Malls.",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
