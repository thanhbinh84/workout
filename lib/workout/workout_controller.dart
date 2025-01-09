import 'dart:async';

import 'package:get/get.dart';
import 'package:workout/core/controller/base_controller.dart';
import 'package:workout/core/model/workout.dart';
import 'package:workout/core/repository/workout_repository.dart';

class WorkoutController extends BaseController {
  static WorkoutController get to => Get.find();
  final WorkoutRepository workoutRepository = Get.find<WorkoutRepository>();
  late Rx<Workout> workout;
  final counter = 0.obs;

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

  Timer? _timer;

  breakNow() {
    counter.value = workout.value.exercise.breakSecond;
    counter.value = 5;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (counter.value == 1) {
          Get.back();
          workout.value.sets++;
          workout.refresh();
        } else {
          counter.value--;
          counter.refresh();
        }
      },
    );
  }

  cancelBreak() {
    _timer?.cancel();
  }

  finishWorkout() {
    Get.back();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
