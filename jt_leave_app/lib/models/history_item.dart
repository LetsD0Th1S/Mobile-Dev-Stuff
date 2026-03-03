import 'package:isar_community/isar.dart';

part 'history_item.g.dart';

// Annotation for a Isar collection
@collection
class HistoryItem {
  Id id = Isar.autoIncrement;
  final int leaveCode;
  final String name;
  final DateTime submittedDate;
  final DateTime fromDate;
  final DateTime toDate;
  final int numOfDays;
  @enumerated
  final SubmitStatus status;

  HistoryItem({
    required this.leaveCode,
    required this.name,
    required this.submittedDate,
    required this.fromDate,
    required this.toDate,
    required this.numOfDays,
    this.status = SubmitStatus.pending,
  });
}

enum SubmitStatus { pending, done }
