import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sharebigpack2/advertisementPage.dart';

import 'Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/logo.png',
          height: 400,
          width: 400,
        ),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: Home_Page(),
      ),
    );
  }
}
