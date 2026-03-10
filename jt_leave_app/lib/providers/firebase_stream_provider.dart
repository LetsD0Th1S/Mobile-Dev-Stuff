import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/models/balance_item.dart';

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

final callBalanceStream =
    StreamProvider<DocumentSnapshot<Map<String, dynamic>>>((ref) {
      final codePassed = ref.watch(activateCodeProvider);

      return FirebaseFirestore.instance
          .collection('employees')
          .doc(codePassed)
          .snapshots();
    });

final balanceListProvider = Provider<AsyncValue<List<BalanceItem>>>((ref) {
  final balanceSync = ref.watch(callBalanceStream);

  return balanceSync.whenData((doc) {
    final data = doc.data();
    if (data == null) return [];

    final rawBalances = data['leaveBalances'];
    if (rawBalances == null || rawBalances is! Map<String, dynamic>) {
      return [];
    }

    return rawBalances.entries.map((entry) {
      return BalanceItem.fromMap(
        leaveCode: entry.key,
        map: entry.value as Map<String, dynamic>,
      );
    }).toList();
  });
});

final nameProvider = Provider<String>((ref) {
  final balanceSync = ref.watch(callBalanceStream);
  String returnName = 'No name';
  balanceSync.whenData((data) {
    final results = data.data();

    if (results != null) {
      returnName = "${results['firstName']} ${results["lastName"]}";
    }
  });
  return returnName;
});
