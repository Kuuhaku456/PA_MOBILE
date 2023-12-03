import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGenrePage extends StatefulWidget {
  const MyGenrePage({super.key});

  @override
  State<MyGenrePage> createState() => _MyGenrePageState();
}

class _MyGenrePageState extends State<MyGenrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF374259),
      appBar: AppBar(
        backgroundColor: const Color(0xFF374259),
          title: Text(
            'Genre Page',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.yellow,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
      ),
    );
  }
}