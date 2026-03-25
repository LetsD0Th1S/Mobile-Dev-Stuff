import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jt_leave_app/data/providers/isar_providers.dart';
import 'package:jt_leave_app/data/providers/leave_submit_provider.dart';
import 'package:jt_leave_app/ui/core/widgets/file_picker.dart';
import 'package:jt_leave_app/ui/history_results/models/history_item.dart';
import 'package:jt_leave_app/ui/submissions/widgets/leave_dropdown.dart';

class SubmitScreen extends ConsumerStatefulWidget {
  const SubmitScreen({super.key});

  @override
  ConsumerState<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends ConsumerState<SubmitScreen> {
  DateTime? startDate;
  DateTime? endDate;
  final formatter = DateFormat('yyyy-MM-dd');
  var numOfDays = 0;

  void _submitDateRange() async {
    numOfDays = 0;
    var currentDate = DateTime.now();
    var untilDate = DateTime(currentDate.year + 1);
    final dates = await showDateRangePicker(
      context: context,
      firstDate: currentDate,
      lastDate: untilDate,
      helpText: 'Please select the date range',
    );
    if (dates != null) {
      startDate = dates.start;
      endDate = dates.end;

      var counter = startDate;
      if (startDate != null && endDate != null) {
        while (counter!.isBefore(endDate!) ||
            counter.isAtSameMomentAs(endDate!)) {
          if (counter.weekday != DateTime.saturday &&
              counter.weekday != DateTime.sunday) {
            numOfDays += 1;
          }
          counter = counter.add(const Duration(days: 1));
        }
      }
      // Triggers the required UI rerendering ; might need to rebuild this soon.
      setState(() {});
    }
  }

  Future<void> _handleSubmit() async {
    if (ref.watch(submitProvider).isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please verify all info before submitting'),
        ),
      );
    } else {
      //ToDo: Store data of submission locally, and then access from History screen.
      final submitter = ref.watch(submitProvider);
      final newItem = HistoryItem(
        leaveCode: submitter['code'],
        name: submitter['leaveType'],
        submittedDate: DateTime.now(),
        fromDate: startDate,
        toDate: endDate,
        numOfDays: numOfDays,
        status: SubmitStatus.pending,
      );
      // Store Riverpod state
      ref
          .read(submitProvider.notifier)
          .setDates(
            newItem.submittedDate,
            newItem.fromDate,
            newItem.toDate,
            newItem.numOfDays,
          );
      try {
        await ref.read(submitActionProvider.notifier).submit();

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: const Text('Info saved locally...')));
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
      // invalidate method forces Riverpod to re-run the argument provider, fetch fresh data, and rebuild the History Screen
      // where we're retrieving the data for viewing.
      ref.invalidate(historyListProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final leaveItems = ref.watch(leaveListProvider);

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
          if (startDate == null || endDate == null)
            ListTile(
              tileColor: Theme.of(
                context,
              ).colorScheme.primaryContainer.withAlpha(150),
              titleAlignment: .center,
              leading: const Icon(Icons.date_range),
              title: const Text('Tap to select a date range'),
              onTap: _submitDateRange,
            )
          else ...[
            ListTile(
              tileColor: Theme.of(context).colorScheme.secondaryContainer,
              titleAlignment: .center,
              leading: const Icon(Icons.date_range_outlined),
              title: Text(
                'From: ${formatter.format(startDate!)} \nUntil: ${formatter.format(endDate!)}',
                style: const TextStyle(fontSize: 14),
              ),
              onTap: _submitDateRange,
            ),
          ],
          const SizedBox(height: 20),
          if (endDate != null && startDate != null)
            Text('Number of days: $numOfDays')
          else
            const Text('Estimate leave days in range: 0'),
          const SizedBox(height: 20),
          const FileSelector(),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: const Text('Submit', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
