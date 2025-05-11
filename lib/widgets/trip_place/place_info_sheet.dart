import 'package:flutter/material.dart';
import 'place_title.dart';
import 'place_address.dart';
import 'place_basic_info.dart';
import 'place_additional_info.dart';

class PlaceInfoSheet extends StatelessWidget {
  const PlaceInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.70,
      minChildSize: 0.65,
      maxChildSize: 0.90,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: ListView(
            controller: scrollController,
            children: const [
              PlaceTitle(),
              SizedBox(height: 16),
              PlaceAddress(),
              SizedBox(height: 24),
              PlaceBasicInfo(),
              SizedBox(height: 24),
              PlaceAdditionalInfo(),
              SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
