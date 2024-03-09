import 'package:flutter/material.dart';
import 'package:racnety/core/assets/app_assets.dart';
import 'package:racnety/core/global/resources/values_manger.dart';
import 'package:racnety/core/themes/color_manager.dart';
import 'package:racnety/core/widgets/app_bar_widget.dart';
import 'package:racnety/features/booking/presentation/views/screens/booking_solts_screen.dart';

class BookingClassScreen extends StatelessWidget {
  const BookingClassScreen({super.key});

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
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'City Star',
                      style: TextStyle(
                        fontSize: AppSize.s20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s10,
                    ),
                    Icon(
                      Icons.directions_car,
                      size: AppSize.s30,
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
                      builder: (context) => const BookingSlotsScreen(),
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
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'A1',
                            style: TextStyle(
                              fontSize: AppSize.s30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: AppSize.s10,
                          ),
                          Image.asset(
                            ImageAssets.class_,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s30,
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
