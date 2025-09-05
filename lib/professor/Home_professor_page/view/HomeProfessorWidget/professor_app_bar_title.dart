import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ProfessorAppBarTitle extends StatelessWidget {
  const ProfessorAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr.Lina Saeed',
              style: TextStyle(
                fontFamily: Static.arialRoundedMTfont,
                color: Colors.black,
                fontSize: (size.width / 430) * 20,
              ),
            ),
            Row(
              children: [
                Text(
                  'DenTech Smile',
                  style: TextStyle(
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w400,
                    fontSize: (size.width / 430) * 16,
                    color: Color.fromRGBO(81, 81, 81, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "assets/images/tooth.png",
                    width: (size.width / 430) * 16,
                    height: (size.height / 932) * 16,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
