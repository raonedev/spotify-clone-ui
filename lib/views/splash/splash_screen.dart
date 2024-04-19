import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/routes/app_routes.dart';
import '../../constants/colors.dart';
import '../../constants/constvalue.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void settimer() {
    // Start a timer to navigate to the home screen after 3 seconds.
    Timer(const Duration(seconds: 2), () {
      // Navigate to the home screen.
      Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    settimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(bodyPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'assets/music-note-2.svg',
              colorFilter:
                  ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
              width: double.infinity,
              height: 200,
            ),
            Text(
              'Amucis',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryLight,
                fontSize: 40,
                shadows: [
                  Shadow(
                    color: AppColors.primaryLight,
                    blurRadius: 10,
                    offset: const Offset(-2, -2),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
