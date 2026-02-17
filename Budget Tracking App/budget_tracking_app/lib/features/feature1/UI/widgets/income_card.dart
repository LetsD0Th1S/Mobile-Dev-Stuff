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

  // void _validateName(){
    
  //   print(onNameChanged);
  //   onNameChanged;
  // }

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
              child: TextFormField(
                decoration: InputDecoration(label: const Text('Name')),
                validator: (value) {
                  if (value == null || value.isEmpty || value == ''){
                    return "Please enter a valid name";
                  }
                  return null;
                },
                onChanged: onNameChanged,
              ),
            ),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(label: const Text('Amount')),
                validator: (value) {
                  if (value == null || value.isEmpty || double.tryParse(value) == null){
                    return "Please enter a valid amount";
                  }
                  return null;
                },
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
