import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/drawer.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/custom_garage_widget.dart';

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
      body: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: LoadingWidget());
          }
          return Column(
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
              ConditionalBuilder(
                condition: state.garagesList.isNotEmpty,
                builder: (context) {
                  return Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.garagesList.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: AppSize.s5,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          GarageCustomWidget(
                        garageModel: state.garagesList[index],
                      ),
                    ),
                  );
                },
                fallback: (context) {
                  return const Text("Sorry no garages are available");
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
