// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Align(
        alignment: Alignment.topLeft,
        child: MyDrawer(),
      ),
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.homeBackGrd,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                AppBarWidget(
                  title:
                      'welcome , ${context.read<AuthCubit>().userModel?.userName}',
                  isBack: false,
                ),
                const SizedBox(
                  height: AppSize.s50,
                ),
                Image(
                  // fit: BoxFit.fitHeight,
                  height: AppSize.s250,
                  image: AssetImage(
                    ImageAssets.appLogo,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s150,
                ),
                Center(
                  child: Column(
                    children: [
                      TextButtonWidget(
                        icon: Container(
                          width: AppSize.s0,
                        ),
                        borderColor: ColorManager.primary,
                        backGroundColor: ColorManager.primary,
                        textColor: ColorManager.white,
                        width: AppSize.s150,
                        height: AppSize.s52,
                        text: AppStrings.getStart,
                        fontWeight: FontWeight.bold,
                        onTap: () {
                          context.read<BookingCubit>().getGarages();
                          Navigator.pushNamed(
                            context,
                            Routes.newBooking,
                          );
                        },
                      ),
                      SizedBox(
                        height: AppSize.s50,
                      ),
                      Text(
                        'Parking Garage app For Malls \nBook your slot easy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorManager.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
