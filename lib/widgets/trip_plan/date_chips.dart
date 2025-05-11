// widgets/date_chips.dart
import 'package:flutter/material.dart';

class DateChips extends StatelessWidget {
  final List<String> days;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const DateChips({
    super.key,
    required this.days,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: days.length,
        itemBuilder: (context, index) {
          final selected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: ChoiceChip(
              label: Text(
                days[index],
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFF525252),
                  fontWeight: FontWeight.w600,
                ),
              ),
              selected: selected,
              onSelected: (_) => onSelected(index),
              selectedColor: const Color(0xFF454545),
              backgroundColor: const Color(0xFFEEEFF8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide.none,
              ),
              checkmarkColor: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
