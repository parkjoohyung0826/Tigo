import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isUser;
  final String message;
  final String avatarUrl; // 비록 있지만, 사용자에겐 안 씀

  const ChatBubble({
    super.key,
    required this.isUser,
    required this.message,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Image.asset(avatarUrl, width: 36, height: 36), // 티고 캐릭터만 이미지 사용
              ),
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
            if (isUser)
              ...[
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE5D8FD), // 연보라색 사용자 아바타
                    ),
                  ),
                ),
              ],
          ],
        ),
      ),
    );
  }
}
