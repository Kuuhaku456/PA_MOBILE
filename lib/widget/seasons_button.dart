import 'package:flutter/material.dart';

class MySeasonsButton extends StatefulWidget {
  final Function()? onTap;
  final String imagePath;
  const MySeasonsButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<MySeasonsButton> createState() => _MySeasonsButtonState();
}

class _MySeasonsButtonState extends State<MySeasonsButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: 70,
          height: 70,
          margin: const EdgeInsets.only(right: 30),
          decoration: const BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(widget.imagePath.toString()),
                fit: BoxFit.cover,
              )),
            ),
          )),
    );
  }
}
