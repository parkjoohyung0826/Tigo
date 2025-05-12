import 'package:flutter/material.dart';
import '../widgets/trip_place/place_image.dart';
import '../widgets/trip_place/place_info_sheet.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 0.4,
            widthFactor: 1.0,
            child: const PlaceImage(),
          ),
          const PlaceInfoSheet(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
