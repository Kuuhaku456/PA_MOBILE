import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/firebase_options.dart';
import 'package:posttest5_096_filipus_manik/pages/Screen.dart';
import 'package:posttest5_096_filipus_manik/provider/Top_Anime_notifier.dart';
import 'package:posttest5_096_filipus_manik/provider/anime_favorite_notifier.dart';
import 'package:posttest5_096_filipus_manik/provider/theme_mode_data.dart';
import 'package:provider/provider.dart';

// var ope;
// akuns oks = akuns();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            TopAnimeNotifier();
          },
        ),
        ChangeNotifierProvider(create: (_) {
          AnimeFavoriteNotifier();
        }),
        ChangeNotifierProvider(create: (_) => ThemeModeData()),
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
    return Builder(builder: (context) {
      ColorScheme lightScheme = ColorScheme.fromSeed(
        seedColor: Colors.lightBlueAccent,
      );
      ColorScheme darkScheme = ColorScheme.fromSeed(
        seedColor: Colors.lightBlueAccent,
        brightness: Brightness.dark,
      );
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontFamily: 'Serif'),
            bodyLarge: TextStyle(color: Colors.black87),
            bodyMedium: TextStyle(color: Colors.black54),
            bodySmall: TextStyle(color: Colors.black45),
          ),
        ),
        darkTheme:ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorScheme: darkScheme,
              textTheme: const TextTheme(
                headlineLarge: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Serif'),
                bodyLarge: TextStyle(color: Colors.white70),
                bodyMedium: TextStyle(color: Colors.white60),
                bodySmall: TextStyle(color: Colors.white54),
              ),
            ),
            themeMode: Provider.of<ThemeModeData>(context).themeMode,
        home: const Screen(),
      );
    });
  }
}
