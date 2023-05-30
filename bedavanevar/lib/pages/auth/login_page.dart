import 'package:bedavanevar/states.dart';
import 'package:bedavanevar/viewmodels/auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.read(authController.notifier);
    ref.listen<ControllerState>(authController, ((previous, state) {
      if (state is ErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
      }
    }));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => controller.googleSignIn(),
              child: const Text('Sign in with Google'),
            ),
            ElevatedButton(
              onPressed: () => controller.twitterSignIn(),
              child: const Text('Sign in with Twitter'),
            ),
            ElevatedButton(
              onPressed: () => controller.phoneSignIn(),
              child: const Text('Sign in with Phone'),
            ),
          ],
        ),
      ),
    );
  }
}
