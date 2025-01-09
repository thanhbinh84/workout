import 'dart:math';
import 'package:workout/core/model/exercise.dart';

class Workout {
  static const e = 2.71828;

  int sets = 0;
  int weight = 0;
  int reps = 0;
  Exercise exercise;

  Workout({this.sets = 0, this.weight = 0, this.reps = 0, required this.exercise});

  // use the “Mayhew et Al.” formula: https://en.wikipedia.org/wiki/One-repetition_maximum#:~:text=0.10-,Mayhew%20et%20al.,-%F0%9D%91%A4
  double get oneRepMax {
    return 1 * weight / (0.522 + (0.419 * pow(e, -0.055 * reps)));
  }

  get setDisplay => '$sets/${exercise.sets}';

  bool get isLastSet => sets == exercise.sets;

  static const keySets = 'sets';
  static const keyWeight = 'weight';
  static const keyReps = 'reps';
  static const keyExerciseName = 'exerciseName';

  Map<String, dynamic> toJson() => <String, dynamic>{
        keySets: sets,
        keyWeight: weight,
        keyReps: reps,
        keyExerciseName: exercise.name
      };
}
