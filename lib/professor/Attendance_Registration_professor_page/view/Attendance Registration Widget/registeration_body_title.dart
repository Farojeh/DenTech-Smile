import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class RegisterationBodyTitle extends StatelessWidget {
  const RegisterationBodyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Select only students who are not in the \nlecture',
        style: TextStyle(
          fontFamily: 'Afacad',
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: Static.getwidth(context, 18),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
