import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyintroductionContainer extends StatefulWidget {
  final String title;
  final String Title_2;
  final String image_path;
  final String desc;
  
  const MyintroductionContainer(
    {
      super.key,
      required this.title,
      required this.Title_2,
      required this.image_path,
      required this.desc
    }
  );

  @override
  State<MyintroductionContainer> createState() => _MyintroductionContainerState();
}

class _MyintroductionContainerState extends State<MyintroductionContainer> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Column(
        children: [
          const SizedBox(height: 70),
            Container(
              width: lebar,
              height: 100,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${widget.title}',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          Container(
            width: lebar,
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
                  width: lebar,
                  height: 325,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(widget.image_path),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    )
                  ),
                ),
                Container(
                  width: lebar,
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
                        widget.Title_2,
                        style: GoogleFonts.poppins(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.desc,
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
      );
  }
}