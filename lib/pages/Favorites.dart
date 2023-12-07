import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime_card.dart';
import 'package:posttest5_096_filipus_manik/models/anime_cards.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/pages/detail_anime.dart';
import 'package:posttest5_096_filipus_manik/provider/anime_favorite_notifier.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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
          'Anime Favorite Anda Tidak ada!',
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
    if (!kk) {
      continue;
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
  return FirebaseFirestore.instance
      .collection("anime")
      .orderBy("score", descending: true)
      .snapshots();
}

Stream<QuerySnapshot> whoAmIs() {
  return FirebaseFirestore.instance.collection("users").snapshots();
}

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  void showErrorAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Sorry, something went wrong',
    );
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFF374259),
        appBar: AppBar(
          backgroundColor: const Color(0xFF374259),
          title: const Text('Favorites Anime'),
          centerTitle: true,
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
                    return kosong(context);
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
          //   Consumer<AnimeFavoriteNotifier>(builder: (context, provider, child) {
          // if (provider.getAnime.isNotEmpty) {
          //   return ListView.builder(
          //       itemCount: provider.getAnime.length,
          //       itemBuilder: (context, index) {
          //         return MyanimeCard(
          //           onTap: () {},
          //           indexs: 1,
          //           index: index.toString(),
          //           title: provider.getAnime[index].judul,
          //           imagePath: provider.getAnime[index].imagePath,
          //           rating: provider.getAnime[index].Rating,
          //           episode: provider.getAnime[index].Episode.toString(),
          //           isFavorite: provider.getAnime[index].isFavorite,
          //           handleTap: () {
          //             provider.deleteToFavorite(index);
          //           },
          //         );
          //       });
          // }
          // return Center(
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height / 3,
          //     margin: EdgeInsets.only(
          //         left: MediaQuery.of(context).size.width / 20,
          //         right: MediaQuery.of(context).size.width / 20),
          //     decoration: BoxDecoration(
          //       color: Colors.yellow,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: Center(
          //       child: Text(
          //         'Anime Favorite Anda Tidak ada!',
          //         style: GoogleFonts.poppins(
          //           fontSize: MediaQuery.of(context).size.width / 20,
          //           fontWeight: FontWeight.w600,
          //           color: const Color(0xFF374259),
          //         ),
          //       ),
          //     ),
          //   ),
          // );
        ));
  }
}
