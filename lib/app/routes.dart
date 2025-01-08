import 'package:get/get.dart';
import 'package:workout/auth/login_screen.dart';
import 'package:workout/auth/main_screen.dart';
import 'package:workout/dashboard/dashboard_screen.dart';

class Routes {
  static const main = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';

  static final routes = [
    GetPage(name: main, page: () => const MainScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: dashboard, page: () => const DashboardScreen()),
  ];
}
