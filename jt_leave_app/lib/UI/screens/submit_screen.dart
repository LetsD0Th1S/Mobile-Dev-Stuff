import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jt_leave_app/UI/widgets/file_picker.dart';
import 'package:jt_leave_app/providers/leave_submit_provider.dart';

class SubmitScreen extends ConsumerWidget {
  const SubmitScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

  var formatter = DateFormat('yyyy-MM-dd');
  var submitDate = DateTime.now();
  DateTime? _startDate;
  DateTime? _endDate;

    final submission = ref.watch(submitProvider);
    final leaves = ref.watch(userIntentProvider);

// Future<DateTimeRange<DateTime>?>
void submitDateRange() async {
    var currentDate = DateTime.now();
    var endDate = DateTime(currentDate.year + 1);
    final dates = await showDateRangePicker(
      context: context,
      firstDate: currentDate,
      lastDate: endDate,
      helpText: 'Please select the date range',
    );
    if (dates != null){
      _startDate = dates.start;
      _endDate = dates.end;
      ref.read(submitProvider.notifier).getDates(submitDate, dates.start, dates.end);
      dev.log(submission.toString());
      // return dates;
    }
}


    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Text('Select your leave to submit below:'),
                const SizedBox(height: 10),
                DropdownMenu( 
                  
                  onSelected: (s){
                    dev.log(s.toString());
                    return ref.read(submitProvider.notifier).getType(s.toString());
                    },
                  width: 200,
                  label: const Text(
                    'Select leave',
                    style: TextStyle(fontSize: 18),
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 210, 209, 210),
                    ),
                  ),
                  dropdownMenuEntries: 
                  leaves.maybeWhen(data: (item) => item
                  .map((val){
                    return DropdownMenuEntry(value: val!['leave'], label: val['leave']);
                  }).toList(), 
                  orElse: ()=> [])
                  //  [
                    // DropdownMenuEntry(value: ValueKey, label: 'Annual'),
                    // DropdownMenuEntry(value: ValueKey, label: 'Sick Paid'),
                    // DropdownMenuEntry(value: ValueKey, label: 'Maternity'),
                  // ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Container(
              padding: .symmetric(vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(
                      context,
                    ).colorScheme.secondaryContainer.withAlpha(150),
                    Theme.of(context).colorScheme.secondaryContainer,
                    Theme.of(context).colorScheme.secondaryContainer,
                    Theme.of(context).colorScheme.secondaryContainer,
                    Theme.of(
                      context,
                    ).colorScheme.secondaryContainer.withAlpha(150),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      IconButton(
                        onPressed: submitDateRange,
                        hoverColor: Colors.black,
                        icon: Icon(
                          Icons.calendar_month,
                          color: Colors.green[500],
                        ),
                      ),
                      if (_startDate != null && _endDate != null)
                        Text(textAlign: .center,
                          'From: ${formatter.format(_startDate!)} | Until: ${formatter.format(_endDate!)}',
                        )
                      else
                        Text(textAlign: .center,'Select a date range.'),
                    ],
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    endIndent: 150,
                  ),
                  FileSelector(),
                  if (_endDate != null && _startDate != null)
                    Text(
                      'Number of days: ${(_endDate!.difference(_startDate!).inDays) + 1}',
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (ref.watch(submitProvider).isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Please verify all info before submitting',
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: const Text('Info submitted...')),
                        );
                      }
                    },
                    child: const Text('Submit', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
