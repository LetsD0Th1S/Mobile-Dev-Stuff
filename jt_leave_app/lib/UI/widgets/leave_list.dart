import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jt_leave_app/data/leave_data.dart';

class LeaveList extends StatefulWidget {
  const LeaveList({super.key});

  @override
  State<LeaveList> createState() => _LeaveListState();
}

class _LeaveListState extends State<LeaveList> {
  final List<Map<String, Object>> leave_data = leaveBalances.where((value) => value.keys.contains('leave')).toList();
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: 
          leave_data.map((data){
            print(data);
                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Theme.of(context).scaffoldBackgroundColor))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                    ],),
                  );
                }
                ).toList(),
              
            ),
    );
          }

  }
