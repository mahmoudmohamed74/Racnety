// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/features/booking/presentation/views/screens/booking_class_screen.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/drawer.dart';

class NewBookingScreen extends StatelessWidget {
  const NewBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'New Booking',
        isBack: false,
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
            height: AppSize.s12,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: AppSize.s50,
              width: 300,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(
                  AppSize.s12,
                ),
                border: Border.all(
                  color: ColorManager.black, // Border color
                  width: 1.0, // Border width
                ),
              ),
              child: const Center(
                child: Text(
                  'Available Garages',
                  style: TextStyle(
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s5,
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: AppSize.s5,
              ),
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookingClassScreen(),
                    ),
                  );
                },
                child: Card(
                  elevation: AppSize.s3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  color: ColorManager.white,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(AppSize.s12),
                              topRight: Radius.circular(AppSize.s12),
                            ),
                            child: Image.asset(
                              ImageAssets.garage2,
                              fit: BoxFit.cover,
                              // width: AppSize.s100,
                              height: AppSize.s120,
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  width: AppSize.s7,
                                ),
                                Icon(
                                  IconBroken.Location,
                                ),
                                Text(
                                  'City Star',
                                  style: TextStyle(
                                    fontSize: AppSize.s20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: AppSize.s10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Text(
                        'Price : 20 LE/Hour',
                        style: TextStyle(
                          fontSize: AppSize.s20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppSize.s20,
                          right: AppSize.s20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.directions_car,
                                  size: AppSize.s30,
                                  color: ColorManager.black,
                                ),
                                SizedBox(
                                  width: AppSize.s10,
                                ),
                                Text(
                                  '30',
                                  style: TextStyle(
                                    fontSize: AppSize.s18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border_outlined,
                                  size: AppSize.s30,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: AppSize.s10,
                                ),
                                Text(
                                  '14',
                                  style: TextStyle(
                                    fontSize: AppSize.s18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: AppSize.s30,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: AppSize.s10,
                                ),
                                Text(
                                  '30',
                                  style: TextStyle(
                                    fontSize: AppSize.s18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
