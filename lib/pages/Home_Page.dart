import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime.dart';
import 'package:posttest5_096_filipus_manik/models/anime_card.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/pages/Favorites.dart';
import 'package:posttest5_096_filipus_manik/pages/detail_anime.dart';
import 'package:posttest5_096_filipus_manik/pages/genre_page.dart';
import 'package:posttest5_096_filipus_manik/pages/signinpage.dart';
import 'package:posttest5_096_filipus_manik/widget/anime_cards.dart';
import 'package:posttest5_096_filipus_manik/widget/genrebutton.dart';
import 'package:posttest5_096_filipus_manik/widget/gridview_card.dart';
import 'package:posttest5_096_filipus_manik/widget/seasons_button.dart';
import 'package:posttest5_096_filipus_manik/widget/slide_item.dart';

String pl = 'https://avatars.githubusercontent.com/Kuuhaku456';

Stream<QuerySnapshot> whoAmI() {
  return FirebaseFirestore.instance.collection('users').snapshots();
}

Stream<QuerySnapshot> whoAmIs() {
  return FirebaseFirestore.instance.collection('anime').snapshots();
}

Stream<QuerySnapshot> whoAmIss() {
  return FirebaseFirestore.instance.collection('Now').snapshots();
}

class HomePage extends StatefulWidget {
  final id;
  final Animes? anime;
  const HomePage({
    super.key,
    this.id,
    this.anime,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int id = 0;
  var rng = Random();
  void onTapped(int passid) {
    id = passid;
  }

  int _currentIndex = 0;

  List<Widget> _slides = [];

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    final List<int> randoms = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF374259),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('CrunchRyoll',
              style: GoogleFonts.poppins(
                  color: Colors.yellow,
                  fontSize: lebar / 15,
                  fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.authStateChanges().listen((User? user) {
              if (user == null) {
                Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(builder: (BuildContext context) {
                  return const MySigninPage();
                }));
              }
              print(user?.email);
            });
          },
          child: ListView(
            children: [
              StreamBuilder(
                  stream: whoAmI(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Container(
                          height: 150,
                          width: 150,
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(pl),
                              fit: BoxFit.scaleDown,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      default:
                        for (var doc in snapshot.data!.docs) {
                          if (doc['email'] ==
                              FirebaseAuth.instance.currentUser?.email) {
                            if (doc['image'] != '') pl = doc['image'];
                          }
                        }
                        if (snapshot.hasError) {
                          return Container(
                            height: 150,
                            width: 150,
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(pl),
                                fit: BoxFit.scaleDown,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        } else {
                          return Container(
                            height: 150,
                            width: 150,
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(pl),
                                fit: BoxFit.scaleDown,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }
                    }
                  }),
            ],
          ),
        ),
        actions: [
          CupertinoButton(
            child: Icon(
              Icons.favorite,
              size: 30,
              color: Colors.yellow,
            ),
            onPressed: () {
              FirebaseAuth.instance.authStateChanges().listen((User? user) {
                if (user != null) {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (BuildContext context) {
                    return const Favorites();
                  }));
                } else {
                  Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(builder: (BuildContext context) {
                    return const MySigninPage();
                  }));
                }
              });
            },
            disabledColor: const Color(0xFF374259),
          ),
        ],
      ),
      body: Container(
        width: lebar,
        height: tinggi,
        decoration: const BoxDecoration(
          color: Color(0xFF374259),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'CURRENT AIRING',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              StreamBuilder(
                  stream: whoAmIss(),
                  builder: (context, snapshot) {
                    var okn;
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.hasError ||
                        !snapshot.hasData) {
                      return CarouselSlider(
                        items: _slides,
                        options: CarouselOptions(
                          height: 200,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                        ),
                      );
                    } else {
                      okn = List<Widget>.generate(snapshot.data!.docs.length,
                          (int indexcx) {
                        // randoms.add(rng.nextInt(snapshot.data!.docs.length));
                        return MySlideItem(
                            onTap: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                return MyAnimeDetails(
                                    id: 1,
                                    sx: Anime(
                                        id: '1',
                                        judul: snapshot.data!.docs[indexcx]
                                            ['title'],
                                        Rating: snapshot
                                            .data!.docs[indexcx]['score']
                                            .toString(),
                                        Episode: snapshot
                                            .data!.docs[indexcx]['episodes']
                                            .toString(),
                                        sypnosis: snapshot.data!.docs[indexcx]
                                            ['synopsis'],
                                        imagePath: snapshot.data!.docs[indexcx]
                                            ['image'],
                                        genre: snapshot.data!.docs[indexcx]
                                            ['genres']));
                              }));
                            },
                            rating: snapshot.data!.docs[indexcx]['score'],
                            title: snapshot.data!.docs[indexcx]['title'],
                            imagePath: snapshot.data!.docs[indexcx]['image']);
                      });
                    }
                    return CarouselSlider(
                      items: okn,
                      options: CarouselOptions(
                        height: 200,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                      ),
                    );
                  }),
              Text_genre(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: lebar,
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MyGenreButton(
                          onTap: () => Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (BuildContext context) {
                                return const MyListPage(
                                  title: "Action",
                                );
                              })),
                          imagePath: 'assets/kny.png',
                          title: 'ACTION'),
                      MyGenreButton(
                          onTap: () => Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (BuildContext context) {
                                return const MyListPage(
                                  title: "Adventure",
                                );
                              })),
                          imagePath: 'assets/one_piece.jpg',
                          title: 'ADVENTURE'),
                      MyGenreButton(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return const MyListPage(
                            title: 'Horror',
                          );
                        })),
                        imagePath: 'assets/junji_ito.jpg',
                        title: 'HORROR',
                      ),
                      MyGenreButton(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return const MyListPage(
                            title: 'Drama',
                          );
                        })),
                        imagePath: 'assets/shigatsu.jpg',
                        title: 'DRAMA',
                      ),
                      MyGenreButton(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return const MyListPage(
                            title: 'Fantasy',
                          );
                        })),
                        imagePath: 'assets/mushoku_tensei.jpeg',
                        title: 'Fantasy',
                      ),
                      MyGenreButton(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return const MyListPage(
                            title: 'Thriller',
                          );
                        })),
                        imagePath: 'assets/cs.jpg',
                        title: 'THRILLER',
                      ),
                      MyGenreButton(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return const MyListPage(
                            title: 'Harem',
                          );
                        })),
                        imagePath: 'assets/gotoubun.jpg',
                        title: 'HAREM',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: AutoSizeText(
                    'SEASONS',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MySeasonsButton(
                      imagePath: 'assets/spring.png',
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MyListPage(
                          title: 'Spring',
                        );
                      })),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 8),
                    MySeasonsButton(
                      imagePath: 'assets/summer.png',
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MyListPage(
                          title: 'Summer',
                        );
                      })),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 8),
                    MySeasonsButton(
                      imagePath: 'assets/autumn.png',
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MyListPage(
                          title: 'Fall',
                        );
                      })),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 8),
                    MySeasonsButton(
                      imagePath: 'assets/winter.png',
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MyListPage(
                          title: 'Winter',
                        );
                      })),
                    ),
                  ],
                ),
              ),
              recommendationText(),
              SizedBox(
                width: double.infinity,
                height: 290,
                child: StreamBuilder(
                    stream: whoAmIs(),
                    builder: (context, snapshots) {
                      switch (snapshots.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          List<Widget> createChildren() {
                            return List<Widget>.generate(10, (int indexc) {
                              randoms.add(
                                  rng.nextInt(snapshots.data!.docs.length));
                              return MyAnimeCards(
                                onTap: () => Navigator.of(context).push(
                                    CupertinoPageRoute(
                                        builder: (BuildContext context) {
                                  return MyAnimeDetails(
                                      id: 0,
                                      sx: Anime(
                                          id: '1',
                                          judul: snapshots.data!
                                              .docs[randoms[indexc]]['title'],
                                          Rating: snapshots.data!
                                              .docs[randoms[indexc]]['score']
                                              .toString(),
                                          Episode: snapshots.data!
                                              .docs[randoms[indexc]]['episodes']
                                              .toString(),
                                          sypnosis:
                                              snapshots.data!.docs[randoms[indexc]]
                                                  ['synopsis'],
                                          imagePath: snapshots.data!
                                              .docs[randoms[indexc]]['image'],
                                          genre: snapshots.data!.docs[randoms[indexc]]
                                              ['genres']));
                                })),
                                rating: snapshots.data!.docs[randoms[indexc]]
                                    ['score'],
                                title: snapshots.data!.docs[randoms[indexc]]
                                    ['title'],
                                imagePath: snapshots.data!.docs[randoms[indexc]]
                                    ['image'],
                              );
                            });
                          }
                          if (snapshots.hasError) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            var ok = createChildren();
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ok.length,
                                itemBuilder: (context, int indexc) {
                                  return ok[indexc];
                                });
                          }
                      }
                    }),
              ),
              // Center(
              //   child: Text(
              //     'ALL ANIMES',
              //     style: GoogleFonts.poppins(
              //       fontSize: 30,
              //       color: Colors.yellow,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              //   child: GridView(
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         mainAxisSpacing: 15,
              //         crossAxisSpacing: 15,
              //         mainAxisExtent: 220),
              //     children: [],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Padding recommendationText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Recommendation',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.yellow,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('Lihat Semua'),
            icon: const Icon(Icons.arrow_right_alt_sharp),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF374259), // Warna latar belakang tombol
              onPrimary: Colors.yellow, // Warna teks pada tombol
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Mengatur sudut tombol
              ),
              minimumSize: const Size(50, 50),
              elevation: 0.0, // Ukuran minimum tombol
            ),
          ),
        ],
      ),
    );
  }

  Padding Text_genre() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Text('GENRE',
            style: GoogleFonts.poppins(
              fontSize: 25,
              color: Colors.yellow,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }

  GestureDetector search_field() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 50, 20, 40),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF9F343),
              blurRadius: 40,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            hintText: 'Search Anime. . .',
            hintStyle: TextStyle(
              color: Color(0xFF374259),
              fontSize: 14,
            ),
            fillColor: Color(0xFF9F343),
            prefixIcon: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.search,
                color: Color(0xFF374259),
              ),
            ),
            contentPadding: EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
