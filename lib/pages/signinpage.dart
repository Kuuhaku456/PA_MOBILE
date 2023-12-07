import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/pages/Home_Page.dart';
import 'package:posttest5_096_filipus_manik/pages/Screen.dart';
import 'package:posttest5_096_filipus_manik/pages/signuppage.dart';
import 'package:posttest5_096_filipus_manik/widget/Button.dart';
import 'package:posttest5_096_filipus_manik/widget/customsnackbar.dart';
import 'package:posttest5_096_filipus_manik/widget/imagebutton.dart';
import 'package:posttest5_096_filipus_manik/widget/passwordtextfield.dart';
import 'package:posttest5_096_filipus_manik/widget/textfield.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> signIn(String x, String y) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: x, password: y);
    return 'Berhasil Sign In';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password provided for that user.';
    }
  }
  return '';
}

class MySigninPage extends StatefulWidget {
  const MySigninPage({super.key});

  @override
  State<MySigninPage> createState() => _MySigninPageState();
}

class _MySigninPageState extends State<MySigninPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void showAlert(String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
    );
  }

  void showAlertSuccess(String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: message,
      onConfirmBtnTap: () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Screen()),
          (Route<dynamic> route) => false),
    );
  }

  void clearInputs() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  // void showSnackbar(BuildContext context, String? title, String? message,
  //     String? type, Color? backgroundColor) {
  //   final snackbar = SnackBar(
  //     elevation: 0,
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     content: MyCustomSnackbar(
  //         title: title,
  //         message: message,
  //         type: type,
  //         backgroundColor: backgroundColor),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF374259),
        appBar: AppBar(
          backgroundColor: const Color(0xFF374259),
          title: Text(
            'Sign in',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.yellow,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 24.0,
              bottom: 24.0,
              right: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/mushoku_tensei.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Welcome back,',
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.yellow),
                ),
                const SizedBox(height: 5),
                AutoSizeText(
                  '''Discover your Favorites and Creative 
Anime Here!''',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.yellow),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                MyTextField(
                    controller: emailController,
                    hintText: 'E-Mail',
                    prefixicon: const Icon(
                      Icons.mail,
                      color: Color(0xFF374259),
                    )),
                const SizedBox(height: 15),
                MyPasswordTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixicon: const Icon(
                    Icons.lock,
                    color: Color(0xFF374259),
                  ),
                ),
                Center(
                  child: MyButton(
                      onTap: () async {
                        if (passwordController.text == "" ||
                            emailController.text == "") {
                          showAlert('inputan tidak boleh kosong');
                        } else if (!RegExp(
                                r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                            .hasMatch(emailController.text)) {
                          showAlert('Format Email Salah');
                        } else {
                          String strung = await signIn(
                              emailController.text, passwordController.text);
                          if (strung == 'Berhasil Sign In') {
                            showAlertSuccess('Berhasil Sign In');
                            clearInputs();
                            // ignore: use_build_context_synchronously
                          } else {
                            showAlert('Email atau password salah!!!');
                          }
                        }
                      },
                      text: 'Sign In',
                      backgroundColor: Colors.yellow,
                      textColor: const Color(0xFF374259)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.yellow,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: GoogleFonts.poppins(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                MyImageButton(
                  onTap: () {},
                  imagepath: 'assets/facebook_icon.png',
                  labeltext: 'Continue with Facebook',
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                ),
                MyImageButton(
                  onTap: () {},
                  imagepath: 'assets/google_icon.png',
                  labeltext: 'Continue with Google',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 3),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.yellow,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MySignUpPage()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
