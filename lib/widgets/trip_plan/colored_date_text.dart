// widgets/colored_date_text.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ColoredDateText extends StatelessWidget {
  final String dateStr;

  const ColoredDateText(this.dateStr, {super.key});

  @override
  Widget build(BuildContext context) {
    final parsedDate = DateFormat("MMM dd").parse(dateStr);
    final month = DateFormat('MMM').format(parsedDate);
    final day = DateFormat('d').format(parsedDate);
    final weekday = DateFormat('EEEE').format(parsedDate);

    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: '$month ',
            style: const TextStyle(color: Color(0xFF000000)),
          ),
          TextSpan(text: day, style: const TextStyle(color: Color(0xFF000000))),
          const TextSpan(
            text: '  |  ',
            style: TextStyle(color: Color(0xFFEBECF2)),
          ),
          TextSpan(
            text: weekday,
            style: const TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
