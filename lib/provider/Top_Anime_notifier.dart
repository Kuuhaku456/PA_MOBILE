import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/repository/anime_repo.dart';
import 'package:posttest5_096_filipus_manik/repository/anime_responses.dart';

enum ProviderState {
  initialize,
  loading,
  loaded,
  error,
}

class TopAnimeNotifier with ChangeNotifier {
  List<Anime> topAnime = [];
  List<Anime> get getAnime => topAnime;
  
  final AnimeRepository repositories;
  ProviderState state = ProviderState.initialize;
  TopAnimeNotifier({
    required this.repositories,
  });

  void getAnimeTop() async {
    state = ProviderState.loading;
    try {
      final result = await repositories.getAnimeTopList();
      if (result is AnimeResponses) {
        result.data?.forEach((element) {
          final imagePath = element.images["jpg"]?["image_url"] ?? "";
          topAnime.add(Anime(
            id: element.malId != null ? element.malId  : 0,
            judul: element.title ?? "",
            Rating: element.score.toString(),
            Tipe: "",
            Episode: element.episodes,
            imagePath: imagePath,
            genre: element.explicitGenres,
            
          ));
        });
        state = ProviderState.loaded; 
        notifyListeners();
      }
    } catch (e) {
      state = ProviderState.error;
      notifyListeners();
    }
  }
}
