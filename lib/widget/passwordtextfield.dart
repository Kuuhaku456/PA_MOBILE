import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixicon;
  const MyPasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixicon,
  });

  @override
  State<MyPasswordTextField> createState() => _MyPasswordTextFieldState();
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
  bool _obscureText = true;
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
          obscureText: _obscureText,
          cursorColor: Colors.black,
          style: GoogleFonts.poppins(fontSize: 20),
          decoration: InputDecoration(
              prefixIcon: widget.prefixicon,
              suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ));
  }
}
