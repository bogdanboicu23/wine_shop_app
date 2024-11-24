import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wine_shop_app/models/wine.dart';
import 'package:wine_shop_app/utils/utils.dart';

class WineCard extends StatelessWidget {
  final Wine wineInfo;
  final VoidCallback onFavoriteTap;

  const WineCard({
    super.key,
    required this.wineInfo,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      wineInfo.imageUrl,
                      height: screenSize.height * 0.2,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: wineInfo.isAvailable
                                ? Colors.green.withOpacity(0.1)
                                : Colors.red.withOpacity(0.1),
                          ),
                          child: Text(
                            wineInfo.isAvailable ? "Available" : "Unavailable",
                            style: TextStyle(
                              color: wineInfo.isAvailable
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          wineInfo.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Volkhov",
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Image.asset(
                              "assets/Wine.png",
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${wineInfo.type} wine",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "From ${wineInfo.country}",
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          wineInfo.city,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.none,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F4F7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onFavoriteTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: wineInfo.isFavorite
                                ? primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(17),
                            border: wineInfo.isFavorite
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.black38),
                          ),
                          child: Row(
                            children: [
                              wineInfo.isFavorite
                                  ? const Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.white,
                                    )
                                  : const Icon(CupertinoIcons.heart),
                              const SizedBox(width: 6),
                              Text(
                                wineInfo.isFavorite ? "Added" : "Favorite",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: wineInfo.isFavorite
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "\$",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${wineInfo.priceUsd}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text(
                        "Critics’ Scores: ",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "${wineInfo.criticScore}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        "/ 100",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        wineInfo.bottleSize,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ],
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
