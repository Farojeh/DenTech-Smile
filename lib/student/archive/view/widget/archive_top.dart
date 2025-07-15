import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ArchiveTop extends StatelessWidget {
  const ArchiveTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/archives 1.png",
          height: 30,
          width: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "Emergency Archive",
          style: TextStyle(
              fontFamily: Static.arialRoundedMTfont,
              color: Colors.black,
              fontSize: 20),
        )
      ],
    );
  }
}
