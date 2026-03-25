import 'package:flutter/material.dart';

class BalanceScreenHeader extends StatelessWidget {
  const BalanceScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Padding(
            padding: const .symmetric(horizontal: 20.0, vertical: 20),
            child: Text(
              'JT Leave Management',
              style: Theme.of(context).textTheme.titleLarge!,
            ),
          ),
        ],
      ),
    );
  }
}
