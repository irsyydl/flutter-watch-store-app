import 'package:flutter/material.dart';
import 'package:watch_store/models/watch.dart';

class WatchListProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Watch> _watchList = [
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

  List<Watch> get watchList => _watchList;

  void addWatch(Watch watch) {
    _watchList.add(watch);
    notifyListeners();
  }
}
