import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class MyIntroPage extends StatelessWidget {
  const MyIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: IntroductionScreen(
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              titleWidget: Text(
                'Welcome to Horologic',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.white : Colors.grey,
                ),
              ),
              body: "Explore a world of elegance and precision. Find the perfect timepiece that suits your style.",
              image: Image.asset(
                isDarkTheme
                    ? "assets/horologic-high-resolution-logo-transparent.png"
                    : "assets/horologic_logo.png",
                height: 300,
                width: 300,
              ),
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  color: isDarkTheme ? Colors.white : Colors.grey,
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                'Seamless Shopping',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.white : Colors.grey,
                ),
              ),
              body: "Shop with ease and convenience. Browse, select, and order your favorite watches with just a few taps.",
              image: Image.asset(
                "assets/bloom-woman-shopping-for-clothes-online.gif",
                height: 300,
                width: 300,
              ),
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  color: isDarkTheme ? Colors.white : Colors.grey,
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                "Stay on Time in Style",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.white : Colors.grey,
                ),
              ),
              body: "Elevate your style and punctuality. Our diverse collection ensures you're always on time, in style.",
              image: Image.asset(
                "assets/bloom-girl-with-phone-blogging-online.gif",
                height: 300,
                width: 300,
              ),
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  color: isDarkTheme ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ],
          onDone: () {
            Navigator.pushNamed(context, '/homepage');
          },
          onSkip: () {
            Navigator.pushNamed(context, '/homepage');
          },
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(color: isDarkTheme ? Colors.white : Colors.grey),
          ),
          next: Icon(Icons.arrow_forward),
          done: Text(
            "Done",
            style: TextStyle(color: isDarkTheme ? Colors.white : Colors.grey),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: isDarkTheme ? Colors.grey : Colors.white,
            activeColor: const Color(0xFF6C63FF),
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
