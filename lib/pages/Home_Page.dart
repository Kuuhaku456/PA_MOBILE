import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime.dart';
import 'package:posttest5_096_filipus_manik/pages/Favorites.dart';
import 'package:posttest5_096_filipus_manik/pages/detail_anime.dart';
import 'package:posttest5_096_filipus_manik/pages/genre_page.dart';
import 'package:posttest5_096_filipus_manik/pages/signinpage.dart';
import 'package:posttest5_096_filipus_manik/widget/anime_cards.dart';
import 'package:posttest5_096_filipus_manik/widget/genrebutton.dart';
import 'package:posttest5_096_filipus_manik/widget/gridview_card.dart';
import 'package:posttest5_096_filipus_manik/widget/slide_item.dart';

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
  void onTapped(int passid) {
    id = passid;
  }

  int _currentIndex = 0;
  final List<Widget> _slides = [
    MySlideItem(
        onTap: () async {
          //percobaan download
          // final storageRef = FirebaseStorage.instance.ref();
          // final imageUrl = await FirebaseStorage.instance
          //     .refFromURL("gs://aexinl.appspot.com/pip.py")
          //     .getDownloadURL();
          // print(imageUrl);
        },
        rating: 8.45,
        title: 'One Piece',
        imagePath: 'assets/one_piece.jpg'),
    MySlideItem(
        onTap: () {},
        rating: 8.88,
        title: 'Mushoku Tensei',
        imagePath: 'assets/mushoku_tensei.jpeg'),
    MySlideItem(
        onTap: () {},
        rating: 8.88,
        title: 'Gotoubun No Hanayome',
        imagePath: 'assets/gotoubun.jpg'),
  ];
  List animeList = Animes.animeList;
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF374259),
        title: Text('CrunchRyoll',
            style: GoogleFonts.poppins(
                color: Colors.yellow,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
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
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    'https://avatars.githubusercontent.com/Kuuhaku456'),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
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
                  Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(builder: (BuildContext context) {
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
              CarouselSlider(
                items: _slides,
                options: CarouselOptions(
                  height: 200,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              search_field(),
              Text_genre(),
              SizedBox(
                width: lebar,
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyGenreButton(
                        onTap: () => Navigator.of(context).push(
                                CupertinoPageRoute(
                                    builder: (BuildContext context) {
                              return const MyGenrePage();
                            })),
                        imagePath: 'assets/kny.png',
                        title: 'ACTION'),
                    MyGenreButton(
                        onTap: () => Navigator.of(context).push(
                                CupertinoPageRoute(
                                    builder: (BuildContext context) {
                              return const MyGenrePage();
                            })),
                        imagePath: 'assets/one_piece.jpg',
                        title: 'ADVENTURE'),
                    MyGenreButton(
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MyGenrePage();
                      })),
                      imagePath: 'assets/junji_ito.jpg',
                      title: 'HORROR',
                    ),
                    MyGenreButton(
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MyGenrePage();
                      })),
                      imagePath: 'assets/shigatsu.jpg',
                      title: 'DRAMA',
                    ),
                    MyGenreButton(
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MyGenrePage();
                      })),
                      imagePath: 'assets/mushoku_tensei.jpeg',
                      title: 'MAGIC',
                    ),
                    MyGenreButton(
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MyGenrePage();
                      })),
                      imagePath: 'assets/cs.jpg',
                      title: 'THRILLER',
                    ),
                    MyGenreButton(
                      onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return const MyGenrePage();
                      })),
                      imagePath: 'assets/gotoubun.jpg',
                      title: 'HAREM',
                    ),
                  ],
                ),
              ),
              recommendationText(),
              SizedBox(
                width: double.infinity,
                height: 290,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int index = 0; index < animeList.length; index++)
                      MyAnimeCards(
                        onTap: () => Navigator.of(context).pushReplacement(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return MyAnimeDetails(id: animeList[index].id);
                        })),
                        rating: animeList[index].rating,
                        title: animeList[index].judul,
                        imagePath: animeList[index].imagePath,
                      )
                  ],
                ),
              ),
              Center(
                child: Text(
                  'ALL ANIMES',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      mainAxisExtent: 220),
                  children: [
                    for (int index = 0; index < animeList.length; index++)
                      MyGridViewCard(
                        judul: animeList[index].judul,
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return MyAnimeDetails(id: animeList[index].id);
                        })),
                        rating: animeList[index].rating,
                        imagePath: animeList[index].imagePath,
                      ),
                  ],
                ),
              )
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
      padding: const EdgeInsets.only(left: 10),
      child: Text('Genre',
          style: GoogleFonts.poppins(
            fontSize: 25,
            color: Colors.yellow,
            fontWeight: FontWeight.w600,
          )),
    );
  }

  GestureDetector search_field() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
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
