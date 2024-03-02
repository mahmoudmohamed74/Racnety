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
import 'package:parking_app/features/booking/data/models/garage_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/screens/home.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/custom_time_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ConfirmBookingScreen extends StatelessWidget {
  final GarageModel? garageModel;
  ConfirmBookingScreen({super.key, this.garageModel});

  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController durationTimeController = TextEditingController();
  final TextEditingController paymentController = TextEditingController();

  final TextEditingController instructionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          ImageAssets.homeBackGrd,
          fit: BoxFit.fill,
          height: double.infinity,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<BookingCubit, BookingState>(
            listener: (context, state) {
              if (state.error!.contains("*")) {
                customSnackBar(
                  context: context,
                  message: "${state.error}",
                  isError: true,
                );
              }
              if (state.error == "201") {
                showBookingConfirmationDialog(
                  context: context,
                  title: 'Booking Confirmed',
                  content: 'Your booking has been confirmed successfully.',
                  alertText: "OK",
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                );
                // customSnackBar(
                //   context: context,
                //   message: "Your Request Is Under Progress",
                //   isError: false,
                // );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  AppBarWidget(
                    title: 'Confirm Booking',
                    isBack: true,
                  ),
                  Card(
                    elevation: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: QrImageView(
                            data: state.selSlot.toString(),
                            version: QrVersions.auto,
                            size: 180.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  CustomTimeWidget(
                    title: "Start Time: ",
                    hintText: '12:00 PM',
                    controller: startTimeController,
                    onTap: () {
                      context.read<BookingCubit>().selectBookTime(
                            false,
                            controller: startTimeController,
                            context: context,
                          );
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  CustomTimeWidget(
                    title: 'Duration Time : ',
                    hintText: '00:00 AM',
                    controller: durationTimeController,
                    onTap: () {
                      context.read<BookingCubit>().selectBookTime(
                            true,
                            controller: durationTimeController,
                            context: context,
                          );
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        AppPadding.p8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppSize.s150,
                            height: AppSize.s50,
                            decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(
                                AppSize.s10,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(0.0, 1.0),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Payment : ',
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s19,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: paymentController,
                              keyboardType: TextInputType.none,
                              decoration: const InputDecoration(
                                hintText: 'Choose Way',
                                contentPadding: EdgeInsets.only(
                                  left: 8,
                                  bottom: 5,
                                  top: 5,
                                  right: 5,
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Choose Way'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            TextButton(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    ImageAssets.paypal,
                                                    scale: 4,
                                                  ),
                                                  const SizedBox(
                                                    width: AppSize.s20,
                                                  ),
                                                  const Text(
                                                    'PayPal',
                                                    style: TextStyle(
                                                      fontSize: AppSize.s20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {
                                                paymentController.text =
                                                    'Paypal';
                                                context
                                                    .read<BookingCubit>()
                                                    .selectPaymentType(1);
                                                Navigator.of(context)
                                                    .pop('PayPal');
                                              },
                                            ),
                                            const SizedBox(
                                              height: AppSize.s5,
                                            ),
                                            TextButton(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    ImageAssets.credit_card,
                                                    scale: 4,
                                                  ),
                                                  const SizedBox(
                                                    width: AppSize.s20,
                                                  ),
                                                  const Text(
                                                    'Credit Card',
                                                    style: TextStyle(
                                                      fontSize: AppSize.s20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onPressed: () {
                                                paymentController.text =
                                                    'Credit Card';
                                                context
                                                    .read<BookingCubit>()
                                                    .selectPaymentType(2);

                                                Navigator.of(context)
                                                    .pop('PayPal');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s10,
                          ),
                          Icon(
                            Icons.payment_outlined,
                            color: ColorManager.primary,
                            size: AppSize.s30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        AppPadding.p8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: AppSize.s50,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: instructionController,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: 'Put Your instruction...',
                                contentPadding: EdgeInsets.only(
                                  left: 8,
                                  bottom: 5,
                                  top: 5,
                                  right: 5,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        AppPadding.p8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Fees : 20 LE/Hour',
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s19,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  ConditionalBuilder(
                    condition: !state.isLoading,
                    builder: (context) => TextButtonWidget(
                      icon: Container(
                        width: AppSize.s0,
                      ),
                      borderColor: ColorManager.primary,
                      backGroundColor: ColorManager.primary,
                      textColor: ColorManager.white,
                      width: AppSize.s330,
                      height: AppSize.s52,
                      text: AppStrings.confirmBooking,
                      fontWeight: FontWeight.bold,
                      onTap: () {
                        context.read<BookingCubit>().bookTicket(
                              notes: instructionController.text,
                            );
                      },
                    ),
                    fallback: (context) => const LoadingWidget(),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
