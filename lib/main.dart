import 'package:flutter/material.dart';
import 'package:memory_game/core/init/theme/app_theme.dart';
import 'package:memory_game/screens/easy_game_screen/view/easy_game_view.dart';
import 'package:memory_game/screens/hard_game_screen/view/hard_game_view.dart';
import 'package:memory_game/screens/main_screen/view/main_screen_view.dart';
import 'package:memory_game/screens/splash_screen/view/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Memory',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.instance.theme,
      home: const SplashScreenView(),
      initialRoute: "/",
      routes: {
        'main_screen': (context) => const MainScreenView(),
        'easy_game_screen': (context) => const EasyGameView(),
        'hard_game_screen': (context) => const HardGameView(),
      },
    );
  }
}
