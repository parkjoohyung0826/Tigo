import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isUser;
  final String message;
  final String avatarUrl;

  const ChatBubble({
    super.key,
    required this.isUser,
    required this.message,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            CircleAvatar(backgroundImage: AssetImage(avatarUrl), radius: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color:
                    isUser ? const Color(0xFFF4FAFF) : const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.only(
                  topLeft: isUser ? const Radius.circular(16) : Radius.zero,
                  topRight: isUser ? Radius.zero : const Radius.circular(16),
                  bottomLeft: const Radius.circular(16),
                  bottomRight: const Radius.circular(16),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: isUser ? const Color(0xFF0D5ECF) : null,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 8),
            CircleAvatar(backgroundImage: AssetImage(avatarUrl), radius: 20),
          ],
        ],
      ),
    );
  }
}
