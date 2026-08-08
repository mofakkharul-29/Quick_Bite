import 'package:flutter/widgets.dart';
import 'package:quick_bite/core/routing/route_access.dart';

class AppRouteConfig {
  final String path;
  final String name;
  final RouteAccess access;
  final Widget page;

  const AppRouteConfig({
    required this.path,
    required this.name,
    required this.access,
    required this.page,
  });
}
