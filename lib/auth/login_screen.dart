import 'package:flutter/material.dart';
import 'package:workout/auth/login_controller.dart';
import 'package:workout/core/widget/base_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void initState() {
    _emailTextController.text = 'workout@yahoo.com';
    _passwordTextController.text = 'workout123';
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      controller: LoginController.to,
      resizeToAvoidBottomPadding: true,
        Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _emailTextController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordTextController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
          ),
          const SizedBox(height: 40),
          TextButton(
              onPressed: () =>
                  LoginController.to.login(_emailTextController.text, _passwordTextController.text),
              child: const Text('Login'))
        ])));
  }
}
