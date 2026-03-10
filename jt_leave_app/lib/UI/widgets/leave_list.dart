import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/UI/widgets/balance_grid_items_container.dart';
import 'package:jt_leave_app/providers/firebase_stream_provider.dart';
import 'package:intl/intl.dart';

class LeaveList extends ConsumerWidget {
  const LeaveList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balances = ref.watch(balanceListProvider);
    final dateFormatter = DateFormat.yMd();

    // Extracting stream data from firebase provider
    return balances.when(
      error: (e, _) => Center(child: Text('Error encountered: \n $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (balances) {
        if (balances.isEmpty) {
          return const Center(child: Text('No leave data loaded.'));
        }

        return GridView.count(
          childAspectRatio: 2,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 2,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: [
            for (int i = 0; i < balances.length; i++) ...[
              BalanceContainer(
                color: Colors.white,
                text: Text(
                  balances[i].leaveName.toString(),
                  textAlign: .center,
                ),
              ),
              BalanceContainer(
                color: Colors.white,
                text: Text(
                  balances[i].entitlement.toString(),
                  textAlign: .center,
                ),
              ),
              BalanceContainer(
                color: Colors.white,
                text: Text(
                  dateFormatter.format(balances[i].validTo).toString(),
                  textAlign: .center,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
