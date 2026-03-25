import 'dart:developer' as dev;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/ui/history_results/models/history_item.dart';
import 'package:jt_leave_app/data/repositories/supabase_item.dart';
import 'package:jt_leave_app/data/providers/supabase_stream_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final submitAPIProvider =
    NotifierProvider<SubmitAPIProvider, Map<String, dynamic>>(
      SubmitAPIProvider.new,
    );

class SubmitAPIProvider extends Notifier<Map<String, dynamic>> {
  @override
  Map<String, dynamic> build() {
    final getEmp = ref.watch(callBalanceStream);
    final getRes = getEmp.maybeWhen(
      data: (data) {
        final first = data[0];
        final empNum = first['emplid'];
        return empNum;
      },
      orElse: () => "no code",
    );
    return {'emp_num': getRes};
  }

  Future<void> pushToDB(HistoryItem item) async {
    final results = SupabaseItem(
      id: item.id,
      empNr: state['emp_num'],
      start: item.fromDate!,
      end: item.toDate!,
      leaveName: item.name,
      comment: 'Temp',
    );

    await Supabase.instance.client.from('leave_submissions').insert({
      'id': results.id,
      'emp_num': results.empNr,
      'start': results.start.toIso8601String(),
      'end': results.end.toIso8601String(),
      'leave_name': results.leaveName,
      'comment': results.comment,
    });
  }

  Future<int> removeItem(int index) async {
    try {
      await Supabase.instance.client
          .from('leave_submissions')
          .delete()
          .eq('id', index);
      return 1;
    } catch (e) {
      dev.log('Couldn\'t remove item as required: Reason: $e');
      return 0;
    }
  }

  Future<int> removeAll() async {
    try {
      await Supabase.instance.client
          .from('leave_submissions')
          .delete()
          .neq("id", 0);
      return 1;
    } catch (e) {
      dev.log(e.toString());
      return 0;
    }
  }
}
