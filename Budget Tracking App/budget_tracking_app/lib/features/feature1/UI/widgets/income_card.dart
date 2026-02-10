import 'package:budget_tracking_app/features/feature1/data/models/income_item.dart';
import 'package:flutter/material.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({
    super.key,
    required this.item,
    required this.onNameChanged,
    required this.onValueChanged,
    required this.onFilterChanged,
    required this.onDelete,
  });

  final IncomeItem item;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onValueChanged;
  final ValueChanged<Filter> onFilterChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: .all(10),
      color: const Color.fromARGB(200, 103, 58, 183),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(label: const Text('Name')),
                onChanged: onNameChanged,
              ),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(label: const Text('Amount')),
                onChanged: onValueChanged,
              ),
            ),
            SizedBox(width: 8),
            DropdownButton<Filter>(
              value: item.filter,
              items: Filter.values
                  .map(
                    (filter) => DropdownMenuItem(
                      value: filter,
                      child: Text(filter.name),
                    ),
                  )
                  .toList(),
              onChanged: (Filter? value) {
                if (value != null) {
                  onFilterChanged(value);
                }
              },
            ),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
