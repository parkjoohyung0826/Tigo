import 'package:flutter/material.dart';

class TravelPlanPrompt extends StatelessWidget {
  final String? selectedOption;
  final void Function(String option) onSelect;
  final VoidCallback onConfirm;

  const TravelPlanPrompt({
    super.key,
    required this.selectedOption,
    required this.onSelect,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48.0, top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _OptionButton(
                text: "Yes, let's go!",
                selected: selectedOption == "Yes, let's go!",
                onTap: () => onSelect("Yes, let's go!"),
              ),
              _OptionButton(
                text: "Not yet, I have more to say 😅",
                selected: selectedOption == "Not yet, I have more to say 😅",
                onTap: () => onSelect("Not yet, I have more to say 😅"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: selectedOption == null ? null : onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    selectedOption == null
                        ? Colors.grey[300]
                        : Colors.blue[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _OptionButton({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        backgroundColor: selected ? Colors.blue[100] : Colors.white,
        side: BorderSide(color: selected ? Colors.blue : Colors.grey.shade400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.blue[900] : Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}
