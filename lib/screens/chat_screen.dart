// ✅ chat_screen.dart
import 'package:flutter/material.dart';
import '../widgets/chat_ai/chat_bubble.dart';
import '../widgets/chat_ai/input_bar.dart';
import '../widgets/chat_ai/chat_message.dart';
import '../widgets/chat_ai/youtube_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messages.addAll([
      ChatMessage(text: '안녕하세요! 여행 계획을 도와드릴게요 😊', isUser: false),
      ChatMessage(
        text: 'https://www.youtube.com/watch?v=xNRuonwDGrg',
        isUser: false,
        type: MessageType.videoCard,
      ),
    ]);
  }

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
    return Scaffold(
      backgroundColor: const Color(0xFF80BFFF),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final msg = _messages[index];
                        if (msg.type == MessageType.videoCard) {
                          return YouTubeCard(
                            msg: msg,
                            index: index,
                            selectedIndex: msg.feedback,
                            onFeedback: (feedback) {
                              setState(() {
                                _messages[index].feedback = feedback;
                              });
                            },
                            onPlay: () {
                              setState(() {
                                _messages[index].isPlaying = true;
                              });
                            },
                          );
                        }
                        return ChatBubble(
                          isUser: msg.isUser,
                          message: msg.text,
                          avatarUrl:
                              msg.isUser
                                  ? 'assets/avatar_user.png'
                                  : 'assets/avatar_bot.png',
                        );
                      },
                    ),
                  ),
                  InputBar(controller: _controller, onSend: _handleSend),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Ask me anything',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
      ],
    );
  }
}
