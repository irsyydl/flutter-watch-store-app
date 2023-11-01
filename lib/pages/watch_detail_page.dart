import 'package:flutter/material.dart';

import '../models/watch.dart';

class WatchDetailPage extends StatelessWidget {
  final Watch watch;

  const WatchDetailPage({Key? key, required this.watch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.016),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Hero(
                    tag: watch.name,
                    child: Image.asset(
                      watch.imageUrl,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              watch.name,
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              watch.brandName,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.grey[800]),
                            ),
                          ],
                        ),
                        Text(
                          '\$${watch.price}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          watch.description,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            height: 2,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
