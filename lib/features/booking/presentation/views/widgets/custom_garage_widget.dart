import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/features/booking/data/models/garage_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/screens/booking_class_screen.dart';

import '../../../../../core/assets/app_assets.dart';
import '../../../../../core/global/resources/values_manger.dart';
import '../../../../../core/themes/color_manager.dart';

class GarageCustomWidget extends StatelessWidget {
  final GarageModel garageModel;
  const GarageCustomWidget({
    super.key,
    required this.garageModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<BookingCubit>().getAreas(
              garageId: garageModel.id ?? 1,
            );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingClassScreen(
              garageModel: garageModel,
            ),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: AppSize.s7,
                      ),
                      const Icon(
                        IconBroken.Location,
                      ),
                      Text(
                        garageModel.name ?? "empty",
                        style: const TextStyle(
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
            // const SizedBox(
            //   height: AppSize.s10,
            // ),
            // const Text(
            //   'Price : 20 LE/Hour',
            //   style: TextStyle(
            //     fontSize: AppSize.s20,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),

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
                      Text(
                        "${garageModel.capacity}",
                        style: const TextStyle(
                          fontSize: AppSize.s18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        ImageAssets.available,
                        // fit: BoxFit.fill,
                        height: 25,
                        width: 30,
                      ),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      Text(
                        "${garageModel.freeArea}",
                        style: const TextStyle(
                          fontSize: AppSize.s18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        ImageAssets.reserved,
                        // fit: BoxFit.fill,
                        height: 25,
                        width: 30,
                      ),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      Text(
                        "${garageModel.reservedArea}",
                        style: const TextStyle(
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
