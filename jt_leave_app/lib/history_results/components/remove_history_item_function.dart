import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/data/providers/api_submit_provider.dart';
import 'package:jt_leave_app/data/providers/isar_providers.dart';
import 'package:jt_leave_app/data/providers/leave_submit_provider.dart';
import 'package:jt_leave_app/history_results/models/history_item.dart';

Future<void> removeItem(
  BuildContext context,
  WidgetRef ref,
  HistoryItem item,
) async {
  final tempItem = item;
  final submitter = ref.read(submitProvider.notifier);
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  try {
    await ref.read(submitActionProvider.notifier).remove(item.id);
    await ref.read(submitAPIProvider.notifier).removeItem(item.id);

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text('${item.name} removed successfully'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            submitter.setAll(tempItem);
            ref.read(submitActionProvider.notifier).submit();
          },
        ),
        duration: const Duration(seconds: 3),
        persist: false,
      ),
    );
  } catch (e) {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (e) =>
            Dialog(child: Center(child: Text("Couldn't remove due to: $e"))),
      );
    } else {
      dev.log(
        'Lost context when removeItem function was called. Logging error instead: $e',
      );
    }
  }
}
