import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime_card.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/pages/detail_anime.dart';

Stream<QuerySnapshot> whoAmI() {
  // if(FirebaseAuth.instance.currentUser?.email != null){
  //   return FirebaseFirestore.instance.collection('anime').where('id', isEqualTo: 1).snapshots();
  // }
  return FirebaseFirestore.instance
      .collection("anime")
      .orderBy("score", descending: true)
      .snapshots();
}

class TopsAnimes extends StatefulWidget {
  const TopsAnimes({super.key});

  @override
  State<TopsAnimes> createState() => _TopsAnimesState();
}

class _TopsAnimesState extends State<TopsAnimes> {
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    isTapped = !isTapped;
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TOP CHARTS',
          style: GoogleFonts.poppins(
            fontSize: 25,
            color: Colors.yellow,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF374259),
      ),
      body: Container(
        width: lebar,
        height: tinggi,
        decoration: const BoxDecoration(
          color: Color(0xFF374259),
        ),
        child: StreamBuilder(
            stream: whoAmI(),
            builder: (context, snapshots) {
              switch (snapshots.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                                child: CircularProgressIndicator(),
                              );
                default:
                  List<Widget> createChildren() {
                    return List<Widget>.generate(snapshots.data!.docs.length,
                        (int index) {
                      bool ok = false;
                      return MyanimeCard(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return MyAnimeDetails(
                              id: 0,
                              sx: Anime(
                                  id: '1',
                                  judul: snapshots.data!.docs[index]['title'],
                                  Rating: snapshots.data!.docs[index]['score']
                                      .toString(),
                                  Episode: snapshots
                                      .data!.docs[index]['episodes']
                                      .toString(),
                                  sypnosis: snapshots.data!.docs[index]
                                      ['synopsis'],
                                  imagePath: snapshots.data!.docs[index]
                                      ['image'],
                                  genre: snapshots.data!.docs[index]
                                      ['genres']));
                        })),
                        indexs: index + 1,
                        id: snapshots.data!.docs[index]['mal_id'].toString(),
                        title: snapshots.data!.docs[index]['title'],
                        imagePath: snapshots.data!.docs[index]['image'],
                        rating: snapshots.data!.docs[index]['score'].toString(),
                        episode:
                            snapshots.data!.docs[index]['episodes'].toString(),
                        isFavorite: ok,
                      );
                    });
                  }
                  if (snapshots.hasError) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20,
                            right: MediaQuery.of(context).size.width / 20),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Anime ada error!',
                            style: GoogleFonts.poppins(
                              fontSize: MediaQuery.of(context).size.width / 20,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF374259),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    var ok = createChildren();
                    return ListView.builder(
                        itemCount: ok.length,
                        itemBuilder: (context, int index) {
                          return ok[index];
                        });
                  }
              }
            }),
      ),
    );
  }
}

