import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  List<Anime> _topAnime = [];
  List<Anime> get getAnime => _topAnime;
  ProviderState state = ProviderState.initialize;
  void getAnimeTop() async {
    state = ProviderState.loading;
    try {
      // final result = await repositories.getAnimeTopList();
      // if (result is AnimeResponses) {
      //   result.data?.forEach((element) {

      CollectionReference userRef = FirebaseFirestore.instance.collection('anime');
      await userRef.get().then((snapshot) {
        for (var doc in snapshot.docs) {
          // if (doc['email'] == FirebaseAuth.instance.currentUser?.email) {
          _topAnime.add(
              Anime(
            id: doc['mal_id'],
            judul: doc['title'],
            Rating: doc['score'],
            sypnosis: doc['synopsis'],
            Episode: doc['episodes'],
            imagePath: doc['image'],
            genre: doc['genres'],
          ));
          // }
        }

      }
    );
      // final imagePath = element.images["jpg"]?["image_url"] ?? "";
      // topAnime.add(Anime(
      //   id: element.malId != null ? element.malId  : 0,
      //   judul: element.title ?? "",
      //   Rating: element.score.toString(),
      //   sypnosis: "",
      //   Episode: element.episodes,
      //   imagePath: imagePath,
      //   genre: element.explicitGenres,
      // ));
      // });
      state = ProviderState.loaded;
      print('data ada');
      notifyListeners();

    } catch (e) {
      state = ProviderState.error;
      notifyListeners();
    }
  }
}
