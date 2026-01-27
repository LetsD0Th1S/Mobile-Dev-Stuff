import 'package:flutter/material.dart';
import 'features/feature1/UI/widgets/appbar.dart';
import 'features/feature1/UI/screens/expenses_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: MyAppBar()),
        body: MyExpenses(),
        drawer: ElevatedButton(onPressed: (){}, child: const Text('Press')),
        bottomNavigationBar: ElevatedButton(
          onPressed: (){}, 
          style: ButtonStyle(
            shape: WidgetStateProperty.all<CircleBorder>(
              CircleBorder(
                side: BorderSide(color: Colors.green),
              ),
            ),
          ),
         child: Padding(
           padding: const EdgeInsets.all(12.0),
           child: const Text('Hello'),
         ),
         ),
      ),
      
    );
  }
}
