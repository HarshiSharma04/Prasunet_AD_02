import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart'; // Ensure this import points to your home page file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(), // Change this to your home page
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png', // Ensure your logo is placed in the assets folder
          width: 200, // Adjust the size as needed
          height: 200, // Adjust the size as needed
        ),
      ),
    );
  }
}
