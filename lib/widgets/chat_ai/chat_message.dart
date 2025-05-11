enum MessageType { text, videoCard }

class ChatMessage {
  final String text;
  final bool isUser;
  final MessageType type;
  bool isPlaying;
  int? feedback;

  ChatMessage({
    required this.text,
    required this.isUser,
    this.type = MessageType.text,
    this.isPlaying = false,
    this.feedback,
  });
}
