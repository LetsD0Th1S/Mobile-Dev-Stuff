import 'package:budget_tracking_app/features/feature1/UI/screens/expenses_screen.dart';
import 'package:budget_tracking_app/features/feature1/UI/screens/homescreen.dart';
import 'package:budget_tracking_app/features/feature1/UI/screens/income_screen.dart';
import 'package:budget_tracking_app/features/feature1/UI/widgets/appbar.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: MyAppBar()),
        body: DefaultTabController(
          length: 3,
          initialIndex: 2, 
          child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Income',),
                Tab(text: 'Home',),
                Tab(text: 'Expenses',),
            ],
            ),
            Divider(),
            Expanded(
              child: TabBarView(children: const[
                IncomeScreen(),
                Homescreen(),
                ExpensesScreen(),
              ]),
            ),
          ],
        ),
        ),
      );
  }
}