import 'package:flutter/material.dart';
import 'package:wine_shop_app/components/filter.dart';
import 'components/header.dart';
import 'components/wine_card.dart';

void main() {
  runApp(WineShopApp());
}

class WineShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WineShopScreen(),
    );
  }
}

class WineShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Header(),
          Filters(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                WineCard(name: "Ocone Bozzovich", type: "Red wine", available: true, price: "$234"),
                WineCard(name: "2021 Petit Chablis", type: "White wine", available: true, price: "$443"),
                WineCard(name: "Philippe Fontaine", type: "Sparkling wine", available: false, price: "$599"),
                WineCard(name: "2021 Cicada's Song Rosé", type: "Rosé wine", available: true, price: "$322"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
