import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/screens/confirm_booking_screen.dart';

class CustomSlotsWidget extends StatelessWidget {
  final AreaModel slotsModel;
  final List<int> localReservedSlots;
  const CustomSlotsWidget({
    super.key,
    required this.slotsModel,
    required this.localReservedSlots,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (slotsModel.isAvailable! &&
            !localReservedSlots.contains(slotsModel.id)) {
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
          color: slotsModel.isAvailable! &&
                  !localReservedSlots.contains(slotsModel.id)
              ? Colors.green
              : Colors.red,
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
              if (slotsModel.isDisabled!)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    ImageAssets.accParking,
                    // fit: BoxFit.fill,
                    height: 80,
                    width: 80,
                  ),
                ),
              if (!slotsModel.isDisabled!)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    ImageAssets.slotImg,
                    // fit: BoxFit.fill,
                    height: 80,
                    width: 80,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
