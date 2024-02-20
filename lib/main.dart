import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:outfit/homePage/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: double.maxFinite,
        splash: Container(
          width: 200,
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/logo/bg1.png",
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Image.asset(
            'assets/logo/splash-removebg-preview.png',
            height: 300,
            width: 150,
            fit: BoxFit.fitWidth,
          ),
        ),
        nextScreen: welcome(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        // duration: 3000,
      ),
    );
  }
}
