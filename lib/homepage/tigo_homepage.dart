import 'package:flutter/material.dart';
import '../screens/chat_screen.dart';
import '../screens/trip_screen.dart';
import '../screens/my_screen.dart';
import '../screens/list_screen.dart';
import '../widgets/home/tigo_pick_today_section.dart';
import '../widgets/home/place_detail_modal.dart';

class TigoHomePage extends StatelessWidget {
  const TigoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 360,
            child: Image.asset(
              'assets/tigo_background.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            top: 420,
            left: 0,
            right: 0,
            bottom: 0,
            child: TigoPickTodaySection(
              onInfoTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const PlaceDetailModal(),
                );
              },
            ),
          ),
          Positioned(
            top: 300,
            left: 24,
            right: 24,
            child: Row(
              children: [
                Expanded(
                  child: _PlanCard(
                    icon: Icons.language,
                    title: 'My Trips',
                    date: '2025.05.06',
                    iconColor: const Color(0xFFF99500),
                    bgColor: const Color(0xFFFFF0E0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _PlanCard(
                    icon: Icons.list_alt,
                    title: 'For Conversation',
                    date: '2025.05.06',
                    iconColor: const Color(0xFF4A90E2),
                    bgColor: const Color(0xFFE7F2FF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 72,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Hi, scott',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Plans with Tigo',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 96,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.video_call,
                        color: Colors.grey,
                        size: 28,
                      ),
                      const SizedBox(width: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyPageScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -36,
                  child: Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFB2D9FF), Color(0xFFE7EBFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.25),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30,
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

class _PlanCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback? onTap;

  const _PlanCard({
    required this.icon,
    required this.title,
    required this.date,
    required this.iconColor,
    required this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: bgColor,
                  child: Icon(icon, color: iconColor),
                ),
                Switch(
                  value: true,
                  onChanged: (_) {},
                  activeColor: const Color(0xFF4A90E2),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'created at $date',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
