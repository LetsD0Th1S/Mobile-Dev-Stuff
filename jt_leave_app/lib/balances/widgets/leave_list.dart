import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/data/providers/api_submit_provider.dart';
import 'package:jt_leave_app/data/providers/supabase_stream_provider.dart';
import 'package:jt_leave_app/balances/widgets/balance_container.dart';

class LeaveList extends ConsumerWidget {
  const LeaveList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balances = ref.watch(balanceListProvider);
    ref.watch(submitAPIProvider);
    // final dateFormatter = DateFormat.yMd();

    // Extracting stream data from supabase provider
    return balances.when(
      error: (e, _) => Center(child: Text('Error encountered: \n $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (balances) {
        if (balances.isEmpty) {
          return const Center(child: Text('No leave data loaded.'));
        }

        return GridView.count(
          padding: .symmetric(horizontal: 4),
          childAspectRatio: 2,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 2,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: [
            for (int i = 0; i < balances.length; i++) ...[
              BalanceContainer(
                color: Theme.of(context).primaryColor,
                text: Text(
                  overflow: .visible,
                  balances[i].leaveName.toString(),
                  textAlign: .center,
                ),
              ),
              BalanceContainer(
                color: Theme.of(context).primaryColor,
                text: Text(
                  balances[i].entitlement.toString(),
                  textAlign: .center,
                ),
              ),
              BalanceContainer(
                color: Theme.of(context).primaryColor,
                text: Text(
                  // dateFormatter.format(balances[i].validTo),
                  balances[i].validTo,
                  textAlign: .center,
                ),
              ),
            ],
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
