
enum ExpFilter{
  leisure,
  groceries,
  personal,
  business
}

class ExpenseItem {

  final String name;
  final String amount;
  final DateTime date;
  final ExpFilter filter;
  final bool isRecurring;


   ExpenseItem({
    DateTime? date,
    this.name = '',
    this.amount = '',
    this.filter = ExpFilter.personal,
    this.isRecurring = false,
  }) : date = date ?? DateTime.now(); // Need to use an initializer list if the default is non-constant

  ExpenseItem copyWith({
    String? name,
    String? amount,
    DateTime? date,
    ExpFilter? filter,
    bool? isRecurring,
  }){
    return ExpenseItem(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      filter: filter ?? this.filter,
      isRecurring: isRecurring ?? this.isRecurring,
    );
  }
  

}