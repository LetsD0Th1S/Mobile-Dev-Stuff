import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabsProvider = NotifierProvider<TabsProvider, int>(TabsProvider.new);

class TabsProvider extends Notifier<int> {
  @override
  int build() {
    return 1;
  }

  void setIndex(int index){
    state = index;
  }
}