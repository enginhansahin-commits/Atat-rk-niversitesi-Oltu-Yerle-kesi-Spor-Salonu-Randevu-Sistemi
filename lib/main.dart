import 'package:flutter/material.dart';
import 'splash_ekranı.dart';

void main() => runApp(OltuSporSistemi());

class OltuSporSistemi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: SplashEkrani(),
    );
  }
}
