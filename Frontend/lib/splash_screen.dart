import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'instruction.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InstructionPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 74, 127, 101),
              Color.fromARGB(255, 19, 90, 69),
              Color.fromARGB(255, 18, 60, 94),
            ],
          ),
          // Set the background color to #5d83c2
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: const Text(
                "Welcome",
                style: TextStyle(
                    color: Color.fromARGB(255, 250, 250, 250), fontSize: 40),
              ),
            ),
            const SizedBox(height: 10),
            FadeInUp(
              duration: const Duration(milliseconds: 1300),
              child: const Text(
                "To Unmasking Hidden Dangers",
                style: TextStyle(
                    color: Color.fromARGB(255, 238, 236, 215),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: const Alignment(0.6, 0),
              child: Container(
                width: 250,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
