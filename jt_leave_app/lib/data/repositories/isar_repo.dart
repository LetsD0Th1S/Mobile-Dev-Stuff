import 'package:isar_community/isar.dart';
import 'package:jt_leave_app/history_results/models/history_item.dart';

class HistoryRepo {
  final Isar isar;

  HistoryRepo(this.isar);

  Future<void> addItem(HistoryItem item) async {
    await isar.writeTxn(() async {
      await isar.historyItems.put(item);
    });
  }

  Future<void> removeItem(int id) async {
    await isar.writeTxn(() async {
      final removed = await isar.historyItems.delete(id);
      return removed;
    });
  }

  Future<List<HistoryItem>> getAll() async {
    return await isar.historyItems.where().sortBySubmittedDateDesc().findAll();
  }

  Future<void> removeAll() async {
    await isar.writeTxn(() async => await isar.historyItems.clear());
  }
}
