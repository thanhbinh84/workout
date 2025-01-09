class Exercise {
  String name = '';
  int sets = 0;
  int weight = 0;
  int reps = 0;
  int breakSecond = 0;

  static const keyName = 'name';
  static const keySets = 'sets';
  static const keyWeight = 'weight';
  static const keyReps = 'reps';
  static const keyBreak = 'break';

  Exercise({this.name ='', this.sets = 0, this.weight = 0, this.reps = 0, this.breakSecond = 0});

  Exercise.fromJson(Map<String, dynamic> map) {
    name = map[keyName];
    sets = map[keySets];
    weight = map[keyWeight];
    reps = map[keyReps];
    breakSecond = map[keyBreak];
  }


}
