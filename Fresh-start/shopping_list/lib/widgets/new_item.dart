import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey =
      GlobalKey<
        FormState
      >(); // Global keys allow us to "keep" internal state for processing, as found further below when a values reset or item add is executed.
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCat = categories[Categories.vegetables]!;

  void _saveItem() {
    // .validate method reaches out to all form widgets and runs through their validator args.
    if (_formKey.currentState!.validate()) {
      // http.get(headers: 'Hi');
      _formKey.currentState!.save();
      Navigator.of(context).pop(
        GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCat,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const .all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  // no setState function or further state mgt needed, as we aren't trying to rebuild or update the ui anywhere.
                  _enteredName =
                      value!; // Validators already check nulls, therefore we can enforce "!" here.
                },
              ), // Instead of TextField()
              Row(
                crossAxisAlignment: .end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text('Quantity'),
                      ),
                      keyboardType: .number,
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be a valid postitive number.';
                        }
                        return null;
                      },
                      onSaved: (value) => _enteredQuantity = int.parse(
                        value!,
                      ), // Validators already check nulls, therefore we can enforce "!" here.
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      initialValue: _selectedCat,
                      items: [
                        for (final cat
                            in categories
                                .entries) // .entries allows us to iterate through mapped key-value pairs
                          DropdownMenuItem(
                            value: cat.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: cat.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(cat.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) => _selectedCat = value!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: .end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
