import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Apply gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF6E0101)], // Updated red color
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Name as Text
              Text(
                'NetRe', // Replace with your desired text
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 36, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                ),
              ),
              SizedBox(height: 10),
              // Tagline or Description
              Text(
                'Your gateway to the world of entertainment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 16, // Font size
                  fontWeight: FontWeight.w300, // Light font weight
                ),
              ),
              SizedBox(height: 30),
              // Progress Indicator
              CircularProgressIndicator(
                color: Colors.white, // Progress indicator color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
