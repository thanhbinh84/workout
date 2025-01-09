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
  Workout? savedWorkout;
  final hasSavedWorkout = false.obs;

  @override
  onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() async {
    try {
      loading();
      _getExercise();
      await _getSavedWorkout();
      success();
    } catch (e) {
      error();
    }
  }

  _getExercise() {
    exercise.value = Get.arguments;
    exercise.refresh();
  }

  _getSavedWorkout() async {
    savedWorkout = await workoutRepository.getSavedWorkoutForExercise(exercise.value.name);
    hasSavedWorkout.value = savedWorkout != null;
  }

  startWorkout() {
    final newWorkout = Workout(
        sets: 1,
        weight: exercise.value.weight,
        reps: exercise.value.reps,
        exercise: exercise.value);
    Get.offNamed(Routes.workout, arguments: newWorkout);
  }

  resumeWorkout() {
    Get.offNamed(Routes.workout, arguments: savedWorkout);
  }
}
