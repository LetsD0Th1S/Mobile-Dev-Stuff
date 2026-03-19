import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jt_leave_app/UI/widgets/history_text.dart';
import 'package:jt_leave_app/providers/isar_providers.dart';
import 'dart:developer' as dev;

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = DateFormat('yyyy-MM-dd');
    final history = ref.watch(historyListProvider);

    dev.log(history.toString());
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
                onDismissed: (direction) {
                  ref.read(submitActionProvider.notifier).remove(item.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item.name} removed successfully'),
                    ),
                  );
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
          dev.log(e.toString());
          return Center(child: Text('$e'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
