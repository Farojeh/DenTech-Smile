import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ProfessorArchiveAppBarTitle extends StatelessWidget {
  const ProfessorArchiveAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Cases archive',
      style: TextStyle(
        color: Colors.black,
        fontFamily: Static.arialRoundedMTfont,
        fontSize: Static.getwidth(context, 25),
      ),
    );
  }
}
