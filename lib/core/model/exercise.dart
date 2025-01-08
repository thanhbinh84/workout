class Exercise {
  String name = '';
  int sets = 0;
  int weight = 0;
  int reps = 0;

  static const keyName = 'name';
  static const keySets = 'sets';
  static const keyWeight = 'weight';
  static const keyReps = 'reps';

  Exercise({this.name ='', this.sets = 0, this.weight = 0, this.reps = 0});

  Exercise.fromJson(Map<String, dynamic> map) {
    name = map[keyName];
    sets = map[keySets];
    weight = map[keyWeight];
    reps = map[keyReps];
  }
}
