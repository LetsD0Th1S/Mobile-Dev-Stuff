import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> _submitted = [
    {
      "leave_name": "Annual",
    "taken": "2",
    "submitted": "2026-01-29"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _submitted.map((value){
          return Card(
            child:Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                Text(value["leave_name"]),
                Text(value["taken"]),
                Text(value["submitted"])
              ],
            ),
          );},).toList(),
    );
  }
}