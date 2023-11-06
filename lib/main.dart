import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_store/pages/intro_page.dart';
import 'package:watch_store/providers/watch_list_providers.dart';
import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/input_watch_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WatchListProvider(), // Provide the WatchListProvider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Watch Store App",
      theme: ThemeData(
          primarySwatch: Colors.grey,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[200]),
          textTheme: TextTheme(
            titleMedium: TextStyle(color: Colors.black)
          )),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.grey[200],
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[400]),
          textTheme: TextTheme(
            titleMedium: TextStyle(color: Colors.grey[800]),
            bodyLarge: TextStyle(color: Colors.grey[200]),
          )),
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => const MyIntroPage(),
        '/homepage': (context) => const MyHomePage(),
        '/aboutpage': (context) => const MyAboutPage(),
        '/addwatchpage': (context) => const AddWatchPage(),
      },
      initialRoute: '/',
    );
  }
}
