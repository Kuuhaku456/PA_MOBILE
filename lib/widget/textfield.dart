import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixicon;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixicon,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: widget.controller,
          autofocus: true,
          cursorColor: const Color(0xFF374259),
          style: GoogleFonts.poppins(fontSize: 20),
          decoration: InputDecoration(
              prefixIcon: widget.prefixicon,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF374259)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF374259)),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ));
  }
}
