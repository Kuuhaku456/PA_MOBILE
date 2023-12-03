import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posttest5_096_filipus_manik/pages/Screen.dart';
import 'package:posttest5_096_filipus_manik/pages/profile.dart';
import 'package:posttest5_096_filipus_manik/widget/Button.dart';
import 'package:posttest5_096_filipus_manik/widget/emailTextfield.dart';
import 'package:posttest5_096_filipus_manik/widget/passwordtextfield.dart';
import 'package:posttest5_096_filipus_manik/widget/textfield.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

Stream<QuerySnapshot> whoAmI() {
  return FirebaseFirestore.instance.collection('users').snapshots();
}

class MyEditProfile extends StatefulWidget {
  final username;
  final email;
  final usia;
  final no_telp;
  const MyEditProfile({
    super.key,
    required this.username,
    required this.email,
    required this.usia,
    required this.no_telp,
  });

  @override
  // ignore: no_logic_in_create_state
  State<MyEditProfile> createState() => _MyEditProfileState();
}

class _MyEditProfileState extends State<MyEditProfile> {
  File? _profileImage;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController usiaController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void showAlert(String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
    );
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      }
    });
  }

  Future<String> _uploadImage() async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('profile_images/${DateTime.now()}.png');
    UploadTask uploadTask = storageReference.putFile(_profileImage!);
    await uploadTask.whenComplete(() => null);
    return await storageReference.getDownloadURL();
  }

  void showAlertSuccess(String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: message,
      onConfirmBtnTap: () => Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (BuildContext context) {
        return const Screen();
      })),
    );
  }

  void clearInputs() {
    usernameController.clear();
    emailController.clear();
  }

  @override
  void dispose() {
    // Pastikan untuk membersihkan kontroler ketika widget dihapus
    usernameController.dispose();
    emailController.dispose();
    usiaController.dispose();
    noTelpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    emailController.text = email!;
    usernameController.text = username;
    usiaController.text = usia;
    noTelpController.text = no_telp;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF374259),
        appBar: AppBar(
          title: Text(
            'Edit Profile',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.yellow,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color(0xFF374259),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Lets Edit your profile!',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _getImage();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _profileImage != null
                          ? Image.file(_profileImage!, fit: BoxFit.cover)
                          : const Icon(Icons.add_a_photo, size: 40),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                      controller: usernameController,
                      hintText: 'username',
                      prefixicon: const Icon(
                        Icons.person,
                        color: Color(0xFF374259),
                      )),
                  const SizedBox(height: 20),
                  MyTextField(
                      controller: usiaController,
                      hintText: 'usia',
                      prefixicon: const Icon(
                        Icons.child_care,
                        color: Color(0xFF374259),
                      )),
                  const SizedBox(height: 20),
                  MyTextField(
                      controller: noTelpController,
                      hintText: 'no_telp',
                      prefixicon: const Icon(
                        Icons.call,
                        color: Color(0xFF374259),
                      )),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 5),
                    child: MyButton(
                        onTap: () {
                          if (usernameController.text == "" ||
                              usiaController.text == "" ||
                              noTelpController.text == "") {
                            showAlert('inputan tidak boleh kosong');
                          } else if (!RegExp(
                                  r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                              .hasMatch(emailController.text)) {
                            showAlert('Format Email Salah');
                          } else {
                            var user = FirebaseAuth.instance.currentUser;
                            final docRef = FirebaseFirestore.instance
                                .collection("users")
                                .doc(email);
                            final updates = <String, dynamic>{
                              "username": usernameController.text,
                              "usia": usiaController.text,
                              "phonenumber": noTelpController.text,
                              "image":  _profileImage != null ? _uploadImage() : "",
                            };
                            docRef.update(updates).then(
                                (value) => showAlertSuccess(
                                    'Profile Updated Succesfully!'),
                                onError: (e) =>
                                    print("Error updating document $e"));
                            showAlertSuccess('Profile Berhasil diupdate');
                            clearInputs();
                          }
                        },
                        text: 'Save Changes',
                        backgroundColor: Colors.yellow,
                        textColor: const Color(0xFF374259)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
