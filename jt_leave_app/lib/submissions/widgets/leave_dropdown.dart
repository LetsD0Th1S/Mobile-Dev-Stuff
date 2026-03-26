import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/data/providers/leave_submit_provider.dart';

class LeaveDropdown extends ConsumerWidget {
  const LeaveDropdown({super.key, required this.leaveItems});

  final List<Map<String, dynamic>> leaveItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownMenu(
      width: MediaQuery.widthOf(context) - 40,
      onSelected: (code) {
        final selected = leaveItems.firstWhere((item) => item['code'] == code);
        dev.log("$code ${selected['name']}");
        return ref
            .read(submitProvider.notifier)
            .getType(
              selected['name']!,
              int.parse(code!),
            ); //ToDo: replace 1 with an actual code for the Leave Type selected.
      },
      textStyle: Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(fontWeight: .bold),
      label: const Text('Leave Type', style: TextStyle(fontSize: 16)),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 255, 254, 255),
        ),
      ),
      dropdownMenuEntries: [
        ...leaveItems.map((item) {
          return DropdownMenuEntry(value: item['code'], label: item['name']!);
        }),
      ],
    );
  }
}
