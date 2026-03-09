import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const .fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const .fromARGB(255, 42, 51, 59),
        ),
        scaffoldBackgroundColor: const .fromARGB(255, 50, 58, 60),
        textTheme: TextTheme(titleLarge: TextStyle(fontWeight: .w500)),
      ),
      home: GroceryList(),
    );
  }
}
