import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pill_vault/constants/image_constants.dart';
import 'package:pill_vault/views/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF74C0C0),
              Color(0xFFD0D7D7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(ImageConstants.splashScreenImg),
                ),
                const SizedBox(height: 20),
                Image.asset(ImageConstants.pillVault),
              ],
            ),
          ),
        ),
      ),
    );
  }
}