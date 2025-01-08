import 'dart:async';

import 'package:dio/dio.dart';
import 'package:workout/core/service/api.dart';

class MockAPI extends BaseAPI {
  @override
  Future<Response> getPlan() async {
    await Future.delayed(const Duration(milliseconds: 500));

    var mockPlanData = {
      "name": "Full Body",
      "description": "Ein kurzer und knackiger Trainingsplan mit vielen Unzulänglichkeiten.",
      "duration": 50,
      "category": "Krafttraining",
      "split": "Ganzkörper",
      "exercises": [
        {
          "name": "Kniebeugen",
          "sets": 5,
          "reps": 10,
          "repUnit": "Wdh",
          "weight": 20,
          "weightUnit": "kg",
          "break": 60,
          "muscleGroup": "Beine",
          "equipment": ["Rack", "Langhantel"]
        },
        {
          "name": "KH-Bankdrücken",
          "sets": 3,
          "reps": 10,
          "repUnit": "Wdh",
          "weight": 20,
          "weightUnit": "kg",
          "break": 60,
          "muscleGroup": "Brust",
          "equipment": ["Bank", "Kurzhanteln"]
        },
        {
          "name": "Kreuzheben",
          "sets": 3,
          "reps": 10,
          "repUnit": "Wdh",
          "weight": 20,
          "weightUnit": "kg",
          "break": 60,
          "muscleGroup": "Rücken",
          "equipment": ["Langhantel"]
        },
        {
          "name": "Klimmzüge",
          "sets": 3,
          "reps": 10,
          "repUnit": "Wdh",
          "weight": 0,
          "weightUnit": "kg",
          "break": 60,
          "muscleGroup": "Rücken",
          "equipment": ["Klimmzugstange"]
        },
        {
          "name": "Planks",
          "sets": 3,
          "reps": 40,
          "repUnit": "s",
          "weight": 0,
          "weightUnit": "kg",
          "break": 60,
          "muscleGroup": "Bauch",
          "equipment": []
        }
      ]
    };
    Response response = Response(requestOptions: RequestOptions(path: "url"), data: mockPlanData);
    return response;
  }
}
