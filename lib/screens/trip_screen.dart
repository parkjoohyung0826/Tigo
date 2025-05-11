import 'package:flutter/material.dart';
import '../widgets/trip_plan/header.dart';
import '../widgets/trip_plan/date_chips.dart';
import '../widgets/trip_plan/colored_date_text.dart';
import '../widgets/trip_plan/timeline_card.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../screens/recommendation_screen.dart';
import 'place_screen.dart';
import '../widgets/ask_tigo_button.dart';


class SeoulTripScreen extends StatefulWidget {
  const SeoulTripScreen({super.key});

  @override
  State<SeoulTripScreen> createState() => _SeoulTripScreenState();
}

class _SeoulTripScreenState extends State<SeoulTripScreen> {
  final List<String> days = ['May 20', 'May 21', 'May 22', 'May 23'];
  int selectedDayIndex = 0;

  bool showRecommendations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ✅ Google Map placeholder
          Positioned.fill(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(37.565, 126.977041),
                zoom: 14.5,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),

                  PolylineLayer(
                  polylines: [
                    // 1 (경복궁) → 2 (청계천)
                    Polyline(
                      points: [
                        trimEdge(LatLng(37.579617, 126.977041), LatLng(37.570377, 126.978080), 10),
                        trimEdge(LatLng(37.570377, 126.978080), LatLng(37.579617, 126.977041), 10),
                      ],
                      color: Colors.blue,
                      strokeWidth: 3.0,
                    ),
                    // 2 (청계천) → 3 (민속박물관)
                    Polyline(
                      points: [
                        trimEdge(LatLng(37.570377, 126.978080), LatLng(37.582604, 126.981873), 10),
                        trimEdge(LatLng(37.582604, 126.981873), LatLng(37.570377, 126.978080), 10),
                      ],
                      color: Colors.blue,
                      strokeWidth: 3.0,
                    ),
                  ],
                ),

                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(37.579617, 126.977041), // 경복궁
                      width: 24,
                      height: 24,
                      child: const CircleNumberMarker(number: '1'),
                    ),
                    Marker(
                      point: LatLng(37.570377, 126.978080), // 청계천
                      width: 24,
                      height: 24,
                      child: const CircleNumberMarker(number: '2'),
                    ),
                    Marker(
                      point: LatLng(37.582604, 126.981873), // 민속박물관
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

          // ✅ Draggable Sheet
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

                        if (val) {
                          Future.microtask(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RecommendationScreen(),
                                settings: RouteSettings(arguments: true),
                              ),
                            ).then((_) {
                              setState(() {
                                showRecommendations = false;
                              });
                            });
                          });
                        }
                      },
                    ),

                    SizedBox(height: 6),
                    DateChips(
                      days: days,
                      selectedIndex: selectedDayIndex,
                      onSelected: (index) {
                        setState(() => selectedDayIndex = index);
                      },
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: ColoredDateText(days[selectedDayIndex]),
                          ),
                          const SizedBox(height: 12),
                          TimelineCard(
                            number: 1,
                            title: 'Gyeongbokgung Palace',
                            category: 'Museum',
                            imagePath: 'assets/images/gyeongbokgung.png',
                            distance: '0.3 mi',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PlaceDetailScreen(),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 20),
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
          AskTigoButton(),
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
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1.5,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        number,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

LatLng trimEdge(LatLng from, LatLng to, double meters) {
  final distance = Distance();
  final heading = distance.offset(from, distance.distance(from, to) - meters, distance.bearing(from, to));
  return heading;
}
