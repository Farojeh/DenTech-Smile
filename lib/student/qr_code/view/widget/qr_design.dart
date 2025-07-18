import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class QrDesign extends StatelessWidget {
  const QrDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/qr-code-scan 1.png",
              height: 35,
              width: 35,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Qr Code ",
              style: TextStyle(
                  fontFamily: Static.arialRoundedMTfont,
                  fontSize: 30,
                  color: Colors.black),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          alignment: Alignment.center,
          child: Text(
            "Please place the screen in front of the professor's camera to scan the code and return the last case to be evaluated",
            style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
