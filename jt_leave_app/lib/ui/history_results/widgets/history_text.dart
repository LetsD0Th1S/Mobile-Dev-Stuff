import 'package:flutter/material.dart';

class HistoryText extends StatelessWidget {
  const HistoryText({super.key, required this.prefix, required this.text});

  final String prefix;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: prefix,
        style: TextStyle(fontWeight: .bold, fontSize: 16),
        children: <TextSpan>[
          TextSpan(
            text: text,
            style: TextStyle(
              fontWeight: .w100,
              fontSize: 14,
              color: text == 'Pending'
                  ? Colors.orange
                  : text == 'Approved'
                  ? Colors.blueGrey
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
