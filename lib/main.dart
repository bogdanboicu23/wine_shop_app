import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wine_shop_app/components/filter.dart';
import 'package:wine_shop_app/components/top_wine_card.dart';
import 'package:wine_shop_app/models/wine.dart';
import 'package:wine_shop_app/utils/utils.dart';
import 'components/header.dart';

void main() {
  runApp(const WineShopApp());
}

class WineShopApp extends StatelessWidget {
  const WineShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WineShopScreen(),
    );
  }
}

class WineShopScreen extends StatefulWidget {
  const WineShopScreen({super.key});

  @override
  State<WineShopScreen> createState() => _WineShopScreenState();
}

class _WineShopScreenState extends State<WineShopScreen> {
  List<Wine> winesList = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final jsonString = await rootBundle.loadString("assets/data/events.json");
    final jsonData = jsonDecode(jsonString);
    for (var data in jsonData["carousel"]) {
      winesList.add(Wine.fromJson(data));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: screenSize.height * 0.09,
          ),
          const Header(),
          SizedBox(height: screenSize.height * 0.02),
          const Text(
            "Shop wines by",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Filters(),
          SizedBox(height: screenSize.height * 0.02),
          SizedBox(
            height: 230,
            child: ListView.builder(
              itemCount: topWinesList.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return TopWineCard(
                  topWineInfo: topWinesList[index],
                );
              },
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Column(
          //     children: [
          //       WineCard(
          //           name: "Ocone Bozzovich",
          //           type: "Red wine",
          //           available: true,
          //           price: "\$234"),
          //       WineCard(
          //           name: "2021 Petit Chablis",
          //           type: "White wine",
          //           available: true,
          //           price: "\$443"),
          //       WineCard(
          //           name: "Philippe Fontaine",
          //           type: "Sparkling wine",
          //           available: false,
          //           price: "\$599"),
          //       WineCard(
          //           name: "2021 Cicada's Song Rosé",
          //           type: "Rosé wine",
          //           available: true,
          //           price: "\$322"),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
