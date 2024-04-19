import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotifyclone/common/buttons/button_filledglow.dart';
import 'package:spotifyclone/common/textfield.dart';
import 'package:spotifyclone/common/widget/custom_snackbar.dart';
import 'package:spotifyclone/constants/constvalue.dart';
import 'package:spotifyclone/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  final GlobalKey<FormState> _formKey = GlobalKey();

  Future<void> signin({required String email, required String password}) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save(); // Save our form now.
      setState(() {
        isShow = true;
      });
      try {
        final userCrendential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Check if the user's email is verified
        if (userCrendential.user!.emailVerified) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.verifyEmailScreen);
        }

        print('Printing the login data.');
        print('Email: $email');
        print('Password: $password');
        print(userCrendential);
      } on FirebaseAuthException catch (e) {
        // Handle the exception.
        final errorMessage = e.code.toString();

        // Show a snackbar with the error message.
        showSnackBar(context: context, isError: true, text: errorMessage);
      } finally {
        setState(() {
          isShow = false;
        });
      }
    }
  }

  bool isShow = false;

  Future<void> signInWithGoogle() async {
    setState(() {
      isShow = true;
    });
    //begin interactive google sign in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //  obtian detail from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //  create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //  final lets sign in
    try {
      final userdata =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    } on FirebaseAuthException catch (e) {
      final errorMessage = e.code.toString();

      // Show a snackbar with the error message.
      showSnackBar(context: context, isError: true, text: errorMessage);
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
      resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: const EdgeInsets.all(bodyPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/logo.png', height: 150),
              ),
              const Text(
                'Login to your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.10,
                ),
              ),
              const Spacer(),
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
              const SizedBox(height: 20),
              CustomTextField(
                svgPath: 'assets/lock.svg',
                hint: 'Password',
                obsecrue: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "can't be empty";
                  } else if (value.length < 5) {
                    return 'password must greater than 5';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 20),
              CustomFilledLargeButton(
                text: 'Log in',
                onPressed: () => signin(email: email, password: password),
                width: double.infinity,
                height: 60,
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: isShow,
                child: Transform.scale(
                  scale: 0.4,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () =>Navigator.pushNamed(context, AppRoutes.forgotScreen),
                child: const Text(
                  'Forgot the password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF39C0D4),
                    fontSize: 14,
                    fontFamily: 'Century Gothic',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.63,
                  ),
                ),
              ),
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
                      "or Continue with",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildloginWith(
                      imgPath: 'assets/google.png',
                      onPressed: () => signInWithGoogle()),
                  buildloginWith(imgPath: 'assets/fb.png', onPressed: () =>signInWithFacebook(context: context)),
                  buildloginWith(imgPath: 'assets/apple.png', onPressed: () {
                    showSnackBar(context: context, isError: false, text: 'comming soon');
                  }),
                ],
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
                      'Sign Up',
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
      ),
    );
  }

  GestureDetector buildloginWith({required String imgPath, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 0.20,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFDAE7E7),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Image.asset(imgPath, fit: BoxFit.scaleDown),
      ),
    );
  }
}
