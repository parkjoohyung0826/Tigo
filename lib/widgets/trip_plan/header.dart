// widgets/header.dart
import 'package:flutter/material.dart';
import '../../screens/recommendation_screen.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: [
          const Text(
            'SEOUL',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF454545),
            ),
          ),
          const Spacer(),
          const Text('New Spot Picks', style: TextStyle(fontSize: 14)),
          const SizedBox(width: 8),
          Transform.scale(
            scale: 0.8, child: Switch(
            value: false,
            onChanged: (val) {
              if (val) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecommendationScreen(),
                  ),
                );
              }
            },
            activeColor: const Color(0xFF55A3F1),
          ),
          ),
        ],
      ),
    );
  }
}