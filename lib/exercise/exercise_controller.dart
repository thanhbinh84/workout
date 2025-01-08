import 'package:get/get.dart';
import 'package:workout/core/controller/base_controller.dart';
import 'package:workout/core/model/exercise.dart';
import 'package:workout/core/repository/workout_repository.dart';

class ExerciseController extends BaseController {
  static ExerciseController get to => Get.find();
  final WorkoutRepository workoutRepository = Get.find<WorkoutRepository>();
  final exercise = Exercise().obs;

  @override
  onInit() {
    super.onInit();
    _getExercise();
    // _getExercise(name);
  }

  _getExercise() {
    exercise.value = Get.arguments;
    exercise.refresh();
  }

  _getSavedExercise(String name) async {
    try {
      loading();
      exercise.value = await workoutRepository.getExercise(name);
      exercise.refresh();
      success();
    } catch (e) {
      error(error: e.toString());
    }
  }
}
