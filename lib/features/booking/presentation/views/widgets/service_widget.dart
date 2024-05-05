// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_router.dart';

class ServiceWidget extends StatelessWidget {
  ServiceWidget({
    required this.serviceType,
    required this.price,
    required this.serviceImage,
    Key? key,
  }) : super(key: key);

  String serviceType;
  String price;
  String serviceImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.confirmServices, arguments: {
          'serviceImage': serviceImage,
          'serviceName': serviceType,
          'servicePrice': price,
        });
        print(serviceType);
        print(price);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .99,
        height: AppSize.s100,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s12),
                  bottomLeft: Radius.circular(AppSize.s12),
                ),
                child: Image.asset(
                  serviceImage,
                  height: AppSize.s100,
                  width: AppSize.s120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: AppSize.s10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$serviceType',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: AppSize.s18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '$price LE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: AppSize.s18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
