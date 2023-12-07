import 'package:posttest5_096_filipus_manik/models/anime.dart';

class User{
  String ? username;
  String ? email;
  String ? phonenumber;
  int ? usia;
  List<Animes> ? animeFavorites;
  String ? imagePath;
  User(
    {
      required this.username,
      required this.phonenumber,
      required this.usia,
      required this.animeFavorites,
      this.imagePath,
    }
  );
}