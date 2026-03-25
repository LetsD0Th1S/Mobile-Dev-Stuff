import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeChangeProvider = NotifierProvider<ThemeChangeProvider, bool>(
  ThemeChangeProvider.new,
);

class ThemeChangeProvider extends Notifier<bool> {
  @override
  bool build() {
    state = false;
    return state;
  }

  void toggle(bool value) {
    state = value;
  }
}
