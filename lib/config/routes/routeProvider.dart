import 'package:go_router/go_router.dart';

import 'package:riverpod/riverpod.dart';
import 'package:todolist/config/routes/app_routes.dart';
import 'package:todolist/config/routes/route_location.dart';

final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: RouteLocation.home,
      navigatorKey: navigationkey,
      routes: appRoutes);
});
