import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/providers/leave_submit_provider.dart';
import 'dart:developer' as dev;

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submitted = ref.watch(submitProvider);
    dev.log(submitted.toString());
    return Column(
      children: [],
      // submitted.map((item.value){
      //   return Card(
      //     margin: .all(10),
      //     child:Row(
      //       mainAxisAlignment: .spaceEvenly,
      //       children: [
      //         Text(value["submitted"]),
      //         Text(value["start"]),
      //         Text(value["end"]),
      //       ],
      //     ),
      //   );},).toList(),
    );
  }
}
