import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout/auth/auth_controller.dart';
import 'package:workout/core/widget/base_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Get.put(AuthController(), permanent: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      Center(child: Text('Loading Workout App...')),
    );
  }
}
