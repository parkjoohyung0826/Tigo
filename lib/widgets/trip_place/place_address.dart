import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceAddress extends StatelessWidget {
  const PlaceAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Google 로고 + 평점
          Row(
            children: [
              Image.asset('assets/images/google_logo.png', height: 24),
              const Spacer(),
              const Text(
                '4.7',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              const Text(
                '(1,000)',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 🔹 회색 카드
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
                // ⏰ 운영시간
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/clock.svg', width: 18),
                    const SizedBox(width: 8),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Open',
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(text: ' · Closes 4:30 PM'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 🌍 주소
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/globe.svg', width: 18),
                    const SizedBox(width: 8),
                    const Flexible(
                      child: Text(
                        '161 Sajik-ro, Jongno-gu, Seoul, South Korea',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ☎️ 전화번호
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/phone.svg', width: 14),
                    const SizedBox(width: 8),
                    const Text('02-3700-3900'),
                  ],
                ),
                const SizedBox(height: 20),

                // 🔘 버튼
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFD9D9D9)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Open in Google Map',
                      style: TextStyle(color: Colors.blue),
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
