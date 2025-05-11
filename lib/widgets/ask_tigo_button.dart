import 'package:flutter/material.dart';
import '../screens/chat_overlay_screen.dart';

class AskTigoButton extends StatelessWidget {
  const AskTigoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      right: 20,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => const ChatOverlayScreen(),
          );
        },
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ask_tigo.png',
                width: 26,
                height: 26,
              ),
              const SizedBox(height: 3),
              const Text(
                "Ask Tigo",
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
