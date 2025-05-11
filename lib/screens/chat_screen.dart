// ✅ chat_screen.dart
import 'package:flutter/material.dart';
import '../widgets/chat_ai/chat_bubble.dart';
import '../widgets/chat_ai/input_bar.dart';
import '../widgets/chat_ai/chat_message.dart';
import '../widgets/chat_ai/youtube_card.dart';
import '../widgets/chat_ai/travel_plan_prompt.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  final List<String> _questions = [
    "Where would you like to go?",
    "How long will your trip be?",
    "Who are you traveling with?",
    "What kind of vibe do you want for this trip?",
    "What's your approximate budget?",
  ];

  int _currentQuestionIndex = -1;
  final List<String> _userAnswers = [];

  @override
  void initState() {
    super.initState();
    _messages.addAll([
      ChatMessage(
        text: 'Welcome! Let’s plan your perfect trip. 😊',
        isUser: false,
      ),
      ChatMessage(text: _questions[0], isUser: false),
    ]);
    _currentQuestionIndex = 0;
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _userAnswers.add(text);
      _controller.clear();

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _messages.add(
          ChatMessage(text: _questions[_currentQuestionIndex], isUser: false),
        );
      } else {
        // 마지막 질문까지 끝났을 때 추가 안내 및 유튜브 카드
        _messages.addAll([
          ChatMessage(
            text:
                "🎉 Based on your answers, we've created your travel plan!\nCheck out these destinations!",
            isUser: false,
          ),
          ChatMessage(
            text: 'https://www.youtube.com/watch?v=tLa4ZOuKrB4',
            isUser: false,
            type: MessageType.videoCard,
          ),
          ChatMessage(
            text: 'https://www.youtube.com/watch?v=og8-1uxL9UI',
            isUser: false,
            type: MessageType.videoCard,
          ),
          ChatMessage(
            text: 'https://www.youtube.com/watch?v=B0oSqtECRrQ',
            isUser: false,
            type: MessageType.videoCard,
          ),
          ChatMessage(
            text: "Would you like to add this destination to your trip? ✍️",
            isUser: false,
          ),
        ]);
      }
    });
  }

  void _startTravelPlan() {
    setState(() {
      _currentQuestionIndex = 0;
      _messages.add(ChatMessage(text: _questions[0], isUser: false));
    });
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
                                  : 'assets/tigo_character.png',
                        );
                      },
                    ),
                  ),
                  _currentQuestionIndex == -1
                      ? const SizedBox.shrink() // 질문이 바로 시작되므로 버튼은 제거
                      : InputBar(controller: _controller, onSend: _handleSend),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
