class Anime {
  int id;
  String judul;
  String Rating;
  String Tipe;
  int Episode;
  String imagePath;
  bool isFavorite;
  final bool isTapped;
  List <dynamic> genre;

  Anime({
    required this.id,
    required this.judul,
    required this.Rating,
    required this.Tipe,
    required this.Episode,
    required this.imagePath,
    this.isFavorite = false,
    this.isTapped = false,
    required this.genre,
  });
}
