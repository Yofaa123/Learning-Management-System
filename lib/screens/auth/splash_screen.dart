import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showFirstDot = true;
  bool _showSecondDot = false;
  bool _showThirdDot = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _showFirstDot = false;
          _showSecondDot = true;
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _showSecondDot = false;
          _showThirdDot = true;
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _showThirdDot = false;
          _showFirstDot = true;
        });
        _startAnimation(); // Loop the animation
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBC4B4B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LSM',
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'serif',
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Learning Management System',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _showFirstDot ? 1.0 : 0.3,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedOpacity(
                  opacity: _showSecondDot ? 1.0 : 0.3,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedOpacity(
                  opacity: _showThirdDot ? 1.0 : 0.3,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
