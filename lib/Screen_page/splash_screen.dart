import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_13/const/color.dart';
import 'package:ui_13/Screen_page/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(75),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/small plant.png',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // App name
            const Text(
              'Plant App',
              style: TextStyle(
                color: white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            // Tagline
            Text(
              'Bring nature to your home',
              style: TextStyle(
                color: white.withOpacity(0.8),
                fontSize: 16,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 50),
            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(white),
            ),
          ],
        ),
      ),
    );
  }
}
