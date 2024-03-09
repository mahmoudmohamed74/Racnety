import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/features/booking/presentation/views/screens/confirm_booking_screen.dart';

class BookingSlotsScreen extends StatelessWidget {
  const BookingSlotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: '',
        isBack: true,
      ),
      body: Column(
        children: [
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
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Solts in A1',
                      style: TextStyle(
                        fontSize: AppSize.s20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s10,
                    ),
                    Image.asset(
                      ImageAssets.class_,
                      scale: 1.8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                right: AppSize.s8,
                left: AppSize.s8,
              ),
              // color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                mainAxisSpacing: AppSize.s30,
                crossAxisSpacing: AppSize.s30,
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
                children: List.generate(
                  20,
                  (index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmBookingScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          AppSize.s10,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'S1',
                              style: TextStyle(
                                fontSize: AppSize.s40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Icon(
                            //   Icons.directions_car_filled_outlined,
                            //   size: AppSize.s100,
                            //   color: ColorManager.black,
                            // ),
                            Icon(
                              Icons.accessible_outlined,
                              size: AppSize.s100,
                              color: ColorManager.black,
                            ),
                          ],
                        ),
                      ),
                    ),
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
