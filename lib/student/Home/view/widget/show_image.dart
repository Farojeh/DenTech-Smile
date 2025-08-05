import 'dart:io';

import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class Showimage extends StatelessWidget {
  final bool file;
  final String imagePath;

  const Showimage({Key? key, required this.imagePath, required this.file})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: !file
            ? InteractiveViewer(
                panEnabled: true,
                minScale: 0.5,
                maxScale: 4,
                child: Image.network("${Static.urlimage}$imagePath"),
              )
            : Image.file(File(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
