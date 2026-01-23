import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocalculator/screens/dashboard_screen/dashboard_screen.dart';
import 'package:neocalculator/utils/const.dart';
import 'package:neocalculator/controllers/theme_controller.dart';

/// SplashScreen is the initial screen displayed when the app starts.
/// It shows the app name and logo with a neumorphic effect.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    // Navigate to DashboardScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => DashboardScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    // Accessing colors directly from the theme controller to ensure consistency
    // Although in this simplified splash we can use context.theme
    
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for Logo - You can replace this with an Image widget if you have a logo asset
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      offset: const Offset(-6, -6),
                      blurRadius: 16,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(6, 6),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/icon.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                AppConst.appName,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: context.theme.textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
