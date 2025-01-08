import 'package:workout/core/model/exercise.dart';

class Plan {
  String name = '';
  List<Exercise> exercises = [];
  
  Plan(this.name, this.exercises);

  static const keyName = 'name';
  static const keyExercises = 'exercises';

  Plan.fromJson(Map<String, dynamic> map) {
    name = map[keyName];
    exercises = map[keyExercises].entries.map( (entry) => Exercise.fromJson(entry)).toList();
  }

  @override
  String toString() {
    return "$exercises-$name";
  }
}
