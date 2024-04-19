import 'package:flutter/material.dart';
import 'package:spotifyclone/views/screens/home/topsongscreen.dart';
import 'package:spotifyclone/views/screens/liberary/liberary.dart';
import 'package:spotifyclone/views/screens/liberary/playlist.dart';
import '../views/auth/auth.dart';
import '../views/auth/forget.dart';
import '../views/auth/login.dart';
import '../views/auth/signup.dart';
import '../views/auth/verifyemail.dart';
import '../views/screens/home/homepage.dart';
import '../views/splash/onboarding.dart';
import '../views/splash/splash_screen.dart';

import '../views/screens/search/search.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const onBoardingScreen = '/on_boarding_screen';
  static const forgotScreen = '/forgot_screen';
  static const String authScreen = '/auth_screen';
  static const String logInScreen = '/login_screen';
  static const String signUpScreen = '/signup_screen';
  static const String verifyEmailScreen = '/verify_screen';
  static const String homeScreen = "/home_screen";
  static const String searchScreen = "/search_screen";
  static const String topSongScreen ="/top_song_screen";
  static const String platListScreen ="/playlist_screen";
  static const String libraryScreen ="/library_screen";

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    verifyEmailScreen: (context) => const VerifyEmailScreen(),
    forgotScreen: (context) => const ForgotScreen(),
    onBoardingScreen: (context) => const FirstScreen(),
    authScreen: (context) => const AuthHomeScreen(),
    logInScreen: (context) => const LoginScreen(),
    signUpScreen: (context) => const SignUpScreen(),
    homeScreen: (context) => const HomeScreen(),
    topSongScreen:(context)=>const TopSongScreen(),
    searchScreen: (context) => const SearchScreen(),
    platListScreen:(context)=>const PlayListScreen(),
    libraryScreen:(context)=>const YourLibrary(),
  };
}
