import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:workout/core/model/exercise.dart';
import 'package:workout/core/model/plan.dart';
import 'package:workout/core/model/workout.dart';
import 'package:workout/core/util/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  void saveWorkout(Workout workout) async {
    final db = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    db.collection("users").doc(uid).set(workout.toJson()).onError((e, _) => throw Exception(e));
  }
}
