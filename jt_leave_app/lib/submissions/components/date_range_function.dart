import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/data/providers/leave_submit_provider.dart';

Future<void> setDateRange(BuildContext context, WidgetRef ref) async {
  var numOfDays = 0;
  var currentDate = DateTime.now();
  var untilDate = DateTime(currentDate.year + 1);
  final dates = await showDateRangePicker(
    context: context,
    firstDate: currentDate,
    lastDate: untilDate,
    helpText: 'Please select the date range',
  );
  if (dates != null) {
    var counter = dates.start;
    while (counter.isBefore(dates.end) || counter.isAtSameMomentAs(dates.end)) {
      if (counter.weekday != DateTime.saturday &&
          counter.weekday != DateTime.sunday) {
        numOfDays += 1;
      }
      counter = counter.add(const Duration(days: 1));
    }
    ref
        .read(submitProvider.notifier)
        .setDates(currentDate, dates.start, dates.end, numOfDays);
  }
}
