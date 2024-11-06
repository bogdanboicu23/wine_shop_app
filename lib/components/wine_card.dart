import 'package:flutter/material.dart';

class WineCard extends StatelessWidget {
  final String name;
  final String type;
  final bool available;
  final String price;

  WineCard({
    required this.name,
    required this.type,
    required this.available,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/wine_bottle.png', height: 80, width: 40), // Adaugă un asset pentru imagine
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(type, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        available ? "Available" : "Unavailable",
                        style: TextStyle(
                          color: available ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
