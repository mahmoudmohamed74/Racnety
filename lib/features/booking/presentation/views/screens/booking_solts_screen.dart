import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/features/booking/data/models/area_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/custom_slots_widget.dart';

class BookingSlotsScreen extends StatelessWidget {
  final AreaModel? areaModel;
  const BookingSlotsScreen({super.key, this.areaModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                AppBarWidget(
                  title: '',
                  isBack: true,
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
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Slots in ${areaModel?.name}',
                            style: const TextStyle(
                              fontSize: AppSize.s20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
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
                ConditionalBuilder(
                  condition: state.slotsList.isNotEmpty,
                  builder: (context) => Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        right: AppSize.s8,
                        left: AppSize.s8,
                      ),
                      // color: Colors.grey[300],
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        mainAxisSpacing: AppSize.s30,
                        crossAxisSpacing: AppSize.s50,
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1,
                        children: List.generate(
                          state.slotsList.length,
                          (index) => CustomSlotsWidget(
                            slotsModel: state.slotsList[index],
                            localReservedSlots: state.localSlots,
                          ),
                        ),
                      ),
                    ),
                  ),
                  fallback: (context) => const Text("No slots are available."),
                ),
              ],
            ),
          ],
        );
      },
    ));
  }
}
