import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('dd/MM/yyyy');

const uuid = Uuid(); // Utility object, so it's created outside the class. We don't need/want to set the scope to the class only.

// On the constructor, we are connecting an initializer list with ":". Initializer lists can be used to initialize class properties
// (like "id") with values that are NOT received as constructor function arguments.

enum Category { food, travel, leisure, work }
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  };

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate{
    return formatter.format(date);
  }

  }


class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

 // Below we have an alternate constructor, which wires up to an initializer list. Will have to do some research on this.
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) 
  : expenses = allExpenses
    .where((expense) => expense.category == category)
    .toList();

  double get totalExpenses {
    double sum = 0;

    for (final i in expenses){
      sum += i.amount;
    }

    return sum;
  }
}