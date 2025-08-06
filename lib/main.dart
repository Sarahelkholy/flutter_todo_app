// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:todolist/App/toio_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: TOIOAPP(),
    ),
  );
}
