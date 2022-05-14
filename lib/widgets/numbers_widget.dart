import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  //const NumbersWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildButton(text: 'Projects', value: 39),
        buildDivider(),
        buildButton(text: 'Following', value: 529),
        buildDivider(),
        buildButton(text: 'Followes', value: 5834),
      ],
    );
  }

  buildDivider() {
    Container(
      height: 24,
      child: const VerticalDivider(),
    );
  }

  buildButton({required String text, required int value}) {
    MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '$value',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
