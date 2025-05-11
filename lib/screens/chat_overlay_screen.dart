import 'package:flutter/material.dart';
import '../widgets/chat_ai/chat_bubble.dart';
import '../widgets/chat_ai/chat_message.dart';

class ChatOverlayScreen extends StatefulWidget {
  const ChatOverlayScreen({super.key});

  @override
  State<ChatOverlayScreen> createState() => _ChatOverlayScreenState();
}

class _ChatOverlayScreenState extends State<ChatOverlayScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Let me guide you with details about this location or building. Just ask!",
      isUser: false,
    ),
  ];

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Ask me anything',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFE0E0E0)),
          const SizedBox(height: 8),

          // ✅ 채팅 메시지 리스트
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(
                  isUser: msg.isUser,
                  message: msg.text,
                  avatarUrl: msg.isUser
                      ? 'assets/avatar_user.png'
                      : 'assets/tigo_character.png',
                );
              },
            ),
          ),

          // 입력창
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Ask anything you want.....",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => _handleSend(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: _handleSend,
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic, color: Colors.blue),
                    onPressed: () {
                      // 음성 입력 처리 가능
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
