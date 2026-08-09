import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_bite/core/constants/route_paths.dart';
import 'package:quick_bite/core/routing/app_route_config.dart';
import 'package:quick_bite/core/routing/app_routes.dart';
import 'package:quick_bite/core/routing/route_access.dart';
import 'package:quick_bite/features/auth/providers/auth_state_provider.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final Provider<GoRouter> appRouterProvider = Provider<GoRouter>((ref) {
    final authState = ref.watch(authStateProvider);

    return GoRouter(
      initialLocation: splashPath,

      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        final location = state.matchedLocation;

        if (authState.isLoading && location != splashPath) {
          return splashPath;
        }

        final AppRouteConfig? currentRoute = appRoutes.firstWhereOrNull(
          (e) => e.path == location,
        );

        if (currentRoute == null) return null;

        final RouteAccess access = currentRoute.access;

        if (authState.value == AppAuthState.unauthenticated &&
            location == splashPath) {
          return loginPath;
        }

        if (authState.value == AppAuthState.unauthenticated &&
            access == RouteAccess.authenticated) {
          return loginPath;
        }

        if(authState.value == AppAuthState.authenticated && location == splashPath) {
          return homePath;
        }

        if(authState.value == AppAuthState.authenticated && access == RouteAccess.public) {
          return homePath;
        }

        return null;
      },
      routes: appRoutes
          .map<GoRoute>(
            (AppRouteConfig route) => GoRoute(
              path: route.path,
              name: route.name,
              builder: (BuildContext context, GoRouterState state) =>
                  route.page,
            ),
          )
          .toList(),
    );
  });
}
