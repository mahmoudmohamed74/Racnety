import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/empty_list_widget.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/tickets_history_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Order History',
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s15,
        ),
        child: BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(
                  height: AppSize.s20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: ToggleSwitch(
                      minWidth: AppSize.s150,
                      cornerRadius: 20.0,
                      borderWidth: 1,
                      borderColor: [ColorManager.primary],
                      activeBgColors: [
                        [ColorManager.primary],
                        [ColorManager.primary],
                      ],
                      activeFgColor: ColorManager.white,
                      inactiveBgColor: ColorManager.white,
                      inactiveFgColor: ColorManager.primary,
                      initialLabelIndex: state.selHistIndex,
                      totalSwitches: 2,
                      labels: const ['Tickets', 'Services'],
                      customTextStyles: const [
                        TextStyle(
                          fontSize: AppSize.s16,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                      radiusStyle: true,
                      onToggle: (index) {
                        context
                            .read<BookingCubit>()
                            .onToggleHistoryScreen(index);
                      },
                    ),
                  ),
                ),
                ConditionalBuilder(
                  condition: !state.isLoading,
                  builder: (context) {
                    return ConditionalBuilder(
                      condition: state.selHistIndex == 0,
                      builder: (context) {
                        return ConditionalBuilder(
                          condition: state.ticketHistList.isNotEmpty,
                          builder: (context) {
                            return Expanded(
                              child: TicketsHistoryWidget(
                                ticketsList: state.ticketHistList,
                              ),
                            );
                          },
                          fallback: (context) => const SizedBox(
                            height: 500,
                            child: Align(
                              alignment: Alignment.center,
                              child: EmptyListWidget(
                                text: "No Tickets Reserved Yet",
                              ),
                            ),
                          ),
                        );
                      },
                      fallback: (context) {
                        return ConditionalBuilder(
                          condition: state.ticketHistList.isNotEmpty,
                          builder: (context) {
                            return const Text(
                              "fallback",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: AppSize.s20,
                                color: Colors.amber,
                              ),
                            );
                          },
                          fallback: (context) => const SizedBox(
                            height: 500,
                            child: Align(
                              alignment: Alignment.center,
                              child: EmptyListWidget(
                                text: "No Services Reserved Yet",
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  fallback: (context) => const SizedBox(
                    height: 500,
                    child: Align(
                      alignment: Alignment.center,
                      child: LoadingWidget(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
