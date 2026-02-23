import 'package:budget_tracking_app/features/feature1/data/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.item,
    required this.name,
    required this.amount,
    required this.filter,
    this.date,
    required this.recurs,
    required this.onDelete,
  });

  final ExpenseItem item;
  final ValueChanged<String> name;
  final ValueChanged<String> amount;
  final ValueChanged<ExpFilter> filter;
  final ValueChanged<DateTime>? date;
  final ValueChanged<bool> recurs;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: .all(.8),
      color: Colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(onChanged: name)),
                Expanded(
                  child: TextField(onChanged: amount),
                ),
                Checkbox(value: item.isRecurring, onChanged: (value){
                  if (value != null){
                    recurs(value);
                  }
                  }),
                DropdownButton<ExpFilter>(
                  value: item.filter,
                  items: ExpFilter.values
                      .map(
                        (filter) => DropdownMenuItem(
                          value: filter,
                          child: Text(filter.name),
                        ),
                      )
                      .toList(),
                  onChanged: (ExpFilter? value) {
                    if (value != null) {
                      filter(value);
                    }
                  },
                ),
                IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
              ],
            ),
            if (item.isRecurring == false) SizedBox(width: 10, height: 10,),
          ],
        ),
      ),
    );
  }
}
