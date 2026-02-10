enum Filter {
  assets,
  work,
  gifts,
  donations
}

class IncomeItem {

  final String name;
  final double value;
  final Filter filter;

  IncomeItem({
    this.name = '',
    this.value = 0,
    this.filter = Filter.assets,
  });

  // Below we're constructing a method that allows us to replace the initial values. This will come in handly later on. :)
  IncomeItem copyWith({
    String? name,
    double? value,
    Filter? filter,
  }){
    return IncomeItem(
      name: name ?? this.name,
      value: value ?? this.value,
      filter: filter ?? this.filter,
    );
  }

}
