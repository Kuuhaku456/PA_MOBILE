import 'package:flutter/material.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi= MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF374259),
        title: const Text(
          'MyNotification'
          ),
          centerTitle: true,
      ),
      body: Container(
        width: lebar,
        height:tinggi,
        decoration: const BoxDecoration(
          color: Color(0xFF374259),
        ),
      ),
    );
  }
}