
import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final randomizer = Random(); // This variable is intended to generate the random number without adding additional memory use (by re-rendering the object/generator each time)
  var random = 2;

  void rollDice(){
    setState(() {
      random = randomizer.nextInt(6) + 1;
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-$random.png',
              width: 200,
            ),
            const SizedBox(height: 20,),
            TextButton(onPressed: 
            rollDice,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(top: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              ),
            ),
             
            child: const Text('Roll Dice'),
            ),
          ],
        );
  }
}