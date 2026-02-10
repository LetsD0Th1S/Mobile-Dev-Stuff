
import 'package:flutter/material.dart';
import 'package:jt_leave_app/UI/widgets/balance_list_headers.dart';
import 'package:jt_leave_app/UI/widgets/jt_leave_homescreen_container.dart';
import 'package:jt_leave_app/UI/widgets/leave_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.theCode});

  final String theCode;
  final navBarHeight = kToolbarHeight;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body:Column(
          crossAxisAlignment:.center,
          children: [
            const JtLeaveHomescreenContainer(),
            const SizedBox(height: 30),
            const Text(
              'Welcome,',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.grey,
              ),
            ),
            Text(
              'Name of peep',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(
                border: BoxBorder.fromLTRB(
                  bottom: const BorderSide(
                    color: Color.fromARGB(255, 150, 175, 188),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Current Available Balances',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: .all(8),
              padding: .only(left: 8, right: 8, bottom: 20),
              height: 500 - navBarHeight,
              decoration: BoxDecoration(
                borderRadius:const .all(.circular(25)),
                color: Theme.of(context).colorScheme.primaryContainer.withAlpha(200),
              ),
              child: Column(
                children: const [
                  SizedBox(
                    height: 60,
                    child: BalanceHeaders()),
                  SizedBox(
                    height: 360,
                    child: LeaveList()),
                ],
              )),
          ],
                      ),);
  }
}
