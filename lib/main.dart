import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/input_watch_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Watch Store App",
      home: Builder(
        builder: (context) {
          return const MyHomePage();
        }
      ),
      routes: {
        '/homepage': (context) => const MyHomePage(),
        '/aboutpage': (context) => const MyAboutPage(),
        '/addwatchpage': (context) => const AddWatchPage(),
      },
    );
  }
}