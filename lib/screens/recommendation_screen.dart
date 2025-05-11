import 'package:flutter/material.dart';
import '../widgets/trip_plan/header.dart';
import 'place_screen.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  final List<String> moods = [
    "Shop", "Relaxing", "Romantic", "Adventurous",
    "Cultural", "Trendy", "Local", "Nature", "Luxurious",
    "Healing", "Unique", "Photogenic", "Family-friendly", "Scenic", "Quiet"
  ];

  final Set<String> selectedMoods = {}; // 기본 선택 없음
  bool toggleValue = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg is bool) {
      toggleValue = arg;
    }
  }

  void toggleMood(String mood) {
    setState(() {
      if (selectedMoods.contains(mood)) {
        selectedMoods.remove(mood);
      } else {
        if (selectedMoods.length < 3) {
          selectedMoods.add(mood);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You can select up to 3 vibes.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: const Color(0xFFEFF2F6)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
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
                      toggleValue: toggleValue,
                      onToggle: (val) {
                        if (!val) Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          const Text(
                            "Select up to 3 vibes you're looking for.",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "We recommend places based on your GPS location and preferences.",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 12,
                              alignment: WrapAlignment.center,
                              children: moods.map((mood) {
                                final selected = selectedMoods.contains(mood);
                                return ChoiceChip(
                                  label: Text(
                                    mood,
                                    style: TextStyle(
                                      color: selected ? Colors.white : const Color(0xFF5F5F7B),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  selected: selected,
                                  selectedColor: const Color(0xFF6881C0),
                                  backgroundColor: const Color(0xFFEFF2F6),
                                  onSelected: (_) => toggleMood(mood),
                                  showCheckmark: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide.none,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () => setState(() => selectedMoods.clear()),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: const Color(0xFFF5F5F5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  child: const Text("Reset"),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // 적용 로직 추가 가능
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1F1F1F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  child: const Text(
                                    "Apply",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}