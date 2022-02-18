import 'package:flutter/material.dart';
import 'package:flutter_app/MyClipper.dart';
import 'package:flutter_app/element.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black26),
      home: Scaffold(
        // Outer white container with padding
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
          color: Colors.white,
          // Inner yellow container
          child: Container(
            width: double.infinity,
            height: 20,
            color: Colors.yellow,
            child: CustomPaint(painter: MyPainter(),)
          ),
        ),
      ),
    );
  }
}