import 'package:flutter/material.dart';
import 'package:todolist/utils/extentions.dart';

class CommonContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  CommonContainer({this.child, this.height});

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return Container(
        width: deviceSize.width,
        height: height,
        decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }
}
