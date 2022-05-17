import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkservices/screens/payment/payment_controller.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final paymentController = Get.put(PaymentController());
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () => paymentController.makePayment(
              amount: '500', 
              currency: 'USD'
            ), 
            child: const Text("Make Payment"),
          ),
        )
      ],
    ));
  }
}
