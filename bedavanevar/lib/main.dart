import 'package:flutter/material.dart';
import '/pages/auth/login_page.dart';
import '/pages/main_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

final currentPageProvider = StateProvider((ref) => 'login');

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.read(currentPageProvider);

    Widget currentPageWidget;

    if (currentPage == 'login') {
      currentPageWidget = LoginPage();
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
