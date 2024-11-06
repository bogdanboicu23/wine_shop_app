import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.black),
              SizedBox(width: 8),
              Text(
                "Donnerville Drive",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.notifications, color: Colors.black),
              SizedBox(width: 8),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Text("12", style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
