import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyEmailTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixicon;
  final Function()? showMessage;
  const MyEmailTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixicon,
    required this.showMessage,
  });

  @override
  State<MyEmailTextField> createState() => _MyEmailTextFieldState();
}

class _MyEmailTextFieldState extends State<MyEmailTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
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
              hintText: 'Email',
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              widget.showMessage;
            } else if (!RegExp(
                    r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                .hasMatch(value!)) {
              widget.showMessage;
            } else {
              return null;
            }
          },
        ));
  }
}
