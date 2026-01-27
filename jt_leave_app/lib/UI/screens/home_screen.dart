import 'package:flutter/material.dart';
import 'package:jt_leave_app/UI/widgets/leave_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            const Text(
              'Welcome,',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.grey,
              ),
            ),
            Text('Julian Dude', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
            Container(
              height: 20,
              decoration: BoxDecoration(
                border:  BoxBorder.fromLTRB(
                  bottom: const BorderSide(color: Color.fromARGB(255, 150, 175, 188)),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text('Current balances', style: TextStyle(fontWeight: FontWeight.bold),),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 236, 236),
                    border: BoxBorder.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.black), BoxShadow(color: Colors.black)]
                  ),
                  child: LeaveList()),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
