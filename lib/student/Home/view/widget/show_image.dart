import 'package:flutter/material.dart';

class Showimage extends StatelessWidget {
  final String imagePath;

  const Showimage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 4,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
