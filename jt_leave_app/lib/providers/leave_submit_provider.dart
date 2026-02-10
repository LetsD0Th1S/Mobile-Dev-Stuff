import 'dart:developer' as dev;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/providers/firebase_stream_provider.dart';

final userIntentProvider = FutureProvider<List<Map<String, dynamic>?>>((ref) async {
  final asyncData =  ref.watch(balanceListProvider);
  return asyncData.maybeWhen(data: (items) {
    return items.map((item) => {
      'key':item.leaveCode,
      'leave':item.leaveName
    }).toList();
  },
  orElse: () => [],);
});


final submitProvider = NotifierProvider<SubmitProvider, Map<String, dynamic>>(SubmitProvider.new);

class SubmitProvider extends Notifier<Map<String, dynamic>>{

  @override
  Map<String, dynamic> build() {
    final fetchLeaves = ref.watch(userIntentProvider);
      dev.log(fetchLeaves.toString());
      return {};
    }  

  void getType(String name){
    state = {
      ...state,
      'leaveType':name
    };
  }

    void getDates(DateTime submit, DateTime start, DateTime end){
    state = {
      ...state,
      'submitted': submit,
      'start': start,
      'end': end,
    };
  }

  }


