import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/pages/Screen.dart';
import 'package:posttest5_096_filipus_manik/pages/edit_profile.dart';
import 'package:posttest5_096_filipus_manik/pages/settings.dart';
import 'package:posttest5_096_filipus_manik/pages/signinpage.dart';
import 'package:posttest5_096_filipus_manik/widget/Button.dart';
import 'package:posttest5_096_filipus_manik/widget/button_bulat.dart';

String username = '-';
String usia = '-';
String no_telp = '-';
String? email = '-';
String profil = 'https://avatars.githubusercontent.com/Kuuhaku456';

void jalan() async {}

Stream<QuerySnapshot> whoAmI() {
  return FirebaseFirestore.instance.collection('users').snapshots();
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<MyProfile> createState() {
    // }

    return _MyProfileState();
  }
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF374259)
          : Colors.white,
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
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.yellow
                      : const Color(0xFF374259),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(350),
                      bottomRight: Radius.circular(350)),
                ),
              ),
              StreamBuilder(
                  stream: whoAmI(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Positioned(
                          top: MediaQuery.of(context).size.height / 15,
                          left: MediaQuery.of(context).size.width / 3.2,
                          child: Container(
                            width: lebar / 2.5,
                            height: tinggi / 2.5,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(profil),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        );
                      default:
                        // var user = FirebaseAuth.instance.currentUser;

                        // if (user != null) {
                        // final userRef =
                        // FirebaseFirestore.instance.collection('users');
                        // userRef.get().then((snapshot) {
                        for (var doc in snapshot.data!.docs) {
                          if (doc['email'] ==
                              FirebaseAuth.instance.currentUser?.email) {
                            username = doc['username'];
                            usia = doc['usia'];
                            no_telp = doc['phonenumber'];
                            email = doc['email'];
                            if (doc['image'] != '') profil = doc['image'];
                          }
                        }
                    }

                    if (snapshot.hasError) {
                      return Positioned(
                        top: MediaQuery.of(context).size.height / 15,
                        left: MediaQuery.of(context).size.width / 3.2,
                        child: Container(
                          width: lebar / 2.5,
                          height: tinggi / 2.5,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(profil),
                                fit: BoxFit.cover,
                              )),
                        ),
                      );
                    } else {
                      return Positioned(
                        top: MediaQuery.of(context).size.height / 15,
                        left: MediaQuery.of(context).size.width / 3.2,
                        child: Container(
                          width: lebar / 2.5,
                          height: tinggi / 2.5,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(profil),
                                fit: BoxFit.cover,
                              )),
                        ),
                      );
                    }
                  }),
              Positioned(
                top: 20,
                right: 20,
                child: MyCircleButton(
                  icon: Icons.settings,
                  onPressed: () => Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (BuildContext context) {
                    return const MySettingsPage();
                  })),
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
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.yellow
                    : Colors.black,
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
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF374259)
                    : Colors.white,
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
                    StreamBuilder(
                        stream: whoAmI(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Container(
                                width: 50,
                                height: 50,
                                margin:
                                    const EdgeInsets.only(left: 10, top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(profil),
                                      fit: BoxFit.cover,
                                    )),
                              );
                            default:
                              for (var doc in snapshot.data!.docs) {
                                if (doc['email'] ==
                                    FirebaseAuth.instance.currentUser?.email) {
                                  username = doc['username'];
                                  usia = doc['usia'];
                                  no_telp = doc['phonenumber'];
                                  email = doc['email'];
                                  if (doc['image'] != '') profil = doc['image'];
                                }
                              }
                              if (snapshot.hasError) {
                                return Container(
                                  width: 50,
                                  height: 50,
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(profil),
                                        fit: BoxFit.cover,
                                      )),
                                );
                              } else {
                                return Container(
                                  width: 50,
                                  height: 50,
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(profil),
                                        fit: BoxFit.cover,
                                      )),
                                );
                              }
                          }
                        }),
                    const SizedBox(width: 20),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Details',
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.yellow
                                    : Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.yellow
                      : Colors.black, //color of divider
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
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.yellow
                              : Colors.black),
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
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.yellow
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            default:
                              for (var doc in snapshot.data!.docs) {
                                if (doc['email'] ==
                                    FirebaseAuth.instance.currentUser?.email) {
                                  username = doc['username'];
                                  usia = doc['usia'];
                                  no_telp = doc['phonenumber'];
                                  email = doc['email'];
                                  if (doc['image'] != '') profil = doc['image'];
                                }
                              }
                              if (snapshot.hasError) {
                                return AutoSizeText(
                                  'Error saat membaca data...',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.yellow
                                          : Colors.black),
                                );
                              } else {
                                return AutoSizeText(
                                  username,
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.yellow
                                          : Colors.black),
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
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.yellow
                              : Colors.black),
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
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.yellow
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            default:
                              for (var doc in snapshot.data!.docs) {
                                if (doc['email'] ==
                                    FirebaseAuth.instance.currentUser?.email) {
                                  username = doc['username'];
                                  usia = doc['usia'];
                                  no_telp = doc['phonenumber'];
                                  email = doc['email'];
                                  if (doc['image'] != '') profil = doc['image'];
                                }
                              }
                              // var user = FirebaseAuth.instance.currentUser;
                              // final userRef = FirebaseFirestore.instance
                              //     .collection('users');
                              // userRef.get().then((snapshot) {
                              //   for (var doc in snapshot.docs) {
                              //     if (doc.data()['email'] == user?.email) {
                              //       username = doc.data()['username'];
                              //       usia = doc.data()['usia'];
                              //       no_telp = doc.data()['phonenumber'];
                              //       email = doc.data()['email'];
                              //     }
                              //   }
                              // });
                              if (snapshot.hasError) {
                                return AutoSizeText(
                                  'Error saat membaca data...',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.yellow
                                          : Colors.black),
                                );
                              } else {
                                return Text(
                                  usia,
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.yellow
                                          : Colors.black),
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
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.yellow
                              : Colors.black),
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
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.yellow
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            default:
                              for (var doc in snapshot.data!.docs) {
                                if (doc['email'] ==
                                    FirebaseAuth.instance.currentUser?.email) {
                                  username = doc['username'];
                                  usia = doc['usia'];
                                  no_telp = doc['phonenumber'];
                                  email = doc['email'];
                                  if (doc['image'] != '') profil = doc['image'];
                                }
                              }
                              // var user = FirebaseAuth.instance.currentUser;
                              // final userRef = FirebaseFirestore.instance
                              //     .collection('users');
                              // userRef.get().then((snapshot) {
                              //   for (var doc in snapshot.docs) {
                              //     if (doc.data()['email'] == user?.email) {
                              //       username = doc.data()['username'];
                              //       usia = doc.data()['usia'];
                              //       no_telp = doc.data()['phonenumber'];
                              //       email = doc.data()['email'];
                              //     }
                              //   }
                              // });
                              if (snapshot.hasError) {
                                return AutoSizeText(
                                  'Error saat membaca data...',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.yellow
                                          : Colors.black),
                                );
                              } else {
                                return Text(
                                  no_telp,
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.yellow
                                          : Colors.black),
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
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.yellow
                              : Colors.black),
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
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.yellow
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            default:
                              for (var doc in snapshot.data!.docs) {
                                if (doc['email'] ==
                                    FirebaseAuth.instance.currentUser?.email) {
                                  username = doc['username'];
                                  usia = doc['usia'];
                                  no_telp = doc['phonenumber'];
                                  email = doc['email'];
                                  if (doc['image'] != '') profil = doc['image'];
                                }
                              }
                              // var user = FirebaseAuth.instance.currentUser;
                              // final userRef = FirebaseFirestore.instance
                              //     .collection('users');
                              // userRef.get().then((snapshot) {
                              //   for (var doc in snapshot.docs) {
                              //     if (doc.data()['email'] == user?.email) {
                              //       username = doc.data()['username'];
                              //       usia = doc.data()['usia'];
                              //       no_telp = doc.data()['phonenumber'];
                              //       email = doc.data()['email'];
                              //     }
                              //   }
                              // });
                              if (snapshot.hasError) {
                                return AutoSizeText(
                                  'Error saat membaca data...',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.yellow
                                          : Colors.black),
                                );
                              } else {
                                return Text(
                                  email ?? '-',
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.yellow
                                        : Colors.black,
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
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF374259)
                            : Colors.black,
                    textColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.yellow
                        : Colors.white,
                  ),
                ),
                const SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyButton(
                    onTap: () async {
                      while (true) {
                        try {
                          if (FirebaseAuth.instance.currentUser != null) {
                            await FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Screen()),
                                (Route<dynamic> route) => false);
                            break;
                          }
                        } catch (e) {
                          print('error');
                        }
                      }
                    },
                    text: 'Log out',
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF374259)
                            : Colors.black,
                    textColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.yellow
                        : Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyButton(
                    onTap: () async {
                      await FirebaseAuth.instance.currentUser!.delete();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Screen()),
                          (Route<dynamic> route) => false);
                    },
                    text: 'Delete Account',
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF374259)
                            : Colors.black,
                    textColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.yellow
                        : Colors.white,
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
