import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_store/models/watch.dart';
import 'package:watch_store/providers/theme_providers.dart';
import 'package:watch_store/providers/watch_list_providers.dart';
import 'package:watch_store/components/watch_tile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final watchList = Provider.of<WatchListProvider>(context).watchList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: myDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
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
                horizontal: 25.0,
                vertical: 15.0,
              ),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 25.0,
                bottom: 18.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Available Product",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 12, color: Colors.blue[200]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: watchList.length,
                itemBuilder: (context, index) =>
                    WatchTiles(watch: watchList[index]),
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
                      .then((addedWatch) {
                    if (addedWatch != null && addedWatch is Watch) {
                      Provider.of<WatchListProvider>(context, listen: false)
                          .addWatch(addedWatch);
                    }
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.color_lens),
                title: const Text(
                  "Change Theme",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                onTap: () {
                  showThemeChangeDialog(context);
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

  void showThemeChangeDialog(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Select Theme',
            style: TextStyle(
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Light Theme',
                  style: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                leading: Radio(
                  value: ThemeMode.light,
                  groupValue: Provider.of<ThemeProvider>(context).themeMode,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme(ThemeMode.light);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Dark Theme',
                  style: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                leading: Radio(
                  value: ThemeMode.dark,
                  groupValue: Provider.of<ThemeProvider>(context).themeMode,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme(ThemeMode.dark);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'System Theme',
                  style: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                leading: Radio(
                  value: ThemeMode.system,
                  groupValue: Provider.of<ThemeProvider>(context).themeMode,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme(ThemeMode.system);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
