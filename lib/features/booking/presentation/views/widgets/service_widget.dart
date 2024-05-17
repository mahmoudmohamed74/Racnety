import 'package:flutter/material.dart';
import 'package:parking_app/core/assets/app_assets.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/themes/color_manager.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/features/booking/data/models/service_model.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    required this.serviceModel,
    required this.index,
    Key? key,
  }) : super(key: key);

  final ServiceModel serviceModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final List<String> picList = [
      ImageAssets.elec,
      ImageAssets.wiper,
      ImageAssets.washing_inside,
      ImageAssets.balanced,
      ImageAssets.complete,
    ];
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.confirmServices,
          arguments: {'serviceModel': serviceModel},
        );
        print(serviceModel.name);
        print(serviceModel.serviceCost);
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
                  picList[index],
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
                      '${serviceModel.name}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: AppSize.s18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${serviceModel.serviceCost} LE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: AppSize.s18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
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
