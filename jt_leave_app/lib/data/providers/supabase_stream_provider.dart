import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/balances/models/balance_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final activateCodeProvider = NotifierProvider<ActivateProvider, String>(
  ActivateProvider.new,
);

class ActivateProvider extends Notifier<String> {
  @override
  String build() {
    return '100';
  }

  void code(String giveCode) {
    state = giveCode;
  }
}

final callBalanceStream = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final codePassed = ref.watch(activateCodeProvider);

  return Supabase.instance.client
      .from("leave_balances")
      .stream(primaryKey: ['empcode'])
      .eq('empcode', codePassed);
});

final balanceListProvider = Provider<AsyncValue<List<BalanceItem>>>((ref) {
  final balanceSync = ref.watch(callBalanceStream);

  return balanceSync.whenData((rawData) {
    final data = rawData;
    // dev.log(data.toString());
    data.sort((a, b) => a['lvdescr'].compareTo(b['lvdescr']));
    return data.map((entry) {
      return BalanceItem(
        leaveCode: entry['lvcode'],
        leaveName: entry['lvdescr'],
        validTo: entry['validtodate'],
        entitlement: entry['entitlement'],
      );
    }).toList();
  });
});

final nameProvider = Provider<String>((ref) {
  final balanceSync = ref.watch(callBalanceStream);

  return balanceSync.when(
    data: (data) {
      if (data.isEmpty) return 'No name to load';

      final firstRow = data.first;
      return '${firstRow['name']} ${firstRow['surname']}';
    },
    loading: () => 'Loading...',
    error: (_, _) => 'Error loading name',
  );
});
