import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jt_leave_app/UI/widgets/file_picker.dart';
import 'package:jt_leave_app/models/history_item.dart';
import 'package:jt_leave_app/providers/leave_submit_provider.dart';
import 'dart:developer' as dev;

class SubmitScreen extends ConsumerStatefulWidget {
  const SubmitScreen({super.key});

  @override
  ConsumerState<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends ConsumerState<SubmitScreen> {
  DateTime? startDate;
  DateTime? endDate;
  var formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    final submitter = ref.watch(submitProvider);
    final leaves = ref.watch(userIntentProvider);

    var submitDate = DateTime.now();

    // Future<DateTimeRange<DateTime>?>
    void submitDateRange() async {
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
        ref
            .read(submitProvider.notifier)
            .setDates(submitDate, dates.start, dates.end);
        // dev.log(submission.toString());
        // return dates;
      }
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: .center,
        children: [
          const SizedBox(height: 30),
          const Text('Please select your leave to submit below:'),
          const SizedBox(height: 10),
          DropdownMenu(
            onSelected: (s) {
              dev.log(s.toString());
              return ref
                  .read(submitProvider.notifier)
                  .getType(
                    s.toString(),
                    1,
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
            dropdownMenuEntries: leaves.maybeWhen(
              data: (item) => item.map((val) {
                return DropdownMenuEntry(
                  value: val!['leave'],
                  label: val['leave'],
                );
              }).toList(),
              orElse: () => [],
            ),
          ),
          const SizedBox(height: 20),
          IconButton(
            onPressed: submitDateRange,
            hoverColor: Colors.black,
            icon: Icon(Icons.date_range, color: Colors.green[500]),
          ),
          if (startDate == null || endDate == null)
            const Text('Select a date range')
          else ...[
            Text(
              'From: ${formatter.format(startDate!)} | Until: ${formatter.format(endDate!)}',
            ),
            Text(
              'Number of days: ${(endDate!.difference(startDate!).inDays) + 1}',
            ),
          ],
          FileSelector(),
          ElevatedButton(
            onPressed: () async {
              if (ref.watch(submitProvider).isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Please verify all info before submitting',
                    ),
                  ),
                );
              } else {
                //ToDo: Store data of submission locally, and then access from History screen.

                final newItem = HistoryItem(
                  leaveCode: submitter['code'],
                  name: submitter['leaveType'],
                  submittedDate: submitter['submitted'],
                  fromDate: submitter['start'],
                  toDate: submitter['end'],
                  numOfDays: 2,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Info submitted...')),
                );
              }
            },
            child: const Text('Submit', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
