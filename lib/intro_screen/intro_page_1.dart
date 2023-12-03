import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    var Lebar = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    return Container(
      width: Lebar,
      height: Tinggi,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
      ),
      child: Column(
        children: [
          SizedBox(height: 70),
            Container(
              width: Lebar,
              height: 100,
              child: Text(
                'Welcome to \n            CrunchRyoll!',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          Container(
            width: Lebar,
            height: 500,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 100),
            decoration: BoxDecoration(
              color: Color(0xFF374259),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: Lebar,
                  height: 325,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/mushoku_tensei.jpeg'),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    )
                  ),
                ),
                Container(
                  width: Lebar,
                  height: 175,
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No. 1 Anime\n          APP Ever !',
                        style: GoogleFonts.poppins(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Discover All Weebs Like Here, Your\nWeebs APP Just For you!',
                        style: GoogleFonts.poppins(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
