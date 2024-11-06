import 'package:flutter/material.dart';
import 'package:wine_shop_app/utils/utils.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterChip(
            label: Text(
              "Type",
              style: TextStyle(
                color: selectedIndex == 0 ? primaryColor : Colors.black87,
              ),
            ),
            onSelected: (isSelected) {
              setState(() {
                selectedIndex = isSelected ? 0 : -1;
              });
            },
            backgroundColor: selectedIndex == 0
                ? secondaryColor
                : null, // Default background color
            selectedColor: primaryColor, // Background color when selected
            side: selectedIndex == 0
                ? BorderSide(color: primaryColor)
                : null, // Default border color
          ),
          FilterChip(
            label: Text(
              "Styles",
              style: TextStyle(
                color: selectedIndex == 1 ? primaryColor : Colors.black87,
              ),
            ),
            onSelected: (isSelected) {
              setState(() {
                selectedIndex = isSelected ? 1 : -1;
              });
            },
            backgroundColor: selectedIndex == 1 ? secondaryColor : null,
            selectedColor: primaryColor,
            side: selectedIndex == 1 ? BorderSide(color: primaryColor) : null,
          ),
          FilterChip(
            label: Text(
              "Countries",
              style: TextStyle(
                color: selectedIndex == 2 ? primaryColor : Colors.black87,
              ),
            ),
            onSelected: (isSelected) {
              setState(() {
                selectedIndex = isSelected ? 2 : -1;
              });
            },
            backgroundColor: selectedIndex == 2 ? secondaryColor : null,
            selectedColor: primaryColor,
            side: selectedIndex == 2 ? BorderSide(color: primaryColor) : null,
          ),
          FilterChip(
            label: Text(
              "Grape",
              style: TextStyle(
                color: selectedIndex == 3 ? primaryColor : Colors.black87,
              ),
            ),
            onSelected: (isSelected) {
              setState(() {
                selectedIndex = isSelected ? 3 : -1;
              });
            },
            backgroundColor: selectedIndex == 3 ? secondaryColor : null,
            selectedColor: primaryColor,
            side: selectedIndex == 3 ? BorderSide(color: primaryColor) : null,
          ),
        ],
      ),
    );
  }
}
