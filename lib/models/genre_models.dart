import 'package:flutter/material.dart';

class GenreModel {
  String name;
  String imagepath;
  Color boxColor;

  GenreModel({
    required this.name,
    required this.imagepath,
    required this.boxColor,
  });
  
  static List<GenreModel> getCategories() {
    List<GenreModel> categories = [];
    
    categories.add(
      GenreModel(
        name: 'Action',
        imagepath: 'assets/image/kny.png',
        boxColor: Color(0xff9DCEFF)
      )
    );

    categories.add(
      GenreModel(
        name: 'Magic',
        imagepath: 'assets/image/mushoku_tensei.jpeg',
        boxColor: Color(0xffEEA4CE)
      )
    );

    categories.add(
      GenreModel(
        name: 'Adventure',
        imagepath: 'assets/image/one_piece.jpg',
        boxColor: Color(0xff9DCEFF)
      )
    );

    categories.add(
      GenreModel(
        name: 'Martial Arts',
        imagepath: 'assets/image/one_piece.jpg',
        boxColor: Color(0xff9DCEFF)
      )
    );
    
    categories.add(
      GenreModel(
        name: 'Thriller',
        imagepath: 'assets/image/one_piece.jpg',
        boxColor: Color(0xff9DCEFF)
      )
    );
    
    return categories;
  }
}