// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/utils/app_pref.dart';
import 'package:parking_app/core/utils/service_locator.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/features/booking/data/models/service_model.dart';
import 'package:parking_app/features/booking/presentation/controllers/booking_cubit.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/drawer.dart';
import 'package:parking_app/features/payment/paypal_payment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Home',
        isBack: false,
      ),
      drawer: Align(
        alignment: Alignment.topLeft,
        child: MyDrawer(),
      ),
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.homeBackGrd,
            fit: BoxFit.fill,
            height: double.infinity,
          ),
          Column(
            children: [
              const SizedBox(
                height: AppSize.s50,
              ),
              Image(
                fit: BoxFit.fitHeight,
                height: AppSize.s150,
                image: AssetImage(
                  ImageAssets.appLogo,
                ),
              ),
              const SizedBox(
                height: AppSize.s50,
              ),
              Center(
                  child: TextButton(
                child: Text('paypal'),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PaypalPayment(
                  //       amount: 20,
                  //       orderId: 'orderModel.orderDocId',
                  //       earnestIsPaid: false,
                  //       priceIsPaid: false,
                  //     ),
                  //   ),
                  // );

                  // context.read<BookingCubit>().addSlot(
                  //       userId: 2.toString(),
                  //       slot: 2,
                  //     );
                  // context.read<BookingCubit>().addService(
                  //       userId: 2.toString(),
                  //       service: ServiceModel(
                  //         id: 1,
                  //         name: "car wash",
                  //         pic: "",
                  //         serviceCost: 200,
                  //       ),
                  //     );
                  context
                      .read<BookingCubit>()
                      .loadServices(userId: 2.toString());
                },
              )
                  // Text(
                  //   "Parking app for malls is to provide a parking solution \nthat includes features to enhance the parking \nexperience ,parking experience for Shopping Malls.",
                  //   textAlign: TextAlign.center,
                  // ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
