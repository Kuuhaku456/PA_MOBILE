import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/pages/edit_profile.dart';
import 'package:posttest5_096_filipus_manik/pages/signinpage.dart';
import 'package:posttest5_096_filipus_manik/widget/Button.dart';
import 'package:posttest5_096_filipus_manik/widget/button_bulat.dart';

String username = '-';
String usia = '-';
String no_telp = '-';
String? email = '-';
Stream<QuerySnapshot> whoAmI() {
  return FirebaseFirestore.instance.collection('users').snapshots();
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});
  @override
  // ignore: no_logic_in_create_state
  State<MyProfile> createState() {
    var user = FirebaseAuth.instance.currentUser;

    final userRef = FirebaseFirestore.instance.collection('users');
    userRef.get().then((snapshot) {
      for (var doc in snapshot.docs) {
        if (doc.data()['email'] == user?.email) {
          username = doc.data()['username'];
          usia = doc.data()['usia'];
          no_telp = doc.data()['phonenumber'];
          email = doc.data()['email'];
        }
      }
    });

    return _MyProfileState();
  }
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF374259),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: lebar,
                height: tinggi / 2.10,
              ),
              Container(
                width: lebar,
                height: tinggi / 2.5,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(350),
                      bottomRight: Radius.circular(350)),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 15,
                left: MediaQuery.of(context).size.width / 3.2,
                child: Container(
                  width: lebar / 2.5,
                  height: tinggi / 2.5,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/logo-wallpaper.jpeg'),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: MyCircleButton(
                  icon: Icons.favorite,
                  onPressed: () {
                    print(username);
                    print(email);
                    print(usia);
                  },
                ),
              ),
            ],
          ),
          Center(
            child: AutoSizeText(
              'I work at EDLAC and I am intrested in meeting a hardworking and loving man. I,m your girl.',
              style: GoogleFonts.poppins(
                fontSize: MediaQuery.of(context).size.width / 20,
                fontWeight: FontWeight.w600,
                color: Colors.yellow[600],
              ),
              maxLines: 5,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: lebar,
            height: tinggi / 1.7,
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF374259),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 8, offset: Offset(0, 4), spreadRadius: 1.0)
                ]),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(left: 10, top: 20),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/logo-wallpaper.jpeg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Details',
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.yellow),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.yellow, //color of divider
                  height: 5, //height spacing of divider
                  thickness: 3, //thickness of divier line
                  indent: 10, //spacing at the start of divider
                  endIndent: 10, //spacing at the end of divider
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    AutoSizeText(
                      'Username',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 4),
                    StreamBuilder(
                        stream: whoAmI(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return AutoSizeText(
                                "Loading.... data",
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            default:
                              var user = FirebaseAuth.instance.currentUser;
                              final userRef = FirebaseFirestore.instance
                                  .collection('users');
                              userRef.get().then((snapshot) {
                                for (var doc in snapshot.docs) {
                                  if (doc.data()['email'] == user?.email) {
                                    username = doc.data()['username'];
                                    usia = doc.data()['usia'];
                                    no_telp = doc.data()['phonenumber'];
                                    email = doc.data()['email'];
                                  }
                                }
                              });
                              if (snapshot.hasError) {
                                return AutoSizeText(
                                  'Error saat membaca data...',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.yellow),
                                );
                              } else {
                                return AutoSizeText(
                                  username,
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.yellow),
                                );
                              }
                          }
                        })
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    AutoSizeText(
                      'Usia',
                      style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 1.5),
                    StreamBuilder(
                        stream: whoAmI(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return AutoSizeText(
                                "Loading.... data",
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            default:
                              var user = FirebaseAuth.instance.currentUser;
                              final userRef = FirebaseFirestore.instance
                                  .collection('users');
                              userRef.get().then((snapshot) {
                                for (var doc in snapshot.docs) {
                                  if (doc.data()['email'] == user?.email) {
                                    username = doc.data()['username'];
                                    usia = doc.data()['usia'];
                                    no_telp = doc.data()['phonenumber'];
                                    email = doc.data()['email'];
                                  }
                                }
                              });
                              if (snapshot.hasError) {
                                return AutoSizeText(
                                  'Error saat membaca data...',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.yellow),
                                );
                              } else {
                                return Text(
                                  usia,
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.yellow),
                                );
                              }
                          }
                        })
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    AutoSizeText(
                      'No.Telp',
                      style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 4),
                    StreamBuilder(
                        stream: whoAmI(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return AutoSizeText(
                                "Loading.... data",
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            default:
                              var user = FirebaseAuth.instance.currentUser;
                              final userRef = FirebaseFirestore.instance
                                  .collection('users');
                              userRef.get().then((snapshot) {
                                for (var doc in snapshot.docs) {
                                  if (doc.data()['email'] == user?.email) {
                                    username = doc.data()['username'];
                                    usia = doc.data()['usia'];
                                    no_telp = doc.data()['phonenumber'];
                                    email = doc.data()['email'];
                                  }
                                }
                              });
                              if (snapshot.hasError) {
                                return AutoSizeText(
                                  'Error saat membaca data...',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.yellow),
                                );
                              } else {
                                return Text(
                                  no_telp,
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.yellow),
                                );
                              }
                          }
                        })
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    AutoSizeText(
                      'Email',
                      style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 16),
                    StreamBuilder(
                        stream: whoAmI(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return AutoSizeText(
                                "Loading.... data",
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            default:
                              var user = FirebaseAuth.instance.currentUser;
                              final userRef = FirebaseFirestore.instance
                                  .collection('users');
                              userRef.get().then((snapshot) {
                                for (var doc in snapshot.docs) {
                                  if (doc.data()['email'] == user?.email) {
                                    username = doc.data()['username'];
                                    usia = doc.data()['usia'];
                                    no_telp = doc.data()['phonenumber'];
                                    email = doc.data()['email'];
                                  }
                                }
                              });
                              if (snapshot.hasError) {
                                return AutoSizeText(
                                  'Error saat membaca data...',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.yellow),
                                );
                              } else {
                                return Text(
                                  email ?? '-',
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.yellow,
                                  ),
                                );
                              }
                          }
                        })
                  ],
                ),
                const SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyButton(
                    onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute(builder: (BuildContext context) {
                      return MyEditProfile(
                        username: username,
                        email: email,
                        usia: usia,
                        no_telp: no_telp,
                      );
                    })),
                    text: 'Edit',
                    backgroundColor: Colors.yellow,
                    textColor: const Color(0xFF374259),
                  ),
                ),
                const SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyButton(
                    onTap: () async {
                      while (true) {
                        try {
                          await FirebaseAuth.instance.signOut();
                          break;
                        } catch (e) {
                          print('error');
                        }
                      }
                    },
                    text: 'Log out',
                    backgroundColor: Colors.yellow,
                    textColor: const Color(0xFF374259),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyButton(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MySigninPage();
                      }));
                    },
                    text: 'Delete Account',
                    backgroundColor: Colors.yellow,
                    textColor: const Color(0xFF374259),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
