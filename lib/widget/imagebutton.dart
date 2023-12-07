import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyImageButton extends StatefulWidget {
  final Function()? onTap;
  final String? labeltext;
  final String? imagepath;
  final Color? backgroundColor;
  final Color? textColor;
  const MyImageButton({
    super.key,
    required this.onTap,
    required this.imagepath,
    required this.labeltext,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  State<MyImageButton> createState() => _MyImageButtonState();
}

class _MyImageButtonState extends State<MyImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    widget.imagepath.toString(),
                  ),
                ),
              ),
            ),
            Text(
              widget.labeltext.toString(),
              style: GoogleFonts.poppins(
                color: widget.textColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width / 25,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
