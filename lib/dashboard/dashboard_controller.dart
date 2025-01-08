import 'package:get/get.dart';
import 'package:workout/core/controller/base_controller.dart';
import 'package:workout/core/model/plan.dart';
import 'package:workout/core/repository/workout_repository.dart';

class DashboardController extends BaseController {
  static DashboardController get to => Get.find();
  final WorkoutRepository workoutRepository = Get.find<WorkoutRepository>();
  final plan = Plan.empty().obs;

  @override
  onInit() {
    super.onInit();
    _getPlan();
  }

  _getPlan() async {
    try {
      loading();
      plan.value = await workoutRepository.getPlan();
      plan.refresh();
      success();
    } catch (e) {
      error(error: e.toString());
    }
  }
}
