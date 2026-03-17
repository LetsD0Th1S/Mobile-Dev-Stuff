import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/providers/isar_providers.dart';
import 'dart:developer' as dev;

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Card(
                child: Row(
                  children: [
                    Text(item.name),
                    Text(item.status.name),
                    Text(item.fromDate.toString()),
                  ],
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
