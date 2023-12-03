import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime.dart';
import 'package:posttest5_096_filipus_manik/widget/genre_card.dart';

class MyAnimeDetails extends StatefulWidget {
  final id;
  final Animes ? anime;
  const MyAnimeDetails(
    {
      super.key,
      required this.id,
      this.anime,
      // required this.id,
    }
  );

  @override
  State<MyAnimeDetails> createState() => _MyAnimeDetailsState();
}

class _MyAnimeDetailsState extends State<MyAnimeDetails> {
  List animeList =  Animes.animeList;
  @override
  Widget build(BuildContext context) {
    int indeks = 0;
    for(int i=0;i<animeList.length;i++){
      if(animeList[i].id == widget.id){
        indeks = i;
      }   
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(Animes.animeList[indeks].imagePath), 
              fit: BoxFit.cover,
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.yellow,
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin:const  EdgeInsets.all(5),
                        child: AutoSizeText(
                          animeList[indeks].judul,
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF374259),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Container(
                          width: 100,
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color:const Color(0xFF374259),
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
                                Animes.animeList[indeks].rating.toString(),
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
                  Container(
                    width: double.infinity,
                    height: 450,
                    padding: const EdgeInsets.all(10),
                    child: ListView(                      
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Genres',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF374259),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ListView.builder(
                              itemCount: Animes.animeList[indeks].genre.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return MyGenreCard(
                                  backgroundColor: const Color(0xFF374259),
                                  genre: Animes.animeList[0].genre[index],
                                  textColor: Colors.yellow,
                                );
                              }),
                        ),
                        const SizedBox(height: 20),
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
                          height: 180,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF374259),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: AutoSizeText(
                              Animes.animeList[indeks].sinopsis,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.yellow,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Characters',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF374259),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ListView.builder(
                              itemCount: Animes.animeList[indeks].karakter.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return MyGenreCard(
                                  backgroundColor: const Color(0xFF374259),
                                  genre: Animes.animeList[indeks].karakter[index],
                                  textColor: Colors.yellow,
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: InkWell(
              onTap: (){
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
            )
          )
        ],
      ),
    );
  }
}
