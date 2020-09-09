import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGridViewCard extends StatefulWidget {
  final String? judul;
  final Function()? onTap;
  final double? rating;
  final String? imagePath;
  const MyGridViewCard({
    super.key,
    required this.judul,
    required this.onTap,
    required this.rating,
    required this.imagePath,
  });

  @override
  State<MyGridViewCard> createState() => _MyGridViewCardState();
}

class _MyGridViewCardState extends State<MyGridViewCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(widget.imagePath.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
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
                    widget.rating.toString(),
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
            bottom: 10,
            left: 10,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.4,
              height: 35,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                widget.judul.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF374259),
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
