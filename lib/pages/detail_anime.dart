import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/pages/watch.dart';
import 'package:posttest5_096_filipus_manik/widget/Button.dart';
import 'package:posttest5_096_filipus_manik/widget/genre_card.dart';

class MyAnimeDetails extends StatefulWidget {
  final id;
  final Anime sx;
  const MyAnimeDetails({
    super.key,
    required this.id,
    required this.sx,
    // required this.id,
  });

  @override
  State<MyAnimeDetails> createState() => _MyAnimeDetailsState();
}

class _MyAnimeDetailsState extends State<MyAnimeDetails> {
  List animeList = Animes.animeList;
  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(widget.sx.imagePath.toString()),
              fit: BoxFit.cover,
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .85,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      offset: const Offset(0, -4),
                      blurRadius: 8,
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only( left: 5),
                    child: Container(
                      child: Center(
                        child: AutoSizeText(
                          widget.sx.judul,
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF374259),
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.width / 10,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                color: const Color(0xFF374259),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AutoSizeText(
                                  '${widget.sx.Episode} Episodes',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 10,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                color: const Color(0xFF374259),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                AutoSizeText(
                                  widget.sx.Rating,
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(height: MediaQuery.of(context).size.height / 120),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Genres',
                      style: GoogleFonts.poppins(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF374259),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(height: MediaQuery.of(context).size.height / 80),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ListView.builder(
                        itemCount: widget.sx.genre.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return MyGenreCard(
                            backgroundColor: const Color(0xFF374259),
                            genre: widget.sx.genre[index]['name'],
                            textColor: Colors.yellow,
                          );
                        }),
                  ),
                  Container(height: MediaQuery.of(context).size.height / 80),
                  Center(
                    child: AutoSizeText(
                      'Description',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF374259),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF374259),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView(
                      children: [
                        Center(
                          child: AutoSizeText(
                            widget.sx.sypnosis,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.yellow,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MyButton(
                        onTap:() => Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return MyWatchScreen(
                            title: widget.sx.judul,
                          );
                        })),
                        text: 'Watch',
                        backgroundColor: const Color(0xFF374259),
                        textColor: Colors.yellow),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 40,
              left: 10,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color(0xFF374259),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
