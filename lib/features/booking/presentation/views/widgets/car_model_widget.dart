import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';

class CarModelWidget extends StatelessWidget {
  CarModelWidget({required this.carModel, required this.onSelect, Key? key})
      : super(key: key);
  String carModel;
  final Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Text(
            '$carModel',
            style: TextStyle(
              fontSize: AppSize.s20,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: () {
            onSelect(carModel);

            Navigator.of(context).pop('$carModel');
          },
        ),
        const SizedBox(
          height: AppSize.s5,
        )
      ],
    );
  }
}
