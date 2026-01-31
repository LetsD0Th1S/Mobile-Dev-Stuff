import 'package:budget_tracking_app/features/feature1/UI/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(
    // To use the providers of riverpod, we must wrap the entire application in ProviderScope widget.
    ProviderScope(
      child: const MainApp()
      ),
      );
}

// Then, we extend the MainApp class to the ConsumerWidget instead of StatelessWidget
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsScreen()
    );
  }
}
