import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // make sure you added flutter_svg package in pubspec.yaml

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> trips = const [
    {
      "name": "Palampur Bir Barot",
      "image": "assets/icons/Palampur-Bir-Barot.jpg",
    },
    {
      "name": "Dayara Bugyal",
      "image": "assets/icons/Dayara Bugyal.jpg",
    },
    {
      "name": "Har Ki Dun",
      "image": "assets/icons/Har Ki Dun.jpg",
    },
    {
      "name": "Hidden Konkan",
      "image": "assets/icons/Hidden Konkan.jpg",
    },
    {
      "name": "Kedarkantha",
      "image": "assets/icons/Kedarkantha.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('YOliDAY'),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/shopping.svg',
                height: 24,
                width: 24,
                color: Colors.deepOrange,
              ),
              onPressed: () {
                // Shopping icon action
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
                height: 24,
                width: 24,
                color: Colors.deepOrange,
              ),
              onPressed: () {
                // Notification icon action
              },
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: trips.length,
          itemBuilder: (context, index) {
            final trip = trips[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      trip['image']!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      trip['name']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
