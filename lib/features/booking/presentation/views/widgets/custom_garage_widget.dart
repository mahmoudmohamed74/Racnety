import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/features/booking/presentation/views/screens/booking_class_screen.dart';

import '../../../../../core/assets/app_assets.dart';
import '../../../../../core/global/resources/values_manger.dart';
import '../../../../../core/themes/color_manager.dart';

class GarageCustomWidget extends StatelessWidget {
  const GarageCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                    height: AppSize.s120,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
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
                      SizedBox(
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
            const Text(
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
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      const Text(
                        '30',
                        style: TextStyle(
                          fontSize: AppSize.s18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Row(
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
                  const Row(
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
            const SizedBox(
              height: AppSize.s5,
            ),
          ],
        ),
      ),
    );
  }
}
