import 'package:dio/dio.dart';
import 'package:posttest5_096_filipus_manik/repository/anime_responses.dart';

class AnimeRepository {
  final Dio apiClient;
  final baseUrl = 'https://api.jikan.moe/v4/';
  AnimeRepository({
    required this.apiClient,
  });

  Future getAnimeTopList () async {
    try{
      final response = await apiClient.get("$baseUrl/top/anime/");
      return AnimeResponses.fromJson(response.data);

    }catch (e){
      return "${e.toString()}";
    }
  }
}