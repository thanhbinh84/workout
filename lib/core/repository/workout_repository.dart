import 'package:get/get.dart';
import 'package:workout/core/model/plan.dart';
import 'package:workout/core/util/utils.dart';

class WorkoutRepository extends GetxService {

  Future<Plan> getPlan() async {
    Map<String, dynamic> map = await Utils.parseJsonFromAssets('assets/plan.json');
    Plan plan = Plan.fromJson(map);
    return plan;
  }
}
