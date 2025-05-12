import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/trip_plan/header.dart';
import '../widgets/trip_plan/timeline_card.dart';
import '../widgets/ask_tigo_button.dart';
import 'place_screen.dart';

class VibeResultScreen extends StatefulWidget {
  final List<String> selectedMoods;

  const VibeResultScreen({super.key, required this.selectedMoods});

  @override
  State<VibeResultScreen> createState() => _VibeResultScreenState();
}

class _VibeResultScreenState extends State<VibeResultScreen> {
  bool showRecommendations = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(37.5768, 126.9795),
                zoom: 14.5,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(37.579617, 126.977041),
                      width: 24,
                      height: 24,
                      child: const CircleNumberMarker(number: '1'),
                    ),
                    Marker(
                      point: LatLng(37.570377, 126.978080),
                      width: 24,
                      height: 24,
                      child: const CircleNumberMarker(number: '2'),
                    ),
                    Marker(
                      point: LatLng(37.582604, 126.981873),
                      width: 24,
                      height: 24,
                      child: const CircleNumberMarker(number: '3'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.50,
            maxChildSize: 0.90,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Center(
                      child: Container(
                        width: 40,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Header(
                      toggleValue: showRecommendations,
                      onToggle: (val) {
                        setState(() {
                          showRecommendations = val;
                        });
                        if (!val) Navigator.pop(context);
                      },
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: widget.selectedMoods.map((mood) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE7EBF5),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              '#$mood',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF445476),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          TimelineCard(
                            number: 1,
                            title: 'Gyeongbokgung Palace',
                            category: 'Museum',
                            imagePath: 'assets/images/gyeongbokgung.png',
                            distance: '0.3 mi',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const PlaceDetailScreen()),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          TimelineCard(
                            number: 2,
                            title: 'Cheonggyecheon',
                            category: 'Museum',
                            imagePath: 'assets/images/cheonggyecheon.png',
                            distance: '1.2 mi',
                          ),
                          const SizedBox(height: 20),
                          TimelineCard(
                            number: 3,
                            title: 'National Folk Museum of Korea',
                            category: 'Museum',
                            imagePath: 'assets/images/folk_museum.png',
                            distance: '2.0 mi',
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const AskTigoButton(),
        ],
      ),
    );
  }
}

class CircleNumberMarker extends StatelessWidget {
  final String number;

  const CircleNumberMarker({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1.5)],
      ),
      alignment: Alignment.center,
      child: Text(
        number,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
