import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: '',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      ImageAssets.qr,
                      scale: .9,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(
                  AppPadding.p8,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppSize.s55,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Request Id',
                              style: TextStyle(
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(
                  AppPadding.p8,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppSize.s55,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Full Name',
                              style: TextStyle(
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Hassan Elshirbiny',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(
                  AppPadding.p8,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppSize.s55,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '01*********',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(
                  AppPadding.p8,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppSize.s55,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Book Duration',
                              style: TextStyle(
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '04:00:00',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(
                  AppPadding.p8,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppSize.s55,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Slot',
                              style: TextStyle(
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'S1',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(
                  AppPadding.p8,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppSize.s55,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Area',
                              style: TextStyle(
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'A1',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: AppSize.s19,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            TextButtonWidget(
              icon: Container(
                width: AppSize.s0,
              ),
              borderColor: Colors.redAccent,
              backGroundColor: Colors.redAccent,
              textColor: ColorManager.white,
              width: AppSize.s330,
              height: AppSize.s52,
              text: AppStrings.cancelBooking,
              fontWeight: FontWeight.bold,
              onTap: () async {},
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
          ],
        ),
      ),
    );
  }
}
