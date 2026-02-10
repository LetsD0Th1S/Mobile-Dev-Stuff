import 'package:flutter/material.dart';
import 'package:jt_leave_app/UI/widgets/balance_grid_items_container.dart';

class BalanceHeaders extends StatelessWidget {
  const BalanceHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: .spaceEvenly,
        children: [
          Text('Leave Type'),
          Text('Valid Until'),
          Text('Days Left'),
        ],
    );
  }
}
