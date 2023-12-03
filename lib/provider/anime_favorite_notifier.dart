import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';

class AnimeFavoriteNotifier with ChangeNotifier{
  List<Anime> _anime = [];
  List<Anime> get getAnime => _anime;
  
  void addToFavorite(Anime data){
    _anime.add(data);
    notifyListeners();
  }

  void deleteToFavorite(Anime data){
    _anime.remove(data);
    notifyListeners();
  }
}
