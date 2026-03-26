import 'package:flutter/material.dart';
import 'package:jt_leave_app/balances/widgets/balance_list_headers.dart';
import 'package:jt_leave_app/balances/widgets/balance_screen_header.dart';
import 'package:jt_leave_app/balances/widgets/leave_list.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key, required this.theCode, required this.name});

  final String theCode;
  final String name;
  // final navBarHeight = kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const BalanceScreenHeader(),
        const SizedBox(height: 10),
        const Text(
          'Welcome,',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.grey,
          ),
        ),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        Container(
          height: 20,
          decoration: BoxDecoration(
            border: BoxBorder.fromLTRB(
              bottom: const BorderSide(
                color: Color.fromARGB(255, 150, 175, 188),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Current Available Balances',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            margin: .all(8),
            padding: .only(left: 8, right: 8, bottom: 14),
            decoration: BoxDecoration(
              borderRadius: const .all(.circular(12)),
              color: Theme.of(
                context,
              ).colorScheme.primaryContainer.withAlpha(200),
            ),
            child: ListView(
              // mainAxisSize: .min,
              children: const [
                SizedBox(height: 60, child: BalanceHeaders()),
                SizedBox(height: 300, child: LeaveList()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
