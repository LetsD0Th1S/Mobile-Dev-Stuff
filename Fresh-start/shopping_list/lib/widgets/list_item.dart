import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.givenColor, required this.givenName, required this.itemCount});

  final Color givenColor;
  final String givenName;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Container(height: 22, width: 22, color: givenColor,),
        SizedBox(width: 26,),
        Text(givenName),
        Spacer(),
        Text(itemCount.toString(), textAlign: .end,),
        SizedBox(height: 22,),
      ],
    );
  }
}