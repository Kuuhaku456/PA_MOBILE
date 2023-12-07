class Animes {
  int id;
  String judul;
  List<String> genre;
  String sinopsis;
  List<String> karakter;
  List<String> studio;
  double rating;   
  String imagePath;
  String ? status;
  String ? hari;
  int ? episode;
  Animes({
    required this.id,
    required this.judul,
    required this.genre,
    required this.sinopsis,
    required this.karakter,
    required this.studio,
    required this.rating,
    required this.imagePath,
    this.status,
    this.hari,
    this.episode,
  });

  static List<Animes> animeList = [
    Animes(
      id: 1, 
      judul: 'Goblin Slayer', 
      genre: ['Action', 'Adventure',  'Fantasy', 'Gore'], 
      sinopsis: '''Goblins are known for their ferocity, cunning, and rapid reproduction, but their reputation as the lowliest of monsters causes their threat to be overlooked. Raiding rural civilizations to kidnap females of other species for breeding, these vile creatures are free to continue their onslaught as adventurers turn a blind eye in favor of more rewarding assignments with larger bounties.''', 
      karakter: ['Goblin Slayer'],
      studio: ['White Fox'],
      rating: 7.42,
      imagePath: 'assets/Gs1.png',
      status: 'Completed'
    ),
    Animes(
      id: 2, 
      judul: 'Mushoku Tensei S1', 
      genre: ['Adventure', 'Drama', 'Fantasy', 'Ecchi'], 
      sinopsis: '''Despite being bullied, scorned, and oppressed all of his life, a 34-year-old shut-in still found the resolve to attempt something heroic—only for it to end in a tragic accident. But in a twist of fate, he awakens in another world as Rudeus Greyrat, starting life again as a baby born to two loving parents.''', 
      karakter: ['Rudeus', 'Roxy Mugurdia', 'Eris', 'Sylphiette', 'Orstred'],
      studio: ['Studio Bind'],
      rating: 8.38,
      imagePath: 'assets/mushoku_tensei.jpeg',
      status: 'Completed'
    ),
    Animes(
      id:3, 
      judul: 'Demon Slayer', 
      genre: ['Comedy', 'Adventure',  'Action', 'Drama', 'Fantasy'], 
      sinopsis: '''Ever since the death of his father, the burden of supporting the family has fallen upon Tanjirou Kamado's shoulders. Though living impoverished on a remote mountain, the Kamado family are able to enjoy a relatively peaceful and happy life. One day, Tanjirou decides to go down to the local village to make a little money selling charcoal. On his way back, night falls, forcing Tanjirou to take shelter in the house of a strange man, who warns him of the existence of flesh-eating demons that lurk in the woods at night.''', 
      karakter: ['Tanjirou', 'Nezuko', 'Zenitsu', 'Inosuke'],
      studio: ['Ufotable'],
      rating: 8.49,
      imagePath: 'assets/kny_p.png',
    ),
  ];
}