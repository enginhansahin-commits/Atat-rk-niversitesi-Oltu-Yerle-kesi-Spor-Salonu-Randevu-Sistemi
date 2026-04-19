import 'package:flutter/material.dart';
import 'dart:async';
import 'giris_sayfasi.dart';

class SplashEkrani extends StatefulWidget {
  @override
  _SplashEkraniState createState() => _SplashEkraniState();
}

class _SplashEkraniState extends State<SplashEkrani> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GirisSayfasi()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F3F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset('assets/logo.png', fit: BoxFit.contain),
            ),
            SizedBox(height: 30),
            Text(
              "Atatürk Üniversitesi",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
