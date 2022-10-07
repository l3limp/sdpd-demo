import 'package:flutter/material.dart';
import 'package:sdpdemo/screens/home.dart';

void main() {
  runApp(const MyApp());
}

// This app has some minor known bugs, since it was made with time constraints, and for a demonstration

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
