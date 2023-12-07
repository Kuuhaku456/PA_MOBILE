import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/pages/signinpage.dart';
import 'package:posttest5_096_filipus_manik/widget/Button.dart';
import 'package:posttest5_096_filipus_manik/widget/customsnackbar.dart';
import 'package:posttest5_096_filipus_manik/widget/passwordtextfield.dart';
import 'package:posttest5_096_filipus_manik/widget/textfield.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widget/imagebutton.dart';
import 'Screen.dart';

Future<String> regis(String x, String y) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: x, password: y);
    return "Berhasil Sign Up";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      return "password weak";
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      return "Email telah di pakai";
    }
  } catch (e) {
    print(e);
    return "error";
  }
  return "";
}

Future<void> addProfile(String x, String y) async {
  var db = FirebaseFirestore.instance;

  final data = <String, dynamic>{
    "username": x,
    "email": y,
    "phonenumber": "-",
    "usia": "-",
    "image": "",
    "favorit": []
  };

  await db
      .collection("users")
      .doc(y)
      .set(data)
      .onError((e, _) => print("Error writing document: $e"));
}

class MySignUpPage extends StatefulWidget {
  const MySignUpPage({super.key});

  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void showAlert(String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
    );
  }

  void showSnackbar(BuildContext context, String? title, String? message,
      String? type, Color? backgroundColor) {
    final snackbar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: MyCustomSnackbar(
          title: title,
          message: message,
          type: type,
          backgroundColor: backgroundColor),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showAlertSuccess(String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: message,
      onConfirmBtnTap: () => Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (BuildContext context) {
        return const MySigninPage();
      })),
    );
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

  void clearInputs() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF374259),
      appBar: AppBar(
        backgroundColor: const Color(0xFF374259),
        title: Text(
          'Sign up',
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
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              Text(
                'Lets, Create Your Account!',
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.yellow),
              ),
              const SizedBox(height: 20),
              MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  prefixicon: const Icon(
                    Icons.person,
                    color: Color(0xFF374259),
                  )),
              const SizedBox(height: 17),
              MyTextField(
                  controller: emailController,
                  hintText: 'E-Mail',
                  prefixicon: const Icon(
                    Icons.mail,
                    color: Color(0xFF374259),
                  )),
              const SizedBox(height: 17),
              MyPasswordTextField(
                controller: passwordController,
                hintText: 'Password',
                prefixicon: const Icon(
                  Icons.lock,
                  color: Color(0xFF374259),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'I aggree to ',
                          style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width / 30,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width / 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: 'and ',
                          style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width / 30,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Use',
                          style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width / 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: MyButton(
                    onTap: () async {
                      // car ok
                      if (passwordController.text == "" ||
                          emailController.text == "") {
                        showAlert('inputan tidak boleh kosong');
                      } else if (!RegExp(
                              r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                          .hasMatch(emailController.text)) {
                        showAlert('Format Email Salah');
                      } else {
                        String strung = await regis(
                            emailController.text, passwordController.text);
                        await addProfile(
                            usernameController.text, emailController.text);
                        if (strung == 'Berhasil Sign Up') {
                          showAlertSuccess('berhasil Sign in');
                          clearInputs();
                          // ignore: use_build_context_synchronously
                          // showSnackbar(
                          //     context,
                          //     'Berhasil!',
                          //     'Selamat Anda berhasil SignUp, Silahkan login terlebih dahulu!',
                          //     'Succes',
                          //     DefaultColors.successGreen);
                          // // ignore: use_build_context_synchronously
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const MySigninPage()),
                          // );
                        } else {
                          showAlert(strung);
                        }
                      }
                    },
                    text: 'Sign Up',
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an Account?',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.yellow,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              CupertinoPageRoute(
                                  builder: (BuildContext context) {
                            return const MySigninPage();
                          }));
                        },
                        child: Text(
                          'Sign In',
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
      ),
    );
  }
}
