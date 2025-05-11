import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'chat_message.dart';

class YouTubeCard extends StatelessWidget {
  final ChatMessage msg;
  final int index;
  final int? selectedIndex;
  final void Function(int) onFeedback;
  final void Function() onPlay;

  String? extractVideoId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.host.contains('youtube.com')) return null;
    return uri.queryParameters['v'];
  }

  const YouTubeCard({
    super.key,
    required this.msg,
    required this.index,
    required this.selectedIndex,
    required this.onFeedback,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    final videoId = extractVideoId(msg.text);

    return Padding(
      padding: const EdgeInsets.only(left: 56.0, right: 12.0, bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFF7F7F7),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child:
                        msg.isPlaying && videoId != null
                            ? YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: videoId,
                                flags: const YoutubePlayerFlags(autoPlay: true),
                              ),
                              showVideoProgressIndicator: true,
                            )
                            : GestureDetector(
                              onTap: onPlay,
                              child: Image.network(
                                'https://img.youtube.com/vi/$videoId/0.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEF3F7),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '자이로움보다 무서운 공중 그녀?!',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '쉐리 SHERRY   #쇼츠 #스릴 #재밌는',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: 320,
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  onPressed: () => onFeedback(0),
                  icon: SvgPicture.asset(
                    'assets/icons/thumb_up.svg',
                    width: 16,
                    height: 16,
                    color:
                        selectedIndex == 0
                            ? const Color(0xFF55A3F1)
                            : Colors.black87,
                  ),
                  label: Text(
                    "Accept",
                    style: TextStyle(
                      color:
                          selectedIndex == 0
                              ? const Color(0xFF55A3F1)
                              : const Color(0xFF6A6A6A),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () => onFeedback(1),
                  icon: SvgPicture.asset(
                    'assets/icons/thumb_down.svg',
                    width: 16,
                    height: 16,
                    color:
                        selectedIndex == 1
                            ? const Color(0xFFF15558)
                            : Colors.black87,
                  ),
                  label: Text(
                    "Reject",
                    style: TextStyle(
                      color:
                          selectedIndex == 1
                              ? const Color(0xFFF15558)
                              : const Color(0xFF6A6A6A),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
