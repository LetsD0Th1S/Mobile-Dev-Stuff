import 'package:budget_tracking_app/features/feature1/data/models/income_item.dart';
import 'package:riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final incomeProvider = StateNotifierProvider<IncomeNotifier, List<IncomeItem>>(
  (ref) => IncomeNotifier(),
);

class IncomeNotifier extends StateNotifier<List<IncomeItem>>{
  IncomeNotifier() : super([]);

  // the state variable we add in the methods below is a "single source of truth".
  // Updating a state = new list
  // Widgets don't call setstate any longer

  void add() {
    state = [...state, IncomeItem()];
  }

  void remove(int index){
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }

  void updateName(int index, String newName) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(name: newName)
        else
          state[i]
    ];
  }

  void updateValue(int index, double newValue){
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(value: newValue)
        else
          state[i]
    ];
  }

  void updateFilter(int index, Filter newFilter){
    state = [
    for (int i = 0; i < state.length; i++)
      if (i == index)
        state[i].copyWith(filter: newFilter)
      else
        state[i]
    ];
  }
}

// This is derived state -> Deriving from the incomeProvider state
final totalIncomeProvider = Provider<double>((ref){
  final items = ref.watch(incomeProvider);

  return items.fold<double>(
    0, (sum, item) => sum + item.value,
    );
},);