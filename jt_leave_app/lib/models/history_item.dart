import 'package:isar_community/isar.dart';

part 'history_item.g.dart';

// Annotation for a Isar collection
@collection
class HistoryItem {
  Id id = Isar.autoIncrement;
  late int leaveCode;
  late String name;
  late DateTime submittedDate;
  late DateTime? fromDate;
  late DateTime? toDate;
  late int numOfDays;
  @enumerated
  late SubmitStatus status;

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

enum SubmitStatus { pending, approved }
