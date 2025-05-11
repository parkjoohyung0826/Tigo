import 'package:flutter/material.dart';

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

  final Set<String> selectedMoods = {"Shop"};

  void toggleMood(String mood) {
    setState(() {
      if (selectedMoods.contains(mood)) {
        selectedMoods.remove(mood);
      } else {
        selectedMoods.add(mood);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 지도 배경 자리
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
            minChildSize: 0.45,
            maxChildSize: 0.95,
            builder: (_, controller) => Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                children: [
                  Row(
                    children: [
                      const Text(
                        "SEOUL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const Spacer(),
                      const Text("New Spot Picks", style: TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(width: 8),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: true,
                          onChanged: (_) => Navigator.pop(context),
                          activeColor: const Color(0xFF4F87F9),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Choose the vibe you're looking for.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "We recommend places based on your GPS location and preferences.",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 12,
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
                        selectedColor: const Color(0xFF4F87F9),
                        backgroundColor: const Color(0xFFEFF2F6),
                        onSelected: (_) => toggleMood(mood),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide.none,
                        ),
                      );
                    }).toList(),
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
                            // 여기서 추천 결과 화면으로 이동 가능
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
            ),
          ),
        ],
      ),
    );
  }
}
