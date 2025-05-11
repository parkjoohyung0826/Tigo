import 'package:flutter/material.dart';

class PlaceBasicInfo extends StatefulWidget {
  const PlaceBasicInfo({super.key});

  @override
  State<PlaceBasicInfo> createState() => _PlaceBasicInfoState();
}

class _PlaceBasicInfoState extends State<PlaceBasicInfo> {
  bool _expanded = false;

  final String description =
      '''Gyeongbokgung Palace is the Joseon Dynasty's legal 궁, which was first built in 1395 (the 4th year of King Taejo's reign) after the Joseon Dynasty was founded in 1392 (1394) and moved its capital to Hanyang. Several palace buildings built against the backdrop of Cretaceous Mountain (now Bukaksan Mountain) in the north and Yukjo Street (now Sejong-ro, Gwanghwamun Square) in front of the palace.''';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Basic Information',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedCrossFade(
                  crossFadeState:
                      _expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                  firstChild: Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  secondChild: Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() => _expanded = !_expanded);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: Color(0xFFD9D9D9)),
                      backgroundColor: const Color(0xFFFFFFFF),
                    ),
                    child: Text(
                      _expanded ? 'See less' : 'See more',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
