class Anime {
  String id;
  String judul;
  String Rating;
  String Episode;
  String imagePath;
  String sypnosis;
  bool isFavorite;
  final bool isTapped;
  List<dynamic> genre;

  Anime({
    required this.id,
    required this.judul,
    required this.Rating,
    required this.Episode,
    required this.sypnosis,
    required this.imagePath,
    this.isFavorite = false,
    this.isTapped = false,
    required this.genre,
  });
}
