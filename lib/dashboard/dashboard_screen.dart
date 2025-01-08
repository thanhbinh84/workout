import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout/auth/auth_controller.dart';
import 'package:workout/auth/login_controller.dart';
import 'package:workout/core/widget/base_screen.dart';

class DashboardScreen extends GetView<LoginController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      Center(child: Text('Dashboard')),
    );
  }
}
