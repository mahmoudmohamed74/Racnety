// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:parking_app/core/widgets/snack_bar_widget.dart';
import 'package:webview_flutter_x5/webview_flutter.dart';

class PaypalPayment extends StatefulWidget {
  final double amount;
  final String orderId;
  final bool earnestIsPaid;
  final bool priceIsPaid;

  const PaypalPayment({
    Key? key,
    required this.amount,
    required this.orderId,
    this.earnestIsPaid = false,
    this.priceIsPaid = false,
  }) : super(key: key);

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {
  late final Map<String, dynamic> _transaction;
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    // Initialize transaction
    _transaction = {
      "amount": {
        "total": widget.amount,
        "currency": "USD",
        "details": {
          "subtotal": widget.amount,
          "shipping": '0',
          "shipping_discount": 0
        }
      },
      "description": "The payment transaction description.",
      "item_list": {
        "items": [
          {
            "name": "A demo product",
            "quantity": 1,
            "price": widget.amount,
            "currency": "USD"
          }
        ],
        "shipping_address": {
          "recipient_name": "Jane Foster",
          "line1": "Travis County",
          "line2": "",
          "city": "Austin",
          "country_code": "US",
          "postal_code": "73301",
          "phone": "+00000000",
          "state": "Texas"
        },
      }
    };
  }

  @override
  void dispose() {
    _isMounted = false; // Set _isMounted to false when the state is disposed
    super.dispose();
  }

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return UsePaypal(
      sandboxMode: true,
      clientId:
          "ARRcntqib0lMxkKF0zKl1LI666MhQX0Y7_2GUB1Z8_UNlqjWNqbk3_zlPH9gdyW-n-rRxBDPrskfdcod",
      secretKey:
          "EEv88FnSqvctMyYq7lwjoP5uYqtslAvJJQsKoueEa01RUek6T24-VXWLRhwkYsRgwtolDlvFcQyQNYHX",
      returnURL: "https://parking-app-aeec4.firebaseapp.com/return",
      cancelURL: "https://parking-app-aeec4.firebaseapp.com/cancel",
      transactions: [_transaction],
      note: "Contact us for any questions on your order.",
      onSuccess: (
        Map params,
      ) async {
        // if (_isMounted) {
        //   setState(() {
        //     _scaffoldKey.currentState?.showSnackBar(
        //       SnackBarWidget(
        //         text: const Text('Payment is successful'),
        //         backGroundColor: Colors.green,
        //       ),
        //     );
        //   });
        // }
        FirebaseFirestore.instance
            .collection("order")
            .doc(widget.orderId)
            .update({
          if (widget.earnestIsPaid == true) "earnestIsPaid": "true",
          if (widget.priceIsPaid == true) "priceIsPaid": "true",
          if (widget.priceIsPaid == true) "status": "solved",
        });
        print("Payment successful! Payment ID: $params");
      },
      onError: (error) {
        // if (_isMounted) {
        //   // Check _isMounted before calling setState
        //   setState(() {
        //     _scaffoldKey.currentState?.showSnackBar(
        //       SnackBarWidget(
        //         text: Text('An error occurred ${error.toString()}'),
        //         backGroundColor: Colors.yellow,
        //       ),
        //     );
        //   });
        // }
        print("Payment error: $error");
      },
      onCancel: (params) {
        // if (_isMounted) {
        //   // Check _isMounted before calling setState
        //   setState(() {
        //     _scaffoldKey.currentState?.showSnackBar(
        //       SnackBarWidget(
        //         text: const Text('Payment is cancelled'),
        //         backGroundColor: Colors.yellow,
        //       ),
        //     );
        //   });
        // }
        print("Payment cancelled by user: $params");
      },
    );
  }
}
