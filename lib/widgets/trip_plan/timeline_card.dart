import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dotted_line_painter.dart';

class TimelineCard extends StatelessWidget {
  final int number;
  final String title;
  final String category;
  final String imagePath;
  final String distance;
  final VoidCallback? onTap;

  const TimelineCard({
    super.key,
    required this.number,
    required this.title,
    required this.category,
    required this.imagePath,
    required this.distance,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 번호 + 점선 + 아이콘
            Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$number',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 4),
                CustomPaint(
                  size: const Size(2, 120),
                  painter: DottedLinePainter(),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEBECF2),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: SvgPicture.asset(
                          'assets/icons/path_icon.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      distance,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF9AA0AB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 12),

            // 내용
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePath,
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) =>
                              Container(
                                height: 60,
                                width: 60,
                                color: Colors.grey[300],
                                child: const Icon(Icons.image_not_supported),
                              ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: Color(0xFFA4A4A4),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  category,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFA4A4A4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F2F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'An ancient center of politics and religion in Rome, now a remarkable ruin showcasing the heart of the Roman Empire.',
                      style: TextStyle(fontSize: 13, color: Color(0xFFA3A3B4)),
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}