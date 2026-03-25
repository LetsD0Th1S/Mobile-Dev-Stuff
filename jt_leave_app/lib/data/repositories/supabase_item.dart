class SupabaseItem {
  SupabaseItem({
    required this.id,
    required this.empNr,
    required this.start,
    required this.end,
    required this.leaveName,
    required this.comment,
  });

  final int id;
  final String empNr;
  final DateTime start;
  final DateTime end;
  final String leaveName;
  final String comment;
}
