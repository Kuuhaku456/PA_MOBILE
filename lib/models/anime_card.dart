import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/pages/Tops_animes.dart';
import 'package:posttest5_096_filipus_manik/pages/profile.dart';
import 'package:posttest5_096_filipus_manik/pages/signinpage.dart';

class MyanimeCard extends StatefulWidget {
  final Function()? onTap;
  final String id;
  final int indexs;
  final String title;
  final String imagePath;
  bool isFavorite;
  final String rating;
  final String episode;
  final Function()? handleTap;
  final bool isTapped;
  MyanimeCard({
    required this.onTap,
    required this.id,
    this.isFavorite = false,
    required this.title,
    required this.indexs,
    required this.imagePath,
    required this.rating,
    required this.episode,
    this.isTapped = false,
    this.handleTap,
  });

  @override
  State<MyanimeCard> createState() => _MyanimeCardState();
}

class _MyanimeCardState extends State<MyanimeCard> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    Color containerColor =
        widget.isTapped ? Colors.grey : const Color(0xFF374259);
    Color textColor = widget.isTapped ? Colors.yellow : Colors.yellow;
    Color iconColor = widget.isTapped ? Colors.yellow : Colors.yellow;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: lebar,
        height: 150,
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: lebar / 10,
              height: 130,
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF374259),
              ),
              child: Center(
                child: Text(
                  '${widget.indexs}',
                  style: GoogleFonts.poppins(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 10, top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                widget.imagePath,
              ),
            ),
            Container(
              width: lebar / 2.9,
              height: 150,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              // decoration: BoxDecoration(color: Colors.green),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        padding: const EdgeInsets.only(top: 10),
                        // decoration: BoxDecoration(color: Colors.red),
                        child: AutoSizeText(
                          widget.title,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF374259),
                            fontSize: 27,
                          ),
                          maxLines: 2,
                        ),
                      );
                    }),
                  ),
                  Container(
                    width: lebar / 2.9,
                    height: 70,
                    decoration: const BoxDecoration(
                        // color: Colors.blue
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.episode} eps',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF374259),
                            fontSize: 20,
                          ),
                        ),
                        AnimatedContainer(
                          width: lebar / 4.5,
                          height: 40,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: containerColor,
                              boxShadow: const [
                                BoxShadow()
                              ]), // Durasi animasi. // Ganti warna kontainer sesuai kondisi.
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.grade,
                                  color: iconColor, // Atur warna ikon.
                                  size: 25,
                                ),
                                Text(
                                  widget.rating,
                                  style: GoogleFonts.poppins(
                                    color: textColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // IconButton(
            //   icon: widget.isFavorite
            //       ? Icon(Icons.favorite)
            //       : Icon(Icons.favorite_border),
            //   iconSize: 40,
            //   color: widget.isFavorite ? Color(0xFF374259) : null,
            //   onPressed: () async {
            //     if (FirebaseAuth.instance.currentUser?.ema == null) {
            //       Navigator.of(context).pushReplacement(
            //           CupertinoPageRoute(builder: (BuildContext context) {
            //         return MySigninPage();
            //       }));
            //     }
            //     if (widget.isFavorite) {
            //       widget.isFavorite = false;

            //       final equipmentCollection = FirebaseFirestore.instance
            //           .collection("users")
            //           .doc(FirebaseAuth.instance.currentUser!.email);

            //       final docSnap = await equipmentCollection.get();

            //       List queue = docSnap.get('favorit');

            //       if (queue.contains(widget.id) == true) {
            //         equipmentCollection.update({
            //           "favorit": FieldValue.arrayRemove([widget.id])
            //         });
            //       }
            //     } else {
            //       widget.isFavorite = true;
            //       final docRef = FirebaseFirestore.instance
            //           .collection("users")
            //           .doc(FirebaseAuth.instance.currentUser!.email);
            //       await docRef.set({
            //         'favorit': FieldValue.arrayUnion([widget.id]),
            //       }, SetOptions(merge: true));
            //     }
            //     setState(() {});

            //     // Navigator.of(context).pushReplacement(
            //     //     CupertinoPageRoute(builder: (BuildContext context) {
            //     //   return TopsAnimeView();
            //     // }));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
