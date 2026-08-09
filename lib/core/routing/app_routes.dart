import 'package:quick_bite/core/constants/route_names.dart';
import 'package:quick_bite/core/constants/route_paths.dart';
import 'package:quick_bite/core/routing/app_route_config.dart';
import 'package:quick_bite/core/routing/route_access.dart';
import 'package:quick_bite/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:quick_bite/features/auth/presentation/screens/login_screen.dart';
import 'package:quick_bite/features/auth/presentation/screens/register_screen.dart';
import 'package:quick_bite/features/splash/presentation/splash_screen.dart';
import 'package:quick_bite/features/restaurants/presentation/home_screen.dart';

const List<AppRouteConfig> appRoutes = [
  AppRouteConfig(
    path: splashPath,
    name: splashName,
    access: RouteAccess.public,
    page: SplashScreen(),
  ),
  AppRouteConfig(
    path: registerPath,
    name: registerName,
    access: RouteAccess.public,
    page: RegisterScreen(),
  ),
  AppRouteConfig(
    path: loginPath,
    name: loginName,
    access: RouteAccess.public,
    page: LoginScreen(),
  ),
  AppRouteConfig(
    path: forgotPasswordPath,
    name: forgotPasswordName,
    access: RouteAccess.public,
    page: ForgotPasswordScreen(),
  ),
  AppRouteConfig(
    path: homePath,
    name: homeName,
    access: RouteAccess.authenticated,
    page: HomeScreen(),
  ),
];
