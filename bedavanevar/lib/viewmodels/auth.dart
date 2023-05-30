import 'package:bedavanevar/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth.dart';

final authProvider = Provider<AuthService>((ref) => AuthService(FirebaseAuth.instance));

final authController = StateNotifierProvider<AuthController, ControllerState>((ref) => AuthController(ref));

class AuthController extends StateNotifier<ControllerState> {
  final StateNotifierProviderRef ref;
  late final AuthService service;

  AuthController(this.ref) : super(const InitialState()) {
    service = ref.read(authProvider);
  }

  request(Function() function) async {
    state = const LoadingState();
    try {
      await function();
      state = const SuccessState();
    } catch (e) {
      state = ErrorState(e.toString());
    }
  }

  googleSignIn() async => await request(() async => service.googleSignIn());

  twitterSignIn() async => await request(() async => service.twitterSignIn());

  phoneSignIn() async => await request(() async => service.phoneSignIn());

  signOut() async => await request(() async => service.signOut());
}
