import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:parking_app/core/widgets/snack_bar_widget.dart';

Future<void> initPayment({
  required String email,
  required double amount,
  required BuildContext context,
}) async {
  try {
    // 1. Create a payment intent on the server
    final response = await http.post(
        Uri.parse(
          'https://us-central1-parking-app-aeec4.cloudfunctions.net/stripePaymentIntentRequest',
        ),
        body: {
          'email': email,
          'amount': amount.toString(),
        });

    final jsonResponse = jsonDecode(response.body);
    log(jsonResponse.toString());
    // 2. Initialize the payment sheet
    // await Stripe.instance.initPaymentSheet(
    //     paymentSheetParameters: SetupPaymentSheetParameters(
    //   paymentIntentClientSecret: jsonResponse['paymentIntent'],
    //   merchantDisplayName: 'booking payment',
    //   customerId: jsonResponse['customer'],
    //   customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
    // ));
    // await Stripe.instance.presentPaymentSheet();
    // FirebaseFirestore.instance.collection("order").doc(orderId).update({
    //   if (earnestIsPaid == true) "earnestIsPaid": "true",
    //   if (priceIsPaid == true) "priceIsPaid": "true",
    //   if (priceIsPaid == true) "status": "solved",
    // });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBarWidget(
        text: const Text('Payment is successful'),
        backGroundColor: Colors.green,
      ),
    );
  } catch (error) {
    // if (error is StripeException) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBarWidget(
    //       text: Text('An error occurred ${error.error.localizedMessage}'),
    //       backGroundColor: Colors.red,
    //     ),
    //   );
    // } else {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('An error occurred $error'),
    //   ),
    // );
    // }
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('An error occurred $error'),
    //   ),
    // );
  }
}
