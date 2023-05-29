import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final googleSignInProvider = FutureProvider.autoDispose((ref) async {
  // Google Sign-In logic
});

final twitterSignInProvider = FutureProvider.autoDispose((ref) async {
  // Twitter Sign-In logic
});

final phoneNumberSignInProvider = FutureProvider.autoDispose((ref) async {
  // Phone Sign-In logic
});

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleSignIn = ref.watch(googleSignInProvider);
    final twitterSignIn = ref.watch(twitterSignInProvider);
    final phoneNumberSignIn = ref.watch(phoneNumberSignInProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: googleSignIn.when(
                data: (_) => null,
                loading: () => null,
                error: (_, __) => null,
              ),
              child: const Text('Sign in with Google'),
            ),
            ElevatedButton(
              onPressed: twitterSignIn.when(
                data: (_) => null,
                loading: () => null,
                error: (_, __) => null,
              ),
              child: const Text('Sign in with Twitter'),
            ),
            ElevatedButton(
              onPressed: phoneNumberSignIn.when(
                data: (_) => null,
                loading: () => null,
                error: (_, __) => null,
              ),
              child: const Text('Sign in with Phone'),
            ),
          ],
        ),
      ),
    );
  }
}
