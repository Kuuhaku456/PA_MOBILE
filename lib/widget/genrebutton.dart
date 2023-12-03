import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGenreButton extends StatefulWidget {
  final Function()? onTap;
  final String? imagePath;
  final String? title;
  const MyGenreButton(
      {super.key,
      required this.onTap,
      required this.imagePath,
      required this.title});

  @override
  State<MyGenreButton> createState() => _MyGenreButtonState();
}

class _MyGenreButtonState extends State<MyGenreButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 120.0,
        width: 120.0,
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(2, 2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(widget.imagePath.toString()),
                    filterQuality: FilterQuality.low,
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              widget.title.toString(),
              style: GoogleFonts.poppins(
                fontSize: 19,
                color:const  Color(0xFF374259),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
