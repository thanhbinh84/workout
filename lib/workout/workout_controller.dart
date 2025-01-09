import 'package:get/get.dart';
import 'package:workout/core/controller/base_controller.dart';
import 'package:workout/core/model/workout.dart';
import 'package:workout/core/repository/workout_repository.dart';

class WorkoutController extends BaseController {
  static WorkoutController get to => Get.find();
  final WorkoutRepository workoutRepository = Get.find<WorkoutRepository>();
  late Rx<Workout> workout;

  @override
  onInit() {
    super.onInit();
    _getWorkout();
  }

  _getWorkout() {
    workout = Rx<Workout>(Get.arguments);
    workout.refresh();
  }

  updateWeightRepsValue({String? weight, String? reps}) {
    try {
      if (weight != null) {
        workout.value.weight = int.tryParse(weight) ?? 0;
      }
      if (reps != null) {
        workout.value.reps = int.tryParse(reps) ?? 0;
      }
      workout.refresh();
    } catch (e) {
      error(error: e.toString());
    }
  }
}
