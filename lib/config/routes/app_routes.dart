import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/Screens/CreatTask.dart';
import 'package:todolist/Screens/HomeScreen.dart';
import 'package:todolist/config/routes/route_location.dart';

final navigationkey = GlobalKey<NavigatorState>();
final appRoutes = [
  GoRoute(
      path: RouteLocation.home,
      parentNavigatorKey: navigationkey,
      builder: HomeScreen.builder),
  GoRoute(
      path: RouteLocation.creatTask,
      parentNavigatorKey: navigationkey,
      builder: CreatTaskScreen.builder)
];
