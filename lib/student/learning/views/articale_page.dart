import 'package:dentech_smile/student/learning/model/artical.dart';
import 'package:dentech_smile/student/learning/views/widget/background.dart';
import 'package:dentech_smile/student/learning/views/widget/main_articale.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ArticalePage extends StatelessWidget {
  final Artical artical;
  const ArticalePage({super.key, required this.artical});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        background(
          image: artical.image,
          isimage: artical.isimage,
        ),
        shsh(),
        MainArticale(
            image: artical.image,
            title: artical.title,
            author: "Dr ${artical.author}",
            artical: artical.artical,
            time: artical.time,
            isimage: artical.isimage,)
      ],
    ));
  }

  BackdropFilter shsh() {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        color: Colors.black.withOpacity(0),
      ),
    );
  }
}
