import 'package:flutter/material.dart';

extension BuildContextExtentions on BuildContext{
  ThemeData get _theme=>Theme.of(this);
  TextTheme get textTheme=>_theme.textTheme;
  ColorScheme get colorScheme=>_theme.colorScheme;
  get deviceSize=>MediaQuery.of(this).size;


}