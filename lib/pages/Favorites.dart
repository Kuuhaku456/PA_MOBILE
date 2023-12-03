import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime_card.dart';
import 'package:posttest5_096_filipus_manik/provider/anime_favorite_notifier.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  void showErrorAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Sorry, something went wrong',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF374259),
      appBar: AppBar(
        backgroundColor: const Color(0xFF374259),
        title: const Text('Favorites Anime'),
        centerTitle: true,
      ),
      body:
          Consumer<AnimeFavoriteNotifier>(builder: (context, provider, child) {
        if (provider.getAnime.isNotEmpty) {
          return ListView.builder(
              itemCount: provider.getAnime.length,
              itemBuilder: (context, index) {
                return MyanimeCard(
                  onTap: () {},
                  index: index,
                  title: provider.getAnime[index].judul,
                  imagePath: provider.getAnime[index].imagePath,
                  rating: provider.getAnime[index].Rating,
                  episode: provider.getAnime[index].Episode,
                  isFavorite: provider.getAnime[index].isFavorite,
                );
              });
        }
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width /20, right: MediaQuery.of(context).size.width /20),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Anime Favorite Anda Tidak ada!',
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width / 20,
                  fontWeight: FontWeight.w600,
                  color:const  Color(0xFF374259),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
