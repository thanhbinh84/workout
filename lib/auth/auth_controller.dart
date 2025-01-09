import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:workout/app/routes.dart';
import 'package:workout/core/controller/base_controller.dart';

class AuthController extends BaseController {
  static AuthController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    listenUserState();
  }

  listenUserState() async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Get.offAllNamed(Routes.login);
        } else {
          Get.offAllNamed(Routes.dashboard);
        }
      });
    } catch (e) {
      error();
    }
  }
}
