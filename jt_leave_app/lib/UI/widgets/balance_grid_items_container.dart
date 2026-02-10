
import 'package:flutter/material.dart';

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({super.key,
  this.color,
  this.rad,
  required this.text});


  final Color? color;
  final Text text;
  final BorderRadius? rad;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      alignment: AlignmentGeometry.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: rad,
      ),
      child: text,
    );
  }
}
