import 'package:flutter/material.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/theme.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const TabsScreen(),
    );
  }
}
