import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/core/shared/formatter_function.dart';
import 'package:jt_leave_app/data/providers/leave_submit_provider.dart';
import 'package:jt_leave_app/core/widgets/file_picker.dart';
import 'package:jt_leave_app/submissions/components/date_range_function.dart';
import 'package:jt_leave_app/submissions/components/submission_function.dart';
import 'package:jt_leave_app/submissions/widgets/leave_dropdown.dart';

class SubmitScreen extends ConsumerStatefulWidget {
  const SubmitScreen({super.key});

  @override
  ConsumerState<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends ConsumerState<SubmitScreen> {
  @override
  Widget build(BuildContext context) {
    final leaveItems = ref.watch(leaveListProvider);
    final stateValues = ref.watch(submitProvider);

    return Container(
      alignment: .topCenter,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: .center,
        children: [
          const SizedBox(height: 30),
          const Text('Please select your leave to submit below:'),
          const SizedBox(height: 20),
          LeaveDropdown(leaveItems: leaveItems),
          const SizedBox(height: 20),
          if (stateValues['start'] == null || stateValues['end'] == null)
            ListTile(
              tileColor: Theme.of(
                context,
              ).colorScheme.primaryContainer.withAlpha(150),
              titleAlignment: .center,
              leading: const Icon(Icons.date_range),
              title: const Text('Tap to select a date range'),
              onTap: () => setDateRange(context, ref),
            )
          else ...[
            ListTile(
              tileColor: Theme.of(context).colorScheme.secondaryContainer,
              titleAlignment: .center,
              leading: const Icon(Icons.date_range_outlined),
              title: Text(
                'From: ${formatDate(stateValues['start'])} \nUntil: ${formatDate(stateValues['end']!)}',
                style: const TextStyle(fontSize: 14),
              ),
              onTap: () => setDateRange(context, ref),
            ),
          ],
          const SizedBox(height: 20),
          if (stateValues['start'] != null && stateValues['end'] != null)
            Text('Number of days: ${stateValues['leaveDays']}')
          else
            const Text('Estimate leave days in range: 0'),
          const SizedBox(height: 20),
          const FileSelector(),
          ElevatedButton(
            onPressed: () => handleSubmit(context, ref),
            child: const Text('Submit', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
