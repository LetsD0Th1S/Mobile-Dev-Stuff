
import 'package:flutter/material.dart';

class ExpensesFields extends StatefulWidget{
  const ExpensesFields({super.key});

  @override
  State<ExpensesFields> createState() => _ExpensesFields();
}

class _ExpensesFields extends State<ExpensesFields> {
  final TextEditingController _expenseName = TextEditingController();
  final TextEditingController _expenseAmount = TextEditingController();
  final List<double> totalExpenses = [];
  final Color textColor = Colors.white;

  void addAmountsToTotal(){
    setState(() {
      totalExpenses.add(double.parse(_expenseAmount.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 180,
            child: TextField(
              controller: _expenseName,
              decoration: InputDecoration(
                label: const Text('Expense Name'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: TextField(
              controller: _expenseAmount,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value){
                final double? floatVal = double.tryParse(value);
                if (floatVal != null){
                  addAmountsToTotal();
                  // print(totalExpenses);
                }
              },
              decoration: InputDecoration(
                label: const Text('Amount'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}