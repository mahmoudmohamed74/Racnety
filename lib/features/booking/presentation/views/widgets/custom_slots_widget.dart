import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/screens/confirm_booking_screen.dart';

class CustomSlotsWidget extends StatelessWidget {
  final AreaModel slotsModel;
  const CustomSlotsWidget({
    super.key,
    required this.slotsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (slotsModel.isAvailable!) {
          context.read<BookingCubit>().selectSlot(
                slotsModel.id,
              );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmBookingScreen(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: slotsModel.isAvailable! ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(
            AppSize.s10,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                slotsModel.name ?? " ",
                style: const TextStyle(
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
                slotsModel.isDisabled!
                    ? Icons.accessible_outlined
                    : Icons.local_parking,
                size: AppSize.s100,
                color: ColorManager.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
