import 'package:bedavanevar/firebase_options.dart';
import 'package:bedavanevar/pages/auth/login_page.dart';
import 'package:bedavanevar/pages/main_page.dart';
import 'package:bedavanevar/viewmodels/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/loading_page.dart';

const bool useEmulator = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

final currentPageProvider = StateProvider((ref) => 'login');
final authStateProvider = StreamProvider<User?>((ref) => ref.read(authProvider).authStateChange);

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (useEmulator) {
      FirebaseAuth.instance.useAuthEmulator("127.0.0.1", 9099);
      FirebaseFirestore.instance.useFirestoreEmulator("127.0.0.1", 8080);
    }
    final currentPage = ref.watch(currentPageProvider);
    final currentUser = ref.watch(authStateProvider);

    Widget currentPageWidget = Container(); // Varsayılan değer

    currentUser.when(
      data: (user) {
        if (user == null) navigateToLogin(ref);
      },
      error: (e, trace) => navigateToLogin(ref),
      loading: () => const LoadingScreen(),
    );

    if (currentPage == 'login') {
      currentPageWidget = const LoginPage();
    } else if (currentPage == 'main') {
      currentPageWidget = const MainPage();
    }

    return MaterialApp(
      title: 'BedavaNeVar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: currentPageWidget,
    );
  }

  String navigateToLogin(WidgetRef ref) => ref.read(currentPageProvider.notifier).state = 'login';
}
