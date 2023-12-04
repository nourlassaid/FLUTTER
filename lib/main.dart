import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cagnotte/components/login_page.dart';
import 'package:cagnotte/TestPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Initial screen is the splash screen
      routes: {
        '/login': (context) => LoginPage(),
        '/testpage': (context) => TestPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3), // Change the duration as needed
      () {
        Navigator.of(context).pushReplacementNamed('/testpage');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.png', // Replace with your logo asset
              width: 250,
              height: 250,
            ),
            SizedBox(height: 20),
            Text(
              'Crowdfunding App',
              style: TextStyle(
                fontSize: 30,
                backgroundColor: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
