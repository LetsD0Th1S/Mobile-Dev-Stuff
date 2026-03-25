import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jt_leave_app/data/providers/api_submit_provider.dart';
import 'package:jt_leave_app/data/providers/isar_providers.dart';
import 'package:jt_leave_app/data/providers/leave_submit_provider.dart';
import 'package:jt_leave_app/ui/history_results/models/history_item.dart';
import 'package:jt_leave_app/ui/history_results/widgets/history_text.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  Future<void> removeItem(
    BuildContext context,
    WidgetRef ref,
    HistoryItem item,
  ) async {
    final tempItem = item;
    final submitter = ref.read(submitProvider.notifier);

    try {
      await ref.read(submitActionProvider.notifier).remove(item.id);
      await ref.read(submitAPIProvider.notifier).removeItem(item.id);

      ScaffoldMessenger.of(context).showSnackBar(
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
      await showDialog(
        context: context,
        builder: (e) =>
            Dialog(child: Center(child: Text("Couldn't remove due to: $e"))),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = DateFormat('yyyy-MM-dd');
    final history = ref.watch(historyListProvider);
    ref.watch(historyRemoveProvider);

    return Container(
      alignment: .topCenter,
      width: double.infinity,
      child: history.when(
        data: (data) {
          if (data.isEmpty) {
            return const Text('No data to load');
          }
          return ListView.builder(
            padding: .all(4),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Dismissible(
                key: ValueKey(item.id),
                confirmDismiss: (direction) async {
                  try {
                    await removeItem(context, ref, item);
                    return true;
                  } catch (e) {
                    dev.log(e.toString());
                    return false;
                  }
                },

                child: Card(
                  margin: .all(6),
                  color: Color.fromARGB(255, 185, 234, 185),
                  child: Padding(
                    padding: const .symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            HistoryText(prefix: 'Type: ', text: item.name),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Divider(color: Theme.of(context).colorScheme.surface),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            HistoryText(
                              prefix: 'From: ',
                              text: formatter.format(item.fromDate!),
                            ),
                            HistoryText(
                              prefix: 'To: ',
                              text: formatter.format(item.toDate!),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Divider(color: Theme.of(context).colorScheme.surface),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            HistoryText(
                              prefix: 'Days: ',
                              text: '~${item.numOfDays}',
                            ),
                            HistoryText(
                              prefix: 'Submitted: ',
                              text: formatter
                                  .format(item.submittedDate)
                                  .toString(),
                            ),
                          ],
                        ),
                        Divider(color: Theme.of(context).colorScheme.surface),
                        HistoryText(
                          prefix: 'Status: ',
                          text:
                              '${item.status.name[0].toUpperCase()}${item.status.name.substring(1)}',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (e, _) {
          return Center(child: Text('$e'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
