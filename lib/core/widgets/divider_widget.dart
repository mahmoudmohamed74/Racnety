// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class MyDividerWidget extends StatelessWidget {
  MyDividerWidget({
    required this.height,
    Key? key,
  }) : super(key: key);
  double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
        ),
        Divider(),
      ],
    );
  }
}
