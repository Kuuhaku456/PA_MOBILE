import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class MyCustomSnackbar extends StatefulWidget {
  final String? title;
  final String? message;
  final String? type;
  final Color? backgroundColor;
  final ContentType ? contentType;
  const MyCustomSnackbar({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    required this.backgroundColor,
    this.contentType,
  });

  @override
  State<MyCustomSnackbar> createState() => _MyCustomSnackbarState();
}

class _MyCustomSnackbarState extends State<MyCustomSnackbar> {
  @override
  Widget build(BuildContext context) {
    return AwesomeSnackbarContent(
        title: widget.title.toString(),
        message: widget.message.toString(),
        contentType: ContentType(widget.type.toString(), widget.backgroundColor),
    );
  }
}
