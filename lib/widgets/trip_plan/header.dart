// widgets/header.dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../screens/recommendation_screen.dart';

class Header extends StatelessWidget {
  final bool toggleValue;
  final ValueChanged<bool> onToggle;
  const Header({
    super.key,
    required this.toggleValue,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: [
          const Text(
            'SEOUL',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF454545),
            ),
          ),
          const Spacer(),
          const Text('New Spot Picks', style: TextStyle(fontSize: 14)),
          const SizedBox(width: 8),
      Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: toggleValue,
          onChanged: onToggle,
          activeColor: Color(0xFF55A3F1), // 파란색 트랙
          // thumbColor: Colors.white, // Flutter 버전에 따라 이게 필요 없을 수도 있어요
         ),
         ),
        ],
      ),
    );
  }
}

