import 'package:flutter/material.dart';
import 'homepage/tigo_homepage.dart';
import 'screens/chat_screen.dart';
import 'screens/trip_screen.dart';
import 'screens/place_screen.dart';
import 'core/theme.dart';

void main() {
  runApp(const TravelAITigoApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TravelAITigoApp extends StatelessWidget {
  const TravelAITigoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel AI Tigo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arial',
      ),
      home: const GetStartedPage(),
    );
  }
}

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/tigo_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),
                Container(
                  width: 112,
                  height: 112,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.0),
                      ],
                      stops: [0.0, 0.6, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),


                  child: Center(
                    child: Image.asset(
                      'assets/tigo_logo.png',
                      width: 65,
                      height: 65,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    text: 'Travel AI ',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Tigo',
                        style: TextStyle(
                          color: Color(0xFF407BFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 3),
                // 구글 로그인 버튼
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) => const TigoHomePage()),
                        );
                      },
                      icon: Image.asset(
                        'assets/google_logo.png',
                        width: 24,
                        height: 24,
                      ),
                      label: const Text(
                        'Sign up with Google',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
