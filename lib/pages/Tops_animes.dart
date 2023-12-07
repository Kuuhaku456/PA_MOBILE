import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime_card.dart';
import 'package:posttest5_096_filipus_manik/models/anime_cards.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/pages/detail_anime.dart';

Center kosong(context) {
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
          'Error dalam pengambilan anime',
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width / 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF374259),
          ),
        ),
      ),
    ),
  );
}

List<Widget> createChildren(context, snapshot, snapshots) {
  List<String> oks = [];
  for (var lp in snapshots.data!.docs) {
    if (lp['email'] == (FirebaseAuth.instance.currentUser?.email ?? '')) {
      for (var lpp in lp['favorit']) {
        oks.add(lpp);
      }
    }
  }
  List<Widget> ok = [];
  for (int index = 0; index < snapshot.data!.docs.length; index++) {
    bool kk = false;
    for (var oksx in oks) {
      if (snapshot.data!.docs[index]['mal_id'].toString() == oksx) {
        kk = true;
      }
    }
    ok.add(MyanimeCards(
      onTap: () => Navigator.of(context)
          .push(CupertinoPageRoute(builder: (BuildContext context) {
        return MyAnimeDetails(
            id: 0,
            sx: Anime(
                id: snapshot.data!.docs[index]['mal_id'].toString(),
                judul: snapshot.data!.docs[index]['title'],
                Rating: snapshot.data!.docs[index]['score'].toString(),
                Episode: snapshot.data!.docs[index]['episodes'].toString(),
                sypnosis: snapshot.data!.docs[index]['synopsis'],
                imagePath: snapshot.data!.docs[index]['image'],
                genre: snapshot.data!.docs[index]['genres']));
        //                         int id;
        // String judul;
        // List<String> genre;
        // String sinopsis;
        // List<String> karakter;
        // List<String> studio;
        // double rating;
        // String imagePath;
        // String ? status;
        // String ? hari;
        // int ? episode;
      })),
      indexs: index + 1,
      id: snapshot.data!.docs[index]['mal_id'].toString(),
      title: snapshot.data!.docs[index]['title'],
      imagePath: snapshot.data!.docs[index]['image'],
      rating: snapshot.data!.docs[index]['score'].toString(),
      episode: snapshot.data!.docs[index]['episodes'].toString(),
      isFavorite: kk,
    ));
  }
  return ok;
}

Stream<QuerySnapshot> whoAmI() {
  // if(FirebaseAuth.instance.currentUser?.email != null){
  //   return FirebaseFirestore.instance.collection('anime').where('id', isEqualTo: 1).snapshots();
  // }
  return FirebaseFirestore.instance
      .collection("anime")
      .orderBy("score", descending: true)
      .snapshots();
}

Stream<QuerySnapshot> whoAmIs() {
  return FirebaseFirestore.instance.collection("users").snapshots();
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
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const  Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return kosong(context);
                  } else {
                    return StreamBuilder(
                        stream: whoAmIs(),
                        builder: (context, snapshots) {
                          switch (snapshots.connectionState) {
                            case ConnectionState.waiting:
                              return kosong(context);
                            default:
                              if (snapshots.hasError) {
                                return kosong(context);
                              } else {
                                var ok = createChildren(
                                    context, snapshot, snapshots);
                                if (ok.isEmpty) {
                                  return kosong(context);
                                }
                                return ListView.builder(
                                    itemCount: ok.length,
                                    itemBuilder: (context, int index) {
                                      return ok[index];
                                    });
                              }
                          }
                        });
                  }
              }
            }),
      ),
    );
  }
}
