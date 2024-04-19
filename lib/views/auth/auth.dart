// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotifyclone/constants/constvalue.dart';
import 'package:spotifyclone/routes/app_routes.dart';
import '../../common/buttons/button_filledglow.dart';

import '../../common/widget/custom_snackbar.dart';

class AuthHomeScreen extends StatefulWidget {
  const AuthHomeScreen({super.key});

  @override
  State<AuthHomeScreen> createState() => _AuthHomeScreenState();
}

class _AuthHomeScreenState extends State<AuthHomeScreen> {
  bool isShow = false;

  signInWithGoogle() async {
    setState(() {
      isShow = true;
    });
    //begin interactive google sign in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //  obtain detail from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //  create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //  final lets sign in
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    } on FirebaseAuthException catch (e) {
      final errorMessage = e.code.toString();

      // Show a snackbar with the error message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    } finally {
      setState(() {
        isShow = false;
      });
    }
  }
  Future<void> signInWithFacebook({required BuildContext context})async{
    setState(() {
      isShow = true;
    });
    try{
      final LoginResult loginresult = await FacebookAuth.instance.login();
      final OAuthCredential facebookCrendential = FacebookAuthProvider.credential(loginresult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookCrendential);
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    }on FirebaseAuthException catch (e){
      showSnackBar(context: context, isError: true, text: e.message!);
    }finally {
      setState(() {
        isShow = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 40, left: bodyPadding, right: bodyPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/logo.png', height: 200),
            ),
            const Spacer(),
            const Text(
              'Let’s get you in',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.10,
              ),
            ),
            const SizedBox(height: 30),
            buildbuttons('assets/google.png', 'Continue With Google', () async {
              signInWithGoogle();
            }),
            const SizedBox(height: 16),
            buildbuttons('assets/fb.png', 'Continue With Facebook', () =>signInWithFacebook(context: context)),
            const SizedBox(height: 16),
            buildbuttons('assets/apple.png', 'Continue With Apple', () =>showSnackBar(context: context, isError: true, text: 'comming soon')),
            const Spacer(),
            const Row(
              children: [
                Expanded(
                    child: Divider(
                  color: Colors.white,
                )),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "or",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.72,
                    ),
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.white,
                )),
              ],
            ),
            const Spacer(),
            CustomFilledLargeButton(
              width: double.infinity,
              height: 60,
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.logInScreen),
              text: 'Log in with a password',
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.72,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.signUpScreen),
                  child: const Text(
                    'sign Up',
                    style: TextStyle(
                      color: Color(0xFF7BEEFF),
                      fontSize: 16,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w700,
                      height: 0.07,
                      letterSpacing: 0.72,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildbuttons(
      String icons, String text, VoidCallback onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 0.20,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFDAE7E7),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icons,
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
