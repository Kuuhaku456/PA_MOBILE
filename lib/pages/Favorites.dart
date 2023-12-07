import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime_card.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/pages/detail_anime.dart';
import 'package:posttest5_096_filipus_manik/provider/anime_favorite_notifier.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';



Stream<QuerySnapshot> whoAmI() {
  return FirebaseFirestore.instance.collection("anime").snapshots();
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
    return Scaffold(
      backgroundColor: const Color(0xFF374259),
      appBar: AppBar(
        backgroundColor: const Color(0xFF374259),
        title: const Text('Favorites Anime'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: whoAmI(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
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
              default:
                // var user = FirebaseAuth.instance.currentUser;

                // if (user != null) {
                // final userRef =
                // FirebaseFirestore.instance.collection('users');
                // userRef.get().then((snapshot) {
                // Widget ok;
                // for (var doc in snapshot.data!.docs) {
                List<Widget> createChildren() {
                  
                  return List<Widget>.generate(snapshot.data!.docs.length,
                      (int index) {
                    return MyanimeCard(
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return MyAnimeDetails(
                            id: 0,
                            sx: Anime(
                                id: '1',
                                judul: snapshot.data!.docs[index]['title'],
                                Rating: snapshot.data!.docs[index]['score']
                                    .toString(),
                                Episode: snapshot.data!.docs[index]['episodes']
                                    .toString(),
                                sypnosis: snapshot.data!.docs[index]
                                    ['synopsis'],
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
                      episode:
                          snapshot.data!.docs[index]['episodes'].toString(),
                      isFavorite: false,
                    );
                  });
                  // }
                  // return MyanimeCard(
                  //     onTap: () {},
                  //     index: doc['mal_id'].toString(),
                  //     title: doc['title'],
                  //     imagePath: doc['image'],
                  //     rating: doc['score'].toString(),
                  //     episode: doc['episodes'].toString(),
                  //     isFavorite: false,
                  //     handleTap: () {
                  //       // toggleFavorite(provider.getAnime[index]);
                  //       // setState(() {
                  //       //   ListTopAnime[index].isFavorite = !ListTopAnime[index].isFavorite;
                  //       // });
                  //     });
                }
                // createChildren();
                if (snapshot.hasError) {
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
                } else {
                  var ok = createChildren();
                  return ListView.builder(
                      itemCount: ok.length,
                      itemBuilder: (context, int index) {
                        return ok[index];
                      });
                }
              // return ok;
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
    );
  }
}
