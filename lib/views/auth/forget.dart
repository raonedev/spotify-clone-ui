// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/buttons/button_filledglow.dart';
import 'package:spotifyclone/constants/constvalue.dart';

import '../../common/textfield.dart';
import '../../common/widget/custom_snackbar.dart';
import '../../common/widget/dialog.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  String email = "";
  bool isLoading = false;

  void _sendPasswordResetMail({required String email}) async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      await showAlertDialog(
          title: "Check your mail",
          subtitle: "forget password mail sent",
          onTap: () {
            setState(() {
              isLoading=false;
            });
            Navigator.pop(context);
          },
          context: context);
    } on FirebaseAuthException catch (e) {
      final errorMessage = e.code.toString();
      showSnackBar(context: context, isError: true, text: errorMessage);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/arrow.svg',
            height: 16,
            width: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(bodyPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forget Password ?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.10,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                svgPath: 'assets/mail.svg',
                hint: 'Email',
                obsecrue: false,
                keyboardType: TextInputType.emailAddress,
                onChanged: (p0) {
                  email = p0;
                },
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: isLoading,
                child: Transform.scale(
                  scale: 0.4,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomFilledLargeButton(
                text: 'Forget Password',
                onPressed: () {
                  _sendPasswordResetMail(email: email);
                },
                width: double.infinity,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
