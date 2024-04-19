import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/common/buttons/button_filledglow.dart';
import 'package:spotifyclone/routes/app_routes.dart';
import 'package:spotifyclone/views/auth/verifyemail.dart';
import '../../constants/colors.dart';
import '../screens/home/homepage.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else {
            if (snapshot.hasData) {
              final user = snapshot.data;
              if (user != null) {
                if (user.emailVerified) {
                  return const HomeScreen();
                } else {
                  return const VerifyEmailScreen();
                }
              } else {
                return const OnboardingScreen();
              }
            } else {
              return const OnboardingScreen();
            }
          }
        });
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController? _pageController = PageController();
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              color: AppColors.primary,
              child: Stack(
                children: [
                  const Positioned(
                    top: 20,
                    left: 30,
                    child: Elips(size: 100),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.1,
                    right: 30,
                    child: const Elips(size: 50),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.3,
                    right: 30,
                    child: const Elips(size: 80),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 350,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/imgirl.png',
                width: 300,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                color: const Color(0xFF121111),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0),
                  ),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 150,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                      children: const [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'From the ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.56,
                                ),
                              ),
                              TextSpan(
                                text: 'latest',
                                style: TextStyle(
                                  color: Color(0xFF76D7E5),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.56,
                                ),
                              ),
                              TextSpan(
                                text: ' to the ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.56,
                                ),
                              ),
                              TextSpan(
                                text: 'greatest',
                                style: TextStyle(
                                  color: Color(0xFF7BEEFF),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.56,
                                ),
                              ),
                              TextSpan(
                                text: ' hits, play your favorite tracks on',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.56,
                                ),
                              ),
                              TextSpan(
                                text: ' musium',
                                style: TextStyle(
                                    color: Color(0xFF76D7E5),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.56,
                                    shadows: [
                                      Shadow(
                                        color: Color(0xFF76D7E5),
                                        blurRadius: 20,
                                        offset: Offset(1, 2),
                                      )
                                    ]),
                              ),
                              TextSpan(
                                text: ' now!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.56,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "hi my name is aman",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    alignment: _currentPageIndex == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    width: 100,
                    height: 10,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF00C2CB),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFF121111)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 53,
                      height: 9,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFDAE7E7),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF121111)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomFilledLargeButton(
                    text: _currentPageIndex == 0 ? 'Next' : 'Get Started',
                    onPressed: () {
                      if (_currentPageIndex < 1) {
                        _pageController?.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.authScreen);
                      }
                    },
                    width: double.infinity,
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Elips extends StatelessWidget {
  const Elips({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              blurRadius: 20,
              offset: Offset(-1, -1),
              color: Color.fromARGB(255, 165, 217, 241))
        ],
        gradient: RadialGradient(
          // focalRadius: ,
          radius: 2,
          focal: Alignment.topRight,
          colors: [
            AppColors.primary,
            AppColors.backgroudLight,
          ],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
