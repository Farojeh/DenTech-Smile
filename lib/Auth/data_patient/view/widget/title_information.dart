import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class TitleInformation extends StatelessWidget {
  const TitleInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "الرجاء قم بادخال ",
            style: TextStyle(
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: (MediaQuery.of(context).size.width / 430) * 20,
            ),
          ),
          Text(
            "بياناتك الشخصية ",
            style: TextStyle(
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w700,
              color: Static.basiccolor,
              fontSize: (MediaQuery.of(context).size.width / 430) * 20,
            ),
          ),
          Text(
            "بدقة ",
            style: TextStyle(
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: (MediaQuery.of(context).size.width / 430) * 20,
            ),
          ),
        ],
      ),
    );
  }
}
