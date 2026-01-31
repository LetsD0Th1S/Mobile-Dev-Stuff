
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white70,
          elevation: 3.0,
          shadowColor: Colors.grey,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'Times New Roman'),
          title: Center(
            child: const Text('Testing')),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
    );
  }
}