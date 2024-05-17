import 'package:flutter/material.dart';

import '../../../../../core/global/resources/values_manger.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppSize.s20,
          color: Colors.grey,
        ),
      ),
    );
  }
}
