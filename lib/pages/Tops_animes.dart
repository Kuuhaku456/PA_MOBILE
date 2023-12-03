import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/main.dart';
import 'package:posttest5_096_filipus_manik/models/anime_card.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/provider/Top_Anime_notifier.dart';
import 'package:posttest5_096_filipus_manik/provider/anime_favorite_notifier.dart';
import 'package:posttest5_096_filipus_manik/repository/anime_repo.dart';
import 'package:provider/provider.dart';

class TopsAnimes extends StatelessWidget {
  const TopsAnimes({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          TopAnimeNotifier(repositories: getIt.get<AnimeRepository>()),
      child: const TopsAnimeView(),
    );
  }
}

class TopsAnimeView extends StatefulWidget {
  const TopsAnimeView({super.key});

  @override
  State<TopsAnimeView> createState() => _TopsAnimeViewState();
}

class _TopsAnimeViewState extends State<TopsAnimeView> {
  bool isTapped = false;
  void toggleFavorite(Anime data) {
    if (data.isFavorite) {
      setState(() {
        data.isFavorite = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF374259),
          content: Text(
            'Anime telah di-unfavorit',
            style: GoogleFonts.poppins(color: Colors.yellow, fontSize: 15),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Tambahkan ke Favorit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    data.isFavorite = true;
                  });
                  Provider.of<AnimeFavoriteNotifier>(context, listen: false)
                      .addToFavorite(data);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: const Color(0xFF374259),
                      content: Row(
                        children: [
                          Text(
                            'Anime telah di tambahkan ke favorit',
                            style: GoogleFonts.poppins(
                                color: Colors.yellow, fontSize: 15),
                          ),
                          TextButton(
                              onPressed: () {
                                toggleFavorite(data);
                              },
                              child: Text(
                                'Urungkan',
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Colors.blue),
                              )),
                        ],
                      ),
                    ),
                  );
                },
                child: Text('Tambahkan'),
              ),
            ],
          );
        },
      );
    }
  }

  void handleTap() {
    setState(() {
      isTapped = !isTapped; // Toggle nilai ketika tombol ditekan.
    });
  }

  @override
  void initState() {
    super.initState();
    //context.read<TopAnimeNotifier>().getAnimeTop();
    Provider.of<TopAnimeNotifier>(context, listen: false).getAnimeTop();
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TOP CHARTS',
          style: GoogleFonts.poppins(
            fontSize: 25,
            color: Colors.yellow,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF374259),
      ),
      body: Container(
        width: lebar,
        height: tinggi,
        decoration: const BoxDecoration(
          color: Color(0xFF374259),
        ),
        child: SizedBox(
          width: lebar,
          height: tinggi,
          child: SizedBox(
            width: lebar,
            height: 900,
            child:
                Consumer<TopAnimeNotifier>(builder: (context, provider, child) {
              if (provider.state == ProviderState.loaded) {
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
                        handleTap: () {
                          toggleFavorite(provider.getAnime[index]);
                          // setState(() {
                          //   ListTopAnime[index].isFavorite = !ListTopAnime[index].isFavorite;
                          // });
                        },
                      );
                    });
              } else if (provider.state == ProviderState.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Text(
                'Kosong',
              );
            }),
          ),
        ),
      ),
    );
  }
}
