import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.selectedItem});

  final int selectedItem;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: .all(2),
        decoration: BoxDecoration(
          color: const Color.fromARGB(36, 5, 5, 5),
          shape: .circle,
        ),
        child: Image.asset(
          'lib/utils/images/jt_leave_icon_test.png',
          height: 16,
          width: 16,
        ),
      ),
      title: Center(
        child: selectedItem == 0
            ? const Text('Submit Leave')
            : selectedItem == 1
            ? const Text('Leave Balances')
            : const Text('History'),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
