import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ProfessorPatientName extends StatelessWidget {
  const ProfessorPatientName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(
              width: Static.getwidth(context, 25),
              height: Static.getheight(context, 25),
              image: AssetImage('assets/images/info copy.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: Static.getwidth(context, 23)),
              child: Text(
                'Aleen Morad',
                style: TextStyle(
                  fontFamily: Static.arialRoundedMTfont,
                  fontSize: Static.getwidth(context, 20),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: Static.getwidth(context, 28)),
            child: Text(
              'show info',
              style: TextStyle(
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(context, 18),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
