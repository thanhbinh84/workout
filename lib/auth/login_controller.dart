import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:workout/core/controller/base_controller.dart';

class LoginController extends BaseController {
  static LoginController get to => Get.find();

  login(String email, String password) async {
    try {
      loading();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      success();
    } catch (e) {
      error(error: e.toString());
    }
  }
}
