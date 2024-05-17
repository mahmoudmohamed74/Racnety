import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/strings_manger.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';
import 'package:parking_app/features/booking/presentation/views/widgets/service_widget.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});

  final TextEditingController _searchServices = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: 'Services',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p10,
                horizontal: 50,
              ),
              child: Card(
                elevation: 2,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.search,
                    hintStyle: TextStyle(
                      color: ColorManager.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                  ),
                  controller: _searchServices,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                ),
              ),
            ),
            const ServiceWidget(
              serviceType: 'Wheels Balanced',
              price: '50:00',
              serviceImage: ImageAssets.balanced,
            ),
            const ServiceWidget(
              serviceType: 'Wiper Plade Replacement',
              price: '150:00',
              serviceImage: ImageAssets.wiper,
            ),
            const ServiceWidget(
              serviceType: 'Electrification Charging',
              price: '90:00',
              serviceImage: ImageAssets.elec,
            ),
            const ServiceWidget(
              serviceType: 'Car Washing Inside',
              price: '60:00',
              serviceImage: ImageAssets.washing_inside,
            ),
            const ServiceWidget(
              serviceType: 'Car Washing Outside',
              price: '60:00',
              serviceImage: ImageAssets.washing_inside,
            ),
            const ServiceWidget(
              serviceType: 'Complete Washing',
              price: '50:00',
              serviceImage: ImageAssets.complete,
            ),
          ],
        ),
      ),
    );
  }
}
