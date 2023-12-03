import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAnimeCards extends StatefulWidget {
  final String ? title;
  final Function() ? onTap;
  final double ? rating;
  final String ? imagePath;
  const MyAnimeCards(
    {
      super.key,
      required this.onTap,
      required this.rating,
      required this.title,
      required this.imagePath,
    }
  );

  @override
  State<MyAnimeCards> createState() => _MyAnimeCardsState();
}

class _MyAnimeCardsState extends State<MyAnimeCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 250,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(2, 2)),
              ],
              image: DecorationImage(
                image: AssetImage('${widget.imagePath}'),
                filterQuality: FilterQuality.low,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: 70,
              height: 25,
              decoration: const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xFF374259),
                  ),
                  Text(
                    '${widget.rating}',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF374259),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 20,
            child: Container(
              width: 180,
              height: 35,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '${widget.title}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF374259),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}