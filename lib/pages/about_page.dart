import 'package:flutter/material.dart';

class MyAboutPage extends StatelessWidget {
  const MyAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Container(
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/profil.jpg"),
                    fit: BoxFit.fill,
                  ),
                  shape: CircleBorder(),
                ),
              ),
            ),
          ),
          const Text(
            'Hi, I am,',
            style: TextStyle(
              color: Color(0xFF21243D),
              fontSize: 32,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w200,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Muhammad Irsyadul Asyrof Haryono',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF21243D),
              fontSize: 32,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '(2109106047)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF21243D),
              fontSize: 24,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          const Text(
            "Informatika A1'21'",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF21243D),
              fontSize: 32,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
