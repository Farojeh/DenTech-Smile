import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class TopHomeView extends StatelessWidget {
  const TopHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (MediaQuery.of(context).size.width / 430) * 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/drawer.png",
            height: (MediaQuery.of(context).size.height / 932) * 40,
            width: (MediaQuery.of(context).size.height / 932) * 40,
          ),
          const SizedBox(
            width: 13,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Areej Mahfouz",
                style: TextStyle(
                    fontFamily: Static.arialRoundedMTfont,
                    color: Colors.black,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DenTech Smile",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: Static.afacadfont,
                        fontWeight: FontWeight.w400,
                        color: Static.lightcolor2),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    "assets/images/tooth.png",
                    height: 13,
                    width: 13,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: (MediaQuery.of(context).size.height / 932) * 55,
            width: (MediaQuery.of(context).size.height / 932) * 55,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/student.jpg",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
