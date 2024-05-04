import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/screens/booking_solts_screen.dart';

class CustomAreaWidget extends StatelessWidget {
  final AreaModel areaModel;
  const CustomAreaWidget({
    super.key,
    required this.areaModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<BookingCubit>().getSlots(
              areaId: areaModel.id ?? 1,
            );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingSlotsScreen(
              areaModel: areaModel,
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
            const SizedBox(
              height: AppSize.s30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  areaModel.name ?? "",
                  style: const TextStyle(
                    fontSize: AppSize.s30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  ImageAssets.class_,
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
          ],
        ),
      ),
    );
  }
}
