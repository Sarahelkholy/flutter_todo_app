import 'package:flutter/material.dart';
import 'package:todolist/utils/extentions.dart';

class DisplayWhite extends StatelessWidget {
  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;

  DisplayWhite({required this.text, this.fontsize, this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
          color: context.colorScheme.surface,
          fontSize: fontsize,
          fontWeight: fontWeight),
    );
  }
}
