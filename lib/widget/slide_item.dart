import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySlideItem extends StatefulWidget {
  final Function()? onTap;
  final String? title;
  final double? rating;
  final String? imagePath;
  const MySlideItem({
    super.key,
    required this.onTap,
    required this.rating,
    required this.title,
    required this.imagePath,
  });

  @override
  State<MySlideItem> createState() => _MySlideItemState();
}

class _MySlideItemState extends State<MySlideItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(widget.imagePath.toString()),
            filterQuality: FilterQuality.low,
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 135,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.35,
                height: 50,
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF374259).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.5),
                        child: AutoSizeText(
                          widget.title.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: MediaQuery.of(context).size.width / 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            size: MediaQuery.of(context).size.width / 20,
                            color: Colors.yellow,
                          ),
                          Text(
                            widget.rating.toString(),
                            style: GoogleFonts.poppins(
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
