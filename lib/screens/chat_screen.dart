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

  String? _selectedOption;
  bool _showPrompt = true;

  @override
  void initState() {
    super.initState();
    _messages.addAll([
      ChatMessage(
        text: 'Welcome! Let’s plan your perfect trip.😊',
        isUser: false,
      ),
      ChatMessage(
        text: 'https://www.youtube.com/watch?v=xNRuonwDGrg',
        isUser: false,
        type: MessageType.videoCard,
      ),
      ChatMessage(
        text:
            "\u2708\ufe0f We're ready to create your travel plan!\nWould you like to get started now?",
        isUser: false,
        type: MessageType.prompt,
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

  void _handlePromptConfirm() {
    if (_selectedOption == null) return;

    setState(() {
      _messages.add(ChatMessage(text: _selectedOption!, isUser: true));
      _showPrompt = false;
      _selectedOption = null;
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
                      itemCount: _messages.length + (_showPrompt ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (_showPrompt && index == _messages.length) {
                          return TravelPlanPrompt(
                            selectedOption: _selectedOption,
                            onSelect: (value) {
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                            onConfirm: _handlePromptConfirm,
                          );
                        }

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
                              final snackText =
                                  feedback == 0
                                      ? 'You accepted the recommendation.'
                                      : 'You rejected the recommendation.';
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(snackText),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
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
