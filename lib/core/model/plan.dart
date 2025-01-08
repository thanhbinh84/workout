import 'package:workout/core/model/exercise.dart';

class Plan {
  String name = '';
  int duration = 0;
  String category = '';
  List<Exercise> exercises = [];

  Plan(this.name, this.exercises, this.duration, this.category);

  factory Plan.empty() => Plan('', [], 0, '');

  static const keyName = 'name';
  static const keyDuration = 'duration';
  static const keyCategory = 'category';
  static const keyExercises = 'exercises';

  Plan.fromJson(Map<String, dynamic> map) {
    name = map[keyName];
    exercises = (map[keyExercises] as List).map<Exercise>((e) => Exercise.fromJson(e)).toList();
    category = map[keyCategory];
    duration = map[keyDuration];
  }

  @override
  String toString() {
    return "$exercises-$name";
  }
}
