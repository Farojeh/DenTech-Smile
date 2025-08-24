import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class AppBarProfTitle extends StatelessWidget {
  const AppBarProfTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Attendance Registration',
      style: TextStyle(
        fontFamily: 'ArialRounded',
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: Static.getwidth(context, 22),
      ),
    );
  }
}
