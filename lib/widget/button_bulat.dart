import 'package:flutter/material.dart';

class MyCircleButton extends StatefulWidget {
  final IconData icon;
  final Function()? onPressed;
  const MyCircleButton(
    {
      super.key,
      required this.icon,
      required this.onPressed,
    }
  );

  @override
  State<MyCircleButton> createState() => _MyCircleButtonState();
}

class _MyCircleButtonState extends State<MyCircleButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF374259),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ] // Warna latar belakang
          ),
          child: Icon(
            widget.icon,
            color: Colors.yellow, // Warna ikon
          ),
        ),
      ),
    );
  }
}