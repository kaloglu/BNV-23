import 'package:bedavanevar/firebase_options.dart';
import 'package:bedavanevar/pages/auth/login_page.dart';
import 'package:bedavanevar/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

final currentPageProvider = StateProvider((ref) => 'login');

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);

    Widget currentPageWidget = Container(); // Varsayılan değer

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
}
