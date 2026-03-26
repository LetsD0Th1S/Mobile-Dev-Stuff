import 'package:flutter/material.dart';

class BalanceHeaders extends StatelessWidget {
  const BalanceHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle makeBold = TextStyle(fontWeight: .bold, fontSize: 15);

    return const Row(
      mainAxisAlignment: .spaceEvenly,
      children: [
        Text('Leave Type', style: makeBold),
        Text('Days Left', style: makeBold),
        Text('Valid Until', style: makeBold),
      ],
    );
  }
}
