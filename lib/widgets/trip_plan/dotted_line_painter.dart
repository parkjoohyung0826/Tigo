import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dotHeight = 3.0;
    const spaceHeight = 3.0;
    final paint =
        Paint()
          ..color = Colors.grey
          ..strokeWidth = 1.2;

    double y = 0;
    while (y < size.height) {
      canvas.drawLine(Offset(0, y), Offset(0, y + dotHeight), paint);
      y += dotHeight + spaceHeight;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
