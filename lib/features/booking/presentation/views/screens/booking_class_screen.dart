import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/features/booking/data/models/garage_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/custom_area_widget.dart';

class BookingClassScreen extends StatelessWidget {
  final GarageModel? garageModel;
  const BookingClassScreen({
    super.key,
    this.garageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: '',
        isBack: true,
      ),
      body: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: LoadingWidget());
          }
          return Stack(
            children: [
              Image.asset(
                ImageAssets.areaBackGrd,
                fit: BoxFit.fill,
                height: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                              garageModel?.name ?? '',
                              style: const TextStyle(
                                fontSize: AppSize.s20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: AppSize.s10,
                            ),
                            const Icon(
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
                  ConditionalBuilder(
                    condition: state.areasList.isNotEmpty,
                    builder: (context) => Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items per row
                          crossAxisSpacing: 50, // Spacing between columns
                          mainAxisSpacing: 8, // Spacing between rows
                        ),
                        itemCount: state.areasList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CustomAreaWidget(
                          areaModel: state.areasList[index],
                        ),
                      ),

                      // ListView.separated(
                      //   physics: const BouncingScrollPhysics(),
                      //   itemCount: state.areasList.length,
                      //   separatorBuilder: (BuildContext context, int index) =>
                      //       const SizedBox(
                      //     height: AppSize.s5,
                      //   ),
                      //   itemBuilder: (BuildContext context, int index) =>
                      //       CustomAreaWidget(
                      //     areaModel: state.areasList[index],
                      //   ),
                      // ),
                    ),
                    fallback: (context) =>
                        const Text("No areas are available."),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
