import 'package:flutter/material.dart';

class BalanceHeaders extends StatelessWidget {
  const BalanceHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [Text('Leave Type'), Text('Days Left'), Text('Valid Until')],
    );
  }
}
