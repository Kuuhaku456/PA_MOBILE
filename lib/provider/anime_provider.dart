import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/models/anime.dart';

class AnimeProvider with ChangeNotifier {
  static List<Animes> animeList = [
    Animes(
      id: 1, 
      judul: 'One Piece', 
      genre: ['Comedy', 'Adventure',  'Action', 'Drama', 'Fantasy'], 
      sinopsis: '''Barely surviving in a barrel after passing through a terrible whirlpool at sea, carefree Monkey D. Luffy ends up aboard a ship under attack by fearsome pirates. Despite being a naive-looking teenager, he is not to be underestimated. Unmatched in battle, Luffy is a pirate himself who resolutely pursues the coveted One Piece treasure and the King of the Pirates title that comes with it.''', 
      karakter: ['Monkey D.Luffy'],
      studio: ['Toei Animation'],
      rating: 8.45,
      imagePath: 'assets/one_piece.jpg',
    ),
  ];
  List<Animes> get getanime => animeList;

}