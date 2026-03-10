import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt_leave_app/UI/screens/history_screen.dart';
import 'package:jt_leave_app/UI/screens/balance_screen.dart';
import 'package:jt_leave_app/UI/screens/submit_screen.dart';
import 'package:jt_leave_app/UI/widgets/custom_app_bar.dart';
import 'package:jt_leave_app/UI/widgets/menu_drawer.dart';
import 'package:jt_leave_app/providers/firebase_stream_provider.dart';
import 'package:jt_leave_app/providers/tabs_provider.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstCode = ref.watch(tabsProvider);
    final nameOfEmp = ref.watch(nameProvider);

    final screensList = [
      SubmitScreen(),
      HomeScreen(theCode: '100', name: nameOfEmp),
      HistoryScreen(),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kTextTabBarHeight),
        child: CustomAppBar(selectedItem: firstCode),
      ),
      endDrawer: Container(
        margin: const .only(top: kToolbarHeight + 22),
        child: const MenuDrawer(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: .symmetric(vertical: BorderSide(color: Colors.grey)),
        ),
        child: SafeArea(
          child: NavigationBar(
            selectedIndex: firstCode,
            onDestinationSelected: (int value) {
              final result = ref.read(tabsProvider.notifier).setIndex(value);
              return result;
            },
            backgroundColor: Colors.transparent,
            indicatorColor: Colors.green[300],
            indicatorShape: CircleBorder(),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.arrow_circle_up, color: Colors.green),
                label: 'Submit',
                selectedIcon: Icon(Icons.arrow_drop_up),
              ),
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: Colors.green),
                label: 'Home',
                selectedIcon: Icon(Icons.home),
              ),
              NavigationDestination(
                icon: Icon(Icons.history_outlined, color: Colors.green),
                label: 'History',
                selectedIcon: Icon(Icons.history),
              ),
            ],
          ),
        ),
      ),
      body: screensList[firstCode],
    );
  }
}
