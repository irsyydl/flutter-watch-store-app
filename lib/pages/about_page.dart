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
          Text(
            'Hi, I am,',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Muhammad Irsyadul Asyrof Haryono',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '(2109106047)',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 25.0,
          ),
          Text(
            "Informatika A1'21'",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
