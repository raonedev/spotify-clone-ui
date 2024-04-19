import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotifyclone/routes/app_routes.dart';
import '../../common/buttons/button_filledglow.dart';
import '../../common/textfield.dart';
import '../../common/widget/custom_snackbar.dart';
import '../../common/widget/dialog.dart';
import '../../constants/constvalue.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = '';
  String password = '';
  String cpassword = '';
  bool isShow = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  void signup(String email, String password) async {
    setState(() {
      isShow = true;
    });
    try {
      final userCrendential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Send email verification
      await userCrendential.user?.sendEmailVerification();
      showAlertDialog(
        context: context,
        title: 'Email verification sent',
        subtitle: 'mail sent to ${userCrendential.user?.email}',
        onTap: () {
          Navigator.pushReplacementNamed(context, AppRoutes.logInScreen);
        },
      );
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

  signInWithGoogle() async {
    isShow = true;
    //begin interactive google sign in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //  obtian detail from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //  create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //  final lets sign in
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    } on FirebaseAuthException catch (e) {
      setState(() {
        isShow = false;
      });
      final errorMessage = e.code.toString();

      // Show a snackbar with the error message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register to create account',
                textAlign: TextAlign.center,
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
              const SizedBox(height: 20),
              CustomTextField(
                svgPath: 'assets/lock.svg',
                hint: 'Password',
                obsecrue: true,
                onChanged: (p0) {
                  password = p0;
                },
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
              CustomTextField(
                svgPath: 'assets/lock.svg',
                hint: 'confirm-Password',
                obsecrue: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "must not be empty";
                  } else if (value != password) {
                    return "password should be match";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  cpassword = value;
                },
              ),
              const SizedBox(height: 20),

              CustomFilledLargeButton(
                  text: 'Sign Up',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      signup(email, password);
                    }
                  },
                  width: double.infinity,
                  height: 60),
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
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
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
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildloginWith(
                      imgPath: 'assets/google.png',
                      onPressed: () async {
                        signInWithGoogle();
                      }),
                  buildloginWith(imgPath: 'assets/fb.png', onPressed: () =>signInWithFacebook(context: context)),
                  buildloginWith(imgPath: 'assets/apple.png', onPressed: () {}),
                ],
              ),
              // const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Already have a account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.72,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'login',
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

  GestureDetector buildloginWith(
      {required String imgPath, required VoidCallback onPressed}) {
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
