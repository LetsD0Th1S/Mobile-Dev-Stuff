
enum SubmitStatus {
  pending,
  done
}

class HistoryItem {
  final int leaveCode;
  final String name;
  final DateTime submittedDate;
  final DateTime fromDate;
  final DateTime toDate;
  final int numOfDays;
  final SubmitStatus status;

  HistoryItem({
    required this.leaveCode,
    required this.name,
    required this.submittedDate,
    required this.fromDate,
    required this.toDate,
    required this.numOfDays,
    required this.status
  });
}