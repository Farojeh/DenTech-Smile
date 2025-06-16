import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class TopLoginPage extends StatelessWidget {
  const TopLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height / 932) * 10,
        ),
        Text(
          "Welcome Back !",
          style: TextStyle(
              fontFamily: Static.afacadfont,
              fontSize: (MediaQuery.of(context).size.width / 430) * 35,
              fontWeight: FontWeight.w700,
              color: Static.basiccolor),
        ),
        Container(
           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
          child: Text(
            "welcome back again in DenTeck smile as student",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: Static.afacadfont,
                fontSize: (MediaQuery.of(context).size.width / 430) * 16,
                fontWeight: FontWeight.w400,
                color: Static.lightcolor),
          ),
        ),
      ],
    );
  }
}