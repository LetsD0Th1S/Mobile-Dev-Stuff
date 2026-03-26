import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/core/shared/formatter_function.dart';
import 'package:jt_leave_app/data/providers/isar_providers.dart';
import 'package:jt_leave_app/history_results/components/remove_history_item_function.dart';
import 'package:jt_leave_app/history_results/widgets/history_text.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                              text: formatDate(item.fromDate!),
                            ),
                            HistoryText(
                              prefix: 'To: ',
                              text: formatDate(item.toDate!),
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
                              text: formatDate(item.submittedDate),
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
