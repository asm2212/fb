import 'package:flutter/material.dart';
import 'package:tg/config/palette.dart';
import 'package:tg/screens/home_screen.dart';
import 'package:tg/screens/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.blue, // Set your favorite color here
       visualDensity: VisualDensity.adaptivePlatformDensity,
       scaffoldBackgroundColor: Palette.scaffold
      ),
      home: const TabScreen(),
    );
  }
}
