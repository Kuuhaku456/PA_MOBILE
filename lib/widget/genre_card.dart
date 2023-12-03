import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGenreCard extends StatefulWidget {
  final String ? genre;
  final Color ? backgroundColor;
  final Color ?  textColor;
  const MyGenreCard(
    {
      super.key,
      required this.backgroundColor,
      required this.genre,
      required this.textColor,
    }
  );

  @override
  State<MyGenreCard> createState() => _MyGenreCardState();
}

class _MyGenreCardState extends State<MyGenreCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 180,
        height: 30,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Center(
          child: AutoSizeText(
            '${widget.genre}',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w600, color: widget.textColor),
          ),
        ),
      ),
    );
  }
}