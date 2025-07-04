import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/main.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  void _onSessionChange() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    sessionManager.addListener(_onSessionChange);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    // Navigation après un délai
    sessionManager.initialize().then((success) {
      print("session: ${sessionManager.isSignedIn}");
      if (!mounted) return;
      _navigateAfterDelay();
    });
  }

  // Méthode pour naviguer après un délai
  void _navigateAfterDelay() {
    Future.delayed(const Duration(seconds: 4), () {
      if (sessionManager.isSignedIn) {
        Get.toNamed('/home');
      } else {
        Get.offAndToNamed('/login');
      }
    });
  }

  @override
  void dispose() {
    // Suppression du listener
    sessionManager.removeListener(_onSessionChange);

    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D3F5B),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.35),
          // Bloc graphique des deux carrés
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.38,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 55,
                      width: 50,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20)),
                        color: Color(0xFF10A8FE),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 50),
                    Container(
                      height: 55,
                      width: 50,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(20)),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Texte "To-Do"
          const TextComponent(
            "To-Do",
            fontsize: 40,
            textcolor: Colors.white,
            fontweight: FontWeight.bold,
          ),
          const SizedBox(height: 10),

          // Texte animé "Let's get things done"
          SlideTransition(
            position: _animation,
            child: const TextComponent(
              "Let's get things done",
              fontsize: 18,
              textcolor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
