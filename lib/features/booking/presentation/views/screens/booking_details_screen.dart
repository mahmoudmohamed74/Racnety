import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/loading_widget.dart';
import 'package:parking_app/core/widgets/snack_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/booking/data/models/ticket_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';

class BookingDetailsScreen extends StatelessWidget {
  final TicketModel ticketModel;
  const BookingDetailsScreen({super.key, required this.ticketModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: '',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {
            if (state.error == "200" || state.error == "201") {
              customSnackBar(
                context: context,
                message: "Your request has been sent successfully...",
                isError: false,
              );
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Card(
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          ImageAssets.qr,
                          scale: .9,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppPadding.p8,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: AppSize.s55,
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Request Id',
                                  style: TextStyle(
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "${ticketModel.id}",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppPadding.p8,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: AppSize.s55,
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Full Name',
                                  style: TextStyle(
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  ticketModel.fullName ?? "",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppPadding.p8,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: AppSize.s55,
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Phone Number',
                                  style: TextStyle(
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  ticketModel.phoneNumber ?? "",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppPadding.p8,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: AppSize.s55,
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Book Duration',
                                  style: TextStyle(
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  ticketModel.bookDuration ?? "",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppPadding.p8,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: AppSize.s55,
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Slot',
                                  style: TextStyle(
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  ticketModel.slot ?? "",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppPadding.p8,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: AppSize.s55,
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Area',
                                  style: TextStyle(
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  ticketModel.area ?? "",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: AppSize.s19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                ConditionalBuilder(
                  condition: !state.isLoading,
                  builder: (context) {
                    return TextButtonWidget(
                      icon: Container(
                        width: AppSize.s0,
                      ),
                      borderColor: Colors.redAccent,
                      backGroundColor: Colors.redAccent,
                      textColor: ColorManager.white,
                      width: AppSize.s330,
                      height: AppSize.s52,
                      text: AppStrings.cancelBooking,
                      fontWeight: FontWeight.bold,
                      onTap: () async {
                        context.read<BookingCubit>().deleteTicket(
                              ticketId: ticketModel.id ?? 1,
                            );
                      },
                    );
                  },
                  fallback: (context) => const LoadingWidget(),
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
