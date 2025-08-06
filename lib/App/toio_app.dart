import 'package:flutter/material.dart';
import 'package:todolist/config/Theme/Theme_app.dart';
import 'package:todolist/config/routes/routeProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TOIOAPP extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: APPTheme.light,
      routerConfig: routeConfig,
    );
  }
}
