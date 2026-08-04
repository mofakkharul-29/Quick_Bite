import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final Provider<GoRouter> appRouterProvider = Provider((ref) {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      routes: [],
    );
  });
}
