import 'package:get/get.dart';
import 'package:workout/auth/login_controller.dart';
import 'package:workout/auth/login_screen.dart';
import 'package:workout/auth/main_screen.dart';
import 'package:workout/dashboard/dashboard_controller.dart';
import 'package:workout/dashboard/dashboard_screen.dart';
import 'package:workout/exercise/exercise_controller.dart';
import 'package:workout/exercise/exercise_screen.dart';
import 'package:workout/workout/workout_controller.dart';
import 'package:workout/workout/workout_screen.dart';

class Routes {
  static const main = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const exercise = '/exercise';
  static const workout = '/workout';

  static final routes = [
    GetPage(name: main, page: () => const MainScreen()),
    GetPage(name: login, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: dashboard, page: () => const DashboardScreen(), binding: DashboardBinding()),
    GetPage(name: exercise, page: () => const ExerciseScreen(), binding: ExerciseBinding()),
    GetPage(name: workout, page: () => const WorkoutScreen(), binding: WorkoutBinding()),
  ];
}

class WorkoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutController>(() => WorkoutController());
  }
}

class ExerciseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExerciseController>(() => ExerciseController());
  }
}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
