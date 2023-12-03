import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  const MyButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.backgroundColor,
      required this.textColor});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '${widget.text}',
            style: GoogleFonts.poppins(
              color: widget.textColor,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 18,
            ),
          ),
        ),
      ),
    );
  }
}
