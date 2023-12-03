import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/models/introduction_container.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF164863),
      child: MyintroductionContainer(
        title: 'List Your Own \n                  Favorites Anime!', 
        Title_2: 'Your TOP 1. \n                      Anime APP!!!', 
        image_path: 'assets/hxh.png', 
        desc: 'Get Started For your free app.',
      ),
    );
  }
}