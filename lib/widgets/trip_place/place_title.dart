import 'package:flutter/material.dart';

class PlaceTitle extends StatelessWidget {
  const PlaceTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Gyeongbokgung Palace',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'A grand royal palace representing the heritage and architectural elegance of Korea\'s Joseon Dynasty.',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}
