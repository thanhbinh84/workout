import 'package:get/get.dart';
import 'package:workout/core/model/exercise.dart';
import 'package:workout/core/model/plan.dart';
import 'package:workout/core/util/utils.dart';

class WorkoutRepository extends GetxService {
  Plan? plan;

  Future<Plan> getPlan() async {
    if (plan == null) {
      Map<String, dynamic> map = await Utils.parseJsonFromAssets('assets/plan.json');
      plan = Plan.fromJson(map);
    }
    return plan!;
  }

  Future<Exercise> getExercise(String name) async {
    final exercise = (await getPlan()).exercises;
    return exercise.firstWhere((e) => e.name == name);
  }
}
