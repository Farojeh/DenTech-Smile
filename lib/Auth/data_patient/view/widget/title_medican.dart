import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class TitleMedican extends StatelessWidget {
  const TitleMedican({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "الرجاء التقاط صور ",
              style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: (MediaQuery.of(context).size.width / 430) * 20,
              ),
            ),
            Text(
              "للادوية الطبية ",
              style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                color: Static.basiccolor,
                fontSize: (MediaQuery.of(context).size.width / 430) * 20,
              ),
            ),
            Text(
              "التي تتناولها ",
              style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: (MediaQuery.of(context).size.width / 430) * 20,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "بحيث تظهر ",
              style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: (MediaQuery.of(context).size.width / 430) * 20,
              ),
            ),
            Text(
              "الاسم التجاري ",
              style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                color: Static.basiccolor,
                fontSize: (MediaQuery.of(context).size.width / 430) * 20,
              ),
            ),
            Text(
              "او ",
              style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: (MediaQuery.of(context).size.width / 430) * 20,
              ),
            ),
            Text(
              "الاسم العلمي",
              style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                color: Static.basiccolor,
                fontSize: (MediaQuery.of(context).size.width / 430) * 20,
              ),
            )
          ],
        ),
      ],
    );
  }
}
