import 'package:flutter/material.dart';

import '../components/watch_tile.dart';
import '../models/watch.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Watch List
  List watchList = [
    Watch(
      name: "Prospex",
      brandName: "Seiko",
      price: "179",
      description:
          'Seiko Prospex watches are built for professional use, combining rugged durability with precision. These timepieces are designed for adventurers and explorers, featuring features like water resistance, luminous hands, and robust case materials. The Prospex line offers a wide range of options, from dive watches to pilot watches, making it a versatile choice for those seeking reliable performance in challenging environments',
      imageUrl: "assets/seiko_prospex.png",
    ),
    Watch(
      name: "Presage",
      brandName: "Seiko",
      price: "162",
      description:
          'Seiko Presage watches are the embodiment of Japanese artistry and craftsmanship. They are known for their elegant and traditional designs, often incorporating elements of Japanese culture. These timepieces feature high-quality automatic movements and exquisite dials, making them ideal for those who appreciate both form and function. Seiko Presage watches are often considered affordable luxury pieces.',
      imageUrl: "assets/seiko_presage.png",
    ),
    Watch(
      name: "King Seiko",
      brandName: "Seiko",
      price: "210",
      description:
          "King Seiko watches pay homage to Seiko's history of watchmaking excellence. With a classic and timeless design, these timepieces blend heritage with modern technology. King Seiko models often feature hand-wound or automatic movements, showcasing the precision that Seiko is renowned for. These watches are a symbol of traditional watchmaking values, appealing to collectors and enthusiasts alike.",
      imageUrl: "assets/seiko_kingseiko.png",
    ),
    Watch(
      name: "Astron",
      brandName: "Seiko",
      price: "199",
      description:
          'Seiko Astron watches are at the forefront of technological innovation. They are known for their solar-powered GPS technology, which automatically adjusts the time based on your location, ensuring unparalleled accuracy. These watches are ideal for frequent travelers and individuals who require precise timekeeping without manual adjustments. The Astron collection combines cutting-edge technology with a sleek and modern design.',
      imageUrl: "assets/seiko_astron.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
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
      drawer: myDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02),
              padding: EdgeInsets.all(screenWidth * 0.02),
              height: screenHeight * 0.2,
              decoration: BoxDecoration(
                color: Colors.blueGrey[600],
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Get 15% Promo",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.02),
                            color: Colors.blueGrey,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Redeem",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(child: Image.asset('assets/seiko_astron.png'))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    hintText: "Search here...",
                    contentPadding: EdgeInsets.all(screenWidth * 0.02),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 25.0, bottom: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Product",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[200],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: watchList.length,
                itemBuilder: (context, index) => WatchTiles(
                  watch: watchList[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer myDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Image.asset("assets/horologic_logo.png"),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                onTap: () {
                  // Handle home
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
              ListTile(
                leading: const Icon(Icons.create),
                title: const Text(
                  "Input Watch",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                onTap: () {
                  // Handle input
                  Navigator.pushNamed(context, '/addwatchpage')
                      .then((newWatch) {
                    if (newWatch != null && newWatch is Watch) {
                      setState(() {
                        watchList.add(newWatch);
                      });
                    }
                  });
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(
              "About",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            onTap: () {
              // Handle about
              Navigator.pushNamed(context, '/aboutpage');
            },
          ),
        ],
      ),
    );
  }
}
