import 'package:get/get.dart';
import 'package:workout/app/routes.dart';
import 'package:workout/core/controller/base_controller.dart';
import 'package:workout/core/model/exercise.dart';
import 'package:workout/core/model/workout.dart';
import 'package:workout/core/repository/workout_repository.dart';

class ExerciseController extends BaseController {
  static ExerciseController get to => Get.find();
  final WorkoutRepository workoutRepository = Get.find<WorkoutRepository>();
  final exercise = Exercise().obs;

  @override
  onInit() {
    super.onInit();
    _getExercise();
  }

  _getExercise() {
    exercise.value = Get.arguments;
    exercise.refresh();
  }

  startWorkout() async {
    try {
      Workout workout = Workout(
          sets: 1,
          weight: exercise.value.weight,
          reps: exercise.value.reps,
          exercise: exercise.value);
      Get.offNamed(Routes.workout, arguments: workout);
    } catch (e) {
      error(error: e.toString());
    }
  }
}