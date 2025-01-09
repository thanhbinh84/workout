import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout/app/app.dart';
import 'package:workout/core/config/firebase_options.dart';
import 'package:workout/core/repository/workout_repository.dart';
import 'package:workout/core/util/utils.dart';

void bootstrap() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebaseServices();
    await _initAppServices();
    runApp(const App());
  }, (e, s) => Utils.handleError(e, s: s));
}

_initFirebaseServices() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instanceFor(app: app);
}

_initAppServices() async {
  Get.put(WorkoutRepository(), permanent: true);
}
