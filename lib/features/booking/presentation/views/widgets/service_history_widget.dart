import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/features/booking/data/models/service_model.dart';

class ServiceHistWidget extends StatelessWidget {
  final List<ServiceModel> servicesList;
  const ServiceHistWidget({
    super.key,
    required this.servicesList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Car Model',
              style: TextStyle(
                fontSize: AppSize.s20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Service Type   ',
              style: TextStyle(
                fontSize: AppSize.s20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cost    ',
              style: TextStyle(
                fontSize: AppSize.s20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: servicesList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 20,
            ),
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   Routes.bookingDetails,
                //   arguments: {'ticketModel': servicesList[index]},
                // );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  right: AppPadding.p20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      servicesList[index].carName ?? "",
                      style: const TextStyle(
                        fontSize: AppSize.s15,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      servicesList[index].name ?? "Car Wash",
                      style: const TextStyle(
                        fontSize: AppSize.s15,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "${servicesList[index].serviceCost}",
                      style: const TextStyle(
                        fontSize: AppSize.s15,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
