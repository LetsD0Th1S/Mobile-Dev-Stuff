import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/data/providers/supabase_stream_provider.dart';
import 'package:jt_leave_app/history_results/models/history_item.dart';

final userIntentProvider = FutureProvider<List<Map<String, dynamic>?>>((
  ref,
) async {
  final asyncData = ref.watch(balanceListProvider);
  return asyncData.maybeWhen(
    data: (items) {
      return items
          .map((item) => {'key': item.leaveCode, 'leave': item.leaveName})
          .toList();
    },
    orElse: () => [],
  );
});

final submitProvider = NotifierProvider<SubmitProvider, Map<String, dynamic>>(
  SubmitProvider.new,
);

class SubmitProvider extends Notifier<Map<String, dynamic>> {
  @override
  Map<String, dynamic> build() {
    // final fetchLeaves = ref.watch(userIntentProvider);
    // dev.log('Found leave items from future provider...');
    return {};
  }

  void getType(String name, int leaveCode) {
    state = {...state, 'code': leaveCode, 'leaveType': name};
  }

  // void setDates(DateTime submit, DateTime start, DateTime end, int leaveDays) {
  //   state = {...state, 'submitted': submit, 'start': start, 'end': end, 'leaveDays': leaveDays};
  // }
  void setDates(DateTime submitted, DateTime? start, DateTime? end, int days) {
    state = {
      ...state,
      'submitted': submitted,
      'start': start,
      'end': end,
      'leaveDays': days,
    };
  }

  void setAll(
    HistoryItem item,
    // int code,
    // String name,
    // DateTime submitted,
    // DateTime? start,
    // DateTime? end,
    // int days,
  ) {
    state = {
      'code': item.leaveCode,
      'leaveType': item.name,
      'submitted': item.submittedDate,
      'start': item.fromDate,
      'end': item.toDate,
      'leaveDays': item.numOfDays,
      'status': item.status,
    };
  }
}

final leaveListProvider = Provider<List<Map<String, dynamic>>>((ref) {
  final rawData = ref.watch(userIntentProvider);
  final leaveItems = rawData.maybeWhen(
    data: (items) {
      final map = <String, String>{};

      for (var item in items) {
        map[item!['key'].toString()] = item['leave'];
      }

      return map.entries
          .map((item) => {'code': item.key, 'name': item.value})
          .toList();
    },
    orElse: () => <Map<String, String>>[],
  );
  return leaveItems;
});
