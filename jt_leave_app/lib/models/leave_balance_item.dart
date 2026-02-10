
class BalanceItem {
  final int leaveCode;
  final String leaveName;
  final DateTime validTo;
  final double entitlement;

  BalanceItem({
    required this.leaveCode,
    required this.leaveName,
    required this.validTo,
    required this.entitlement,
  });

  factory BalanceItem.fromMap({
    required String leaveCode,
    required Map<String, dynamic> map,
  }) {
    return BalanceItem(
      leaveCode: int.parse(leaveCode),
      leaveName: map['leaveName'] as String? ?? '',
      validTo: DateTime.parse(map['validTo'] as String),
      entitlement: map['entitlement'] as double? ?? 0,
    );
  }
}
