import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class AppBarTitleVideo extends StatelessWidget {
  const AppBarTitleVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add Video',
        style: TextStyle(
          fontFamily: Static.arialRoundedMTfont,
          color: Colors.black,
          fontSize: Static.getwidth(context, 25),
        ),
      ),
    );
  }
}
