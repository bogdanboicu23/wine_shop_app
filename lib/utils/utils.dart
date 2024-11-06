import 'package:flutter/material.dart';
import 'package:wine_shop_app/models/top_wine.dart';

late Size screenSize;

Color primaryColor = const Color(0xFFBE2C55);
Color secondaryColor = const Color(0xFFF5DFE5);

List<TopWine> topWinesList = [
  TopWine(
    imageAssetPath: "images/wine2.png",
    name: "Red wines",
    price: 250,
  ),
  TopWine(
    imageAssetPath: "images/wine1.png",
    name: "White wines",
    price: 153,
  ),
];
