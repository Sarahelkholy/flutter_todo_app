import 'package:flutter/material.dart';
class CircleContainer extends StatelessWidget {
  final Color color;
  final Widget child;
   CircleContainer({required this.color,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
              width: 2,
              color: color
          )
      ),
      child:Center(
          child:child),

    );
  }
}
