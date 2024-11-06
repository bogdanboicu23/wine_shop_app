import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterChip(label: Text("Type"), onSelected: (_) {}),
          FilterChip(label: Text("Style"), onSelected: (_) {}),
          FilterChip(label: Text("Countries"), onSelected: (_) {}),
          FilterChip(label: Text("Grape"), onSelected: (_) {}),
        ],
      ),
    );
  }
}
