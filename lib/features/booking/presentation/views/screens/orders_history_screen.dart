import 'package:flutter/material.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Orders History',
        isBack: false,
      ),
    );
  }
}
