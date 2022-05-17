import 'package:flutter/material.dart';
import 'package:kkservices/screens/payment/success.dart';

class PaymentModule extends StatefulWidget {
  const PaymentModule({Key? key}) : super(key: key);

  @override
  State<PaymentModule> createState() => _PaymentModuleState();
}

class _PaymentModuleState extends State<PaymentModule> {
  int value = 0;

  final paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];

  final paymentLabels = [
    'Cash on Delivery',
    'Credit card / Debit Card',
    'ApplePay',
    'M-PESA',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "Choose your payment method",
              style: TextStyle(color: Color(0xFF808080), fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: Colors.blueAccent,
                    value: index,
                    groupValue: value,
                    onChanged: (val) => setState(() {}
                        //=> value = val
                        ),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: const TextStyle(color: Color(0xff303030)),
                  ),
                  trailing:
                      Icon(paymentIcons[index], color: Colors.blueAccent),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 24),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FlatButton(
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Success(),
                  ));
                },
                child: Text("Pay".toUpperCase()),
              )),
        ],
      ),
    );
  }
}
