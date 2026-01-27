import 'package:flutter/material.dart';
import '../../data/models/expense_model.dart';
import '../widgets/custom_expenses_text_fields.dart';

class MyExpenses extends StatefulWidget {
  const MyExpenses({super.key});

  @override
  State<MyExpenses> createState() => _MyExpensesState();
}

class _MyExpensesState extends State<MyExpenses> {
  final List<Expenses> _expenses = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();


  void _addExpense(){
    final String name = _nameController.text;
    final double? amount = double.tryParse(_amountController.text);

    if (name.isEmpty || amount == null || amount <= 0) return;

    setState(() {
      _expenses.add(
        Expenses(
          name: name, 
          amount: amount, 
          date: DateTime.now(),
          ),
      );
    });

    _nameController.clear();
    _amountController.clear();
  }

  double get totalSpent {
    return _expenses.fold(
      0.0, 
      (sum, expense) => sum + expense.amount,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Padding(padding: EdgeInsetsGeometry.all(20), 
          child: const Text('Please enter all your expenses below',
          textAlign: TextAlign.center, 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          ),
            ExpensesFields(),
            ExpensesFields(),      
          ElevatedButton(onPressed: _addExpense, child: const Icon(Icons.add))
        ],
      ),
      floatingActionButton: ElevatedButton(onPressed: (){}, child: const Text('Save')),
    );
  }
}