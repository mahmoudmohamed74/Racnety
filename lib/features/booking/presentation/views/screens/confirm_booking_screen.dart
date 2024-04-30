import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/icons_manger.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/snack_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/payment/paypal_payment.dart';
import 'package:parking_app/features/payment/stripe_payment.dart';

class ConfirmBookingScreen extends StatelessWidget {
  ConfirmBookingScreen({super.key});

  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController durationTimeController = TextEditingController();
  final TextEditingController paymentController = TextEditingController();

  final TextEditingController instructionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Confirm Booking',
        isBack: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                      scale: .7,
                    ),
                  ),
                ],
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
                          'Start Time : ',
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
                        controller: startTimeController,
                        keyboardType: TextInputType.none,
                        decoration: const InputDecoration(
                          hintText: '12:00 AM',
                          contentPadding: EdgeInsets.only(
                            left: 8,
                            bottom: 5,
                            top: 5,
                            right: 5,
                          ),
                        ),
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 10, minute: 00),
                            initialEntryMode: TimePickerEntryMode.input,
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData(
                                  primaryColor: ColorManager.primary,
                                  hintColor: ColorManager.primary,
                                  colorScheme: ColorScheme.light(
                                    primary: ColorManager.primary,
                                  ), // Text color
                                ),
                                child: child!,
                              );
                            },
                          ).then((value) {
                            startTimeController.text =
                                value!.format(context).toString();
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    Icon(
                      IconBroken.Time_Circle,
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
                          'Duration Time : ',
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
                        controller: durationTimeController,
                        keyboardType: TextInputType.none,
                        decoration: const InputDecoration(
                          hintText: '00:00 AM',
                          contentPadding: EdgeInsets.only(
                            left: 8,
                            bottom: 5,
                            top: 5,
                            right: 5,
                          ),
                        ),
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 10, minute: 00),
                            initialEntryMode: TimePickerEntryMode.input,
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData(
                                  primaryColor: ColorManager.primary,
                                  hintColor: ColorManager.primary,
                                  colorScheme: ColorScheme.light(
                                    primary: ColorManager.primary,
                                  ), // Text color
                                ),
                                child: child!,
                              );
                            },
                          ).then((value) {
                            durationTimeController.text =
                                value!.format(context).toString();
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    Icon(
                      Icons.access_alarm_outlined,
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
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          paymentController.text = 'Paypal';
                                          Navigator.of(context).pop('PayPal');
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
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          paymentController.text =
                                              'Credit Card';
                                          Navigator.of(context).pop('PayPal');
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
            TextButtonWidget(
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
              onTap: () async {
                if (startTimeController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarWidget(
                      text: Text(
                        'Please Select Start Time ',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s16,
                        ),
                      ),
                      backGroundColor: ColorManager.error,
                    ),
                  );
                } else if (durationTimeController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarWidget(
                      text: Text(
                        'Please Select Duration Time ',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s16,
                        ),
                      ),
                      backGroundColor: ColorManager.error,
                    ),
                  );
                } else if (paymentController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarWidget(
                      text: Text(
                        'Please Select Payment Way ',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s16,
                        ),
                      ),
                      backGroundColor: ColorManager.error,
                    ),
                  );
                } else if (paymentController.text == 'Paypal') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaypalPayment(
                        amount: 20,
                        orderId: 'orderModel.orderDocId',
                        earnestIsPaid: false,
                        priceIsPaid: false,
                      ),
                    ),
                  );
                } else if (paymentController.text == 'Credit Card') {
                  await initPayment(
                      amount: 50.0, context: context, email: 'email@test.com');
                }
              },
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
          ],
        ),
      ),
    );
  }
}
