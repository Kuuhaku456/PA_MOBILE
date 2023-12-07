import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/models/introduction_container.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    var Lebar = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    return Container(
      width: Lebar,
      height: Tinggi,
      color: Color(0xFF192655),
      child: MyintroductionContainer(
        title: 'Discover Your \n                          Anime!', 
        Title_2: 'Up to 10000+ Anime Every DAY!', 
        image_path: 'assets/one_piece.jpg', 
        desc: 'Every Time, Every day, Every Year for discover!'
      ),
    );
  }
}