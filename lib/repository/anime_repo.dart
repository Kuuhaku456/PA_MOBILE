// import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/repository/anime_responses.dart';

class AnimeRepository {
  // final Dio apiClient;
  // final baseUrl = 'https://api.jikan.moe/v4/';
  // AnimeRepository({
  // required this.apiClient,
  // });

  Future getAnimeTopList() async {
    try {
      
      // CollectionReference userRef =
      // FirebaseFirestore.instance.collection('users');
      // userRef.get().then((snapshot) {
      //   for (var doc in snapshot.docs) {
      //     if (doc['email'] == FirebaseAuth.instance.currentUser?.email) {
      //       username = doc['username'];
      //       usia = doc['usia'];
      //       no_telp = doc['phonenumber'];
      //       email = doc['email'];
      //       if (doc['image'] != '') profil = doc['image'];
            
      //     }
      //   }
      // });
      // Anime(id: id, judul: judul, Rating: Rating, Episode: Episode, sypnosis: sypnosis, imagePath: imagePath, genre: genre)
      // final response = await apiClient.get("$baseUrl/top/anime/");
      // return AnimeResponses.fromJson(response.data);

    } catch (e) {
      return "${e.toString()}";
    }
  }
}
