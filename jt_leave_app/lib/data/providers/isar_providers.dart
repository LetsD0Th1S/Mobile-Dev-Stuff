import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:jt_leave_app/ui/history_results/models/history_item.dart';
import 'package:jt_leave_app/data/repositories/isar_repo.dart';
import 'package:jt_leave_app/data/providers/leave_submit_provider.dart';
import 'package:jt_leave_app/data/providers/api_submit_provider.dart';

// Below provider is overridden from the main dart file
final isarProvider = Provider<Isar>((ref) => throw UnimplementedError());

// This provider uses the argument that was passed in the main dart file, where we initialize Isar. This allows us to use it in state
// as found further below.
final historyRepoProvider = Provider<HistoryRepo>((ref) {
  final isar = ref.watch(isarProvider);
  return HistoryRepo(isar);
});

final submitActionProvider = AsyncNotifierProvider<SubmitAction, void>(
  SubmitAction.new,
);

class SubmitAction extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  FutureOr<void> remove(int id) async {
    final repo = ref.watch(historyRepoProvider);

    state = const AsyncLoading();
    repo.removeItem(id);
    ref.invalidate(
      historyListProvider,
    ); // Triggers a rebuild so that the UI state stays up to date with the changes
    state = const AsyncData(null);
  }

  FutureOr<void> submit() async {
    final repo = ref.watch(historyRepoProvider);
    final data = ref.watch(submitProvider);
    final submit = ref.read(submitAPIProvider.notifier);

    // Validating if there is data
    bool isValid(Map<String, dynamic> data) {
      return data.containsKey('code') &&
          data.containsKey('leaveType') &&
          data.containsKey('submitted') &&
          data.containsKey('start') &&
          data.containsKey('end') &&
          data.containsKey('leaveDays');
    }

    if (!isValid(data)) {
      throw Exception('Missing the required submission data for Isar');
    }

    final item = HistoryItem(
      leaveCode: data['code'],
      name: data['leaveType'],
      submittedDate: data['submitted'],
      fromDate: data['start'],
      toDate: data['end'],
      numOfDays: (data['leaveDays'] as int?) ?? 0,
    );

    //save to Isar
    //This advises riverpod that we're busy with something and that it should wait. UI watching will rebuild and show loading state (if implemented)
    state = const AsyncLoading();
    // Await is important here to ensure we wait for the db write to complete
    await repo.addItem(item);
    await submit.pushToDB(item);
    ref.invalidate(
      historyListProvider,
    ); // Triggers a rebuild so that the UI state stays up to date with the changes
    // Says operation is complete and successful. null is the value before we start, and after we finish.
    state = const AsyncData(null);
  }
}

final historyListProvider = FutureProvider<List<HistoryItem>>((ref) {
  final repo = ref.watch(historyRepoProvider);
  return repo.getAll();
});

final historyRemoveProvider = FutureProvider<void>((ref) {
  final repo = ref.watch(historyRepoProvider);
  repo.removeAll();
  ref.invalidate(historyListProvider);
});
