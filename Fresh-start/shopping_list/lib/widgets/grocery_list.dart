import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async { // Simply async function since we are waiting for a return value from new_item's _saveItem method.
    final newItem = await Navigator.of(context).push<GroceryItem>( // The generic and value coming from the nav pop method in the new_item file
      MaterialPageRoute(
        builder: (ctx) => const NewItem()
        ),
      );

      if (newItem == null){
        return;
      }
      setState(() { // setState required since we'll be rebuilding the UI and including the newly add items in the _groceryItems list.
        _groceryItems.add(newItem);
      });
  }
  

  @override
  Widget build(BuildContext context) {
    Widget bodyView = Center(child: const Text('No groceries loaded yet.'));

    if (_groceryItems.isNotEmpty){
      setState(() {
        bodyView = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(_groceryItems[index].id),
          onDismissed: (direction){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${_groceryItems[index].name} has been removed'))
            );
            _groceryItems.removeAt(index);
            },
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(_groceryItems[index].quantity.toString()),
          ),
        ),
      );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: bodyView,

    );
  }
}
