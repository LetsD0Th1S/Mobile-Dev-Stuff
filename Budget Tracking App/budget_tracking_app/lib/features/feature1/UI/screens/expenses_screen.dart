import 'package:budget_tracking_app/features/feature1/UI/logic/expense_list_providers.dart';
import 'package:budget_tracking_app/features/feature1/UI/widgets/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(expenseProvider);

    return Column(
      children: [
        const Text("Please add your expenses below."),
        const SizedBox(height: 8),

        Expanded(
          child: ListView.builder(
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index == items.length) {
                return Center(
                  child: ElevatedButton(
                    onPressed: ref.read(expenseProvider.notifier).add,
                    child: const Text('Add Expense'),
                  ),
                );
              }

              final item = items[index];
              return ExpenseCard(
                item: item,
                name: (n) =>
                    ref.read(expenseProvider.notifier).changeName(index, n),
                amount: (a) =>
                    ref.read(expenseProvider.notifier).changeAmount(index, a),
                recurs: (_) =>
                    ref.read(expenseProvider.notifier).setRecur(index),
                filter: (f) => ref
                    .read(expenseProvider.notifier)
                    .setFilterChange(index, f),
                onDelete: () =>
                    ref.read(expenseProvider.notifier).remove(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
