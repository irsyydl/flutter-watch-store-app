import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class MyIntroPage extends StatelessWidget {
  const MyIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: IntroductionScreen(
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
                titleWidget: const Text(
                  'Welcome to Horologic',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                body:
                    "Explore a world of elegance and precision. Find the perfect timepiece that suits your style.",
                image : Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? "assets/horologic-high-resolution-logo-transparent.png"
                      : "assets/horologic_logo.png",
                  height: 300,
                  width: 300,
                )),
            PageViewModel(
                titleWidget: const Text(
                  'Seamless Shopping',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                body:
                    "Shop with ease and convenience. Browse, select, and order your favorite watches with just a few taps.",
                image: Image.asset(
                  "assets/bloom-woman-shopping-for-clothes-online.gif",
                  height: 300,
                  width: 300,
                )),
            PageViewModel(
                titleWidget: const Text(
                  "Stay on Time in Style",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                body:
                    "Elevate your style and punctuality. Our diverse collection ensures you're always on time, in style.",
                image: Image.asset(
                  "assets/bloom-girl-with-phone-blogging-online.gif",
                  height: 300,
                  width: 300,
                ))
          ],
          onDone: () {
            Navigator.pushNamed(context, '/homepage');
          },
          onSkip: () {
            Navigator.pushNamed(context, '/homepage');
          },
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Icon(Icons.arrow_forward),
          done: const Text("Done"),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              color: Colors.grey,
              activeColor: const Color(0xFF6C63FF),
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
