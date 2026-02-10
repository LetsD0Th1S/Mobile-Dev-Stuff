import 'package:budget_tracking_app/features/feature1/data/models/expense_item.dart';
import 'package:riverpod/legacy.dart';

final expenseProvider = StateNotifierProvider<ExpenseNotifier, List<ExpenseItem>>(
  (ref)=> ExpenseNotifier(),
);

class ExpenseNotifier extends StateNotifier<List<ExpenseItem>>{
  ExpenseNotifier() : super([]);

  
  void add(){
    state = [...state, ExpenseItem()];
  }

  void remove(int index){
    // In case you forget, each method here technically creates a new list. So the remove method simply ensures we don't include
    // the widget that we're trying to remove :).
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
     ];
  }

  void changeName(int index, String newName){
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
        state[index].copyWith(
          name: newName,
          )
        else
          state[i]
    ];
  }

  void changeAmount(int index, String amount){
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(
            amount: amount
          )
        else
          state[i]
    ];
  }

  void setRecur(int index){
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          if (state[i].isRecurring == false)
            state[i].copyWith(
              isRecurring: true
            )
          else
            state[i].copyWith(
              isRecurring: false
            )
        else
          state[i]
    ];
  }

  void setFilterChange(int index, ExpFilter filter){
    state = [
            for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(
            filter: filter
          )
        else
          state[i]
    ];
  }

  void setExpiry(int index, DateTime date){
    state = [
            for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(
            date: date
          )
        else
          state[i] 
    ];
  }
}