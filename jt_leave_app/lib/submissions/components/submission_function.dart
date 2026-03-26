import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/data/providers/isar_providers.dart';
import 'package:jt_leave_app/data/providers/leave_submit_provider.dart';
import 'package:jt_leave_app/history_results/models/history_item.dart';

Future<void> handleSubmit(BuildContext context, WidgetRef ref) async {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  final submitter = ref.watch(submitProvider);
  if (submitter.isEmpty) {
    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Please verify all info before submitting')),
    );
  } else {
    final newItem = HistoryItem(
      leaveCode: submitter['code'],
      name: submitter['leaveType'],
      submittedDate: submitter['submitted'],
      fromDate: submitter['start'],
      toDate: submitter['end'],
      numOfDays: submitter['leaveDays'],
      status: SubmitStatus.pending,
    );
    // Store Riverpod state
    ref.read(submitProvider.notifier).setAll(newItem);
    try {
      await ref.read(submitActionProvider.notifier).submit();
      dev.log(ref.watch(submitActionProvider).toString());
      scaffoldMessenger.showSnackBar(
        SnackBar(content: const Text('Info saved locally...')),
      );
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
    // invalidate method forces Riverpod to re-run the argument provider, fetch fresh data, and rebuild the History Screen
    // where we're retrieving the data for viewing.
    ref.invalidate(historyListProvider);
  }
}
