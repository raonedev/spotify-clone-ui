import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/common/buttons/button_filledglow.dart';
import 'package:spotifyclone/constants/constvalue.dart';
import 'package:spotifyclone/routes/app_routes.dart';

import '../../common/widget/dialog.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String email = "";
  User? user=FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(bodyPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/logo.png', height: 150),
              ),
              const Text(
                'verify E-mail',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.10,
                ),
              ),
              const SizedBox(height: 20),
              Text(user!.emailVerified.toString(),style: const TextStyle(color: Colors.white),),
              Text(
                user!.email.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 40),
              CustomFilledLargeButton(
                text: 'Verify email',
                onPressed: () async {
                  try{
                    await user?.sendEmailVerification();
                    // ignore: use_build_context_synchronously
                    showAlertDialog(
                      context: context,
                      title: 'Email verification sent',
                      subtitle: 'mail sent to ${user?.email}',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.authScreen);
                        Navigator.pop(context);
                      },
                    );
                  }on FirebaseAuthException catch (e) {
                    // Handle the exception.
                    final errorMessage = e.toString();

                    // Show a snackbar with the error message.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(errorMessage),
                      ),
                    );
                  }
                },
                width: double.infinity,
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
