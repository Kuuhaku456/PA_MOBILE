import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posttest5_096_filipus_manik/firebase_options.dart';
import 'package:posttest5_096_filipus_manik/pages/Screen.dart';
import 'package:posttest5_096_filipus_manik/provider/Top_Anime_notifier.dart';
import 'package:posttest5_096_filipus_manik/provider/anime_favorite_notifier.dart';
import 'package:posttest5_096_filipus_manik/repository/anime_repo.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth auth = FirebaseAuth.instance;
  final Dio apiClients = Dio();
  final AnimeRepository animeRepository = AnimeRepository(
    apiClient: apiClients,
  );

  getIt.registerLazySingleton<AnimeRepository>(() => animeRepository);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TopAnimeNotifier(
              repositories: AnimeRepository(
                  apiClient: getIt.get<AnimeRepository>().apiClient)),
        ),
        ChangeNotifierProvider(
          create: (_) => AnimeFavoriteNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const Screen(),
    );
  }
}
