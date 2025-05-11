import 'package:flutter/material.dart';

class PlaceImage extends StatelessWidget {
  const PlaceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/gyeongbokgung.png',
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
