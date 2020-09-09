import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWatchScreen extends StatefulWidget {
  final String title;
  const MyWatchScreen({
    super.key,
    required this.title,
  });

  @override
  State<MyWatchScreen> createState() => _MyWatchScreenState();
}

class _MyWatchScreenState extends State<MyWatchScreen> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF374259),
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: lebar / 21,
            color: Colors.yellow,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: lebar,
        height: tinggi,
        color: const Color(0xFF374259),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'COMING SOON',
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width / 10,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF374259),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
