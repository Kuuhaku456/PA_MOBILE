import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyanimeCard extends StatefulWidget {
  final Function()? onTap;
  final int index;
  final String title;
  final String imagePath;
  final String rating;
  final bool isFavorite;
  final int episode;
  final Function()? handleTap;
  final bool isTapped;
  const MyanimeCard({
    required this.onTap,
    required this.index,
    required this.title,
    required this.imagePath,
    required this.rating,
    required this.episode,
    this.isFavorite = false,
    this.isTapped = false,
    this.handleTap,
  });

  @override
  State<MyanimeCard> createState() => _MyanimeCardState();
}

class _MyanimeCardState extends State<MyanimeCard> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    Color containerColor = widget.isTapped ? Colors.grey : const Color(0xFF374259);
    Color textColor = widget.isTapped ? Colors.yellow : Colors.yellow;
    Color iconColor = widget.isTapped ? Colors.yellow : Colors.yellow;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: lebar,
        height: 150,
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: lebar / 10,
                height: 130,
                margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                  color:Color(0xFF374259),
                ),
                child: Center(
                  child: Text(
                    '${widget.index + 1}',
                    style: GoogleFonts.poppins(
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin:const  EdgeInsets.only(left: 20, right: 10, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.imagePath,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Container(
                width: lebar / 2.9,
                height: 150,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                // decoration: BoxDecoration(color: Colors.green),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          padding: const EdgeInsets.only(top: 10),
                          // decoration: BoxDecoration(color: Colors.red),
                          child: AutoSizeText(
                            widget.title,
                            style: GoogleFonts.poppins(
                              color:const  Color(0xFF374259),
                              fontSize: 27,
                            ),
                            maxLines: 2,
                          ),
                        );
                      }),
                    ),
                    Container(
                      width: lebar / 2.9,
                      height: 70,
                      decoration: const BoxDecoration(
                          // color: Colors.blue
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.episode} eps',
                            style: GoogleFonts.poppins(
                              color:const  Color(0xFF374259),
                              fontSize: 20,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: AnimatedContainer(
                              width: lebar / 4.5,
                              height: 40,
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: containerColor,
                                  boxShadow: const [
                                    BoxShadow()
                                  ]), // Durasi animasi. // Ganti warna kontainer sesuai kondisi.
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.grade,
                                      color: iconColor, // Atur warna ikon.
                                      size: 25,
                                    ),
                                    Text(
                                      '${widget.rating}',
                                      style: GoogleFonts.poppins(
                                        color: textColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: widget.isFavorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                iconSize: 40,
                color: widget.isFavorite ? Color(0xFF374259) : null,
                onPressed: () {
                  widget.handleTap?.call();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
