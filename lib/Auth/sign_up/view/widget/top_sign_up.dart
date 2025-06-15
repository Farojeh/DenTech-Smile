import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class TopSignPage extends StatelessWidget {
  const TopSignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height / 932) * 10,
        ),
        Text(
          "انشاء حساب",
          style: TextStyle(
              fontFamily: Static.afacadfont,
              fontSize: (MediaQuery.of(context).size.width / 430) * 35,
              fontWeight: FontWeight.w700,
              color: Static.basiccolor),
        ),
        Text(
          "دعنا نساعدك لانشاء حساب على تطبيقنا",
          style: TextStyle(
              fontFamily: Static.afacadfont,
              fontSize: (MediaQuery.of(context).size.width / 430) * 18,
              fontWeight: FontWeight.w400,
              color: Static.lightcolor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/images/tooth.png",
              height: 15,
              width: 15,
              fit: BoxFit.contain,
            ),
           const SizedBox(
              width: 5,
            ),
            Text(
              "DenTech Smile",
              style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.width / 430) * 18,
                  fontFamily: Static.afacadfont,
                  fontWeight: FontWeight.w400,
                  color: Static.lightcolor),
            ),
          ],
        ),
      ],
    );
  }
}
