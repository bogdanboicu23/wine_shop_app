import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wine_shop_app/components/filter.dart';
import 'package:wine_shop_app/components/top_wine_card.dart';
import 'package:wine_shop_app/components/wine_card.dart';
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
  final List<Wine> _winesList = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final jsonString = await rootBundle.loadString("assets/v3.json");
    final jsonData = jsonDecode(jsonString);
    for (var data in jsonData["carousel"]) {
      _winesList.add(Wine.fromJson(data));
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
          SizedBox(height: screenSize.height * 0.02),
          Row(
            children: [
              const Text(
                "Wine",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "view all",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              for (var wine in _winesList)
                WineCard(
                  wineInfo: wine,
                  onFavoriteTap: () {
                    final foundWine = _winesList.firstWhere((e) => e == wine);
                    setState(() {
                      foundWine.isFavorite = !foundWine.isFavorite;
                    });
                  },
                ),
              SizedBox(height: screenSize.height * 0.05),
            ],
          ),
        ],
      ),
    );
  }
}
