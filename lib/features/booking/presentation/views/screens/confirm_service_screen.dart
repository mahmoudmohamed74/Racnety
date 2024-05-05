// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/core/widgets/text_button_widget.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/car_model_widget.dart';

class ConfirmServiceScreen extends StatelessWidget {
  ConfirmServiceScreen({
    required this.serviceImage,
    required this.serviceName,
    required this.servicePrice,
    Key? key,
  }) : super(
          key: key,
        );
  String serviceImage;
  String serviceName;
  String servicePrice;
  final TextEditingController carModelController = TextEditingController();

  void onSelectCarModel(String selectedCarModel) {
    carModelController.text = selectedCarModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: "Confirm Service Request",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .99,
              height: AppSize.s80,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Car Model : ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: AppSize.s18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s100,
                      child: TextFormField(
                        controller: carModelController,
                        keyboardType: TextInputType.none,
                        decoration: const InputDecoration(
                          hintText: 'Car Model',
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
                                title: const Text('Car Model'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      CarModelWidget(
                                        carModel: 'Marcedes',
                                        onSelect: onSelectCarModel,
                                      ),
                                      CarModelWidget(
                                        carModel: 'Hundai Elantra',
                                        onSelect: onSelectCarModel,
                                      ),
                                      CarModelWidget(
                                        carModel: 'Chavorlet',
                                        onSelect: onSelectCarModel,
                                      ),
                                      CarModelWidget(
                                        carModel: 'KIA',
                                        onSelect: onSelectCarModel,
                                      ),
                                      CarModelWidget(
                                        carModel: 'Hundai',
                                        onSelect: onSelectCarModel,
                                      ),
                                      CarModelWidget(
                                        carModel: 'MG',
                                        onSelect: onSelectCarModel,
                                      ),
                                      CarModelWidget(
                                        carModel: 'Ford',
                                        onSelect: onSelectCarModel,
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
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      serviceImage,
                      scale: .7,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .99,
              height: AppSize.s80,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Service Cost : $servicePrice LE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: AppSize.s18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .99,
              height: AppSize.s80,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Service Name : $serviceName',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: AppSize.s18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
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
              text: AppStrings.confirmRequest,
              fontWeight: FontWeight.bold,
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                        'Your Service made Successfull\nWe are Waiting You',
                        style: TextStyle(
                          fontSize: AppSize.s16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('ALRIGHT'),
                        ),
                      ],
                    );
                  },
                );
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushReplacementNamed(context, Routes.homeView);
                });
              },
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
          ],
        ),
      ),
    );
  }
}
