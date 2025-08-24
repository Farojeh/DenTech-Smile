import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/ImageScreen.dart';
import 'package:flutter/material.dart';

class ProfessorCaseXrayImage extends StatelessWidget {
  final String image;
  const ProfessorCaseXrayImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Static.getheight(context, 25)),
      child: Column(
        children: [
          Row(
            children: [
              Image(
                width: Static.getwidth(context, 25),
                height: Static.getheight(context, 25),
                image: AssetImage('assets/images/x-rays.png'),
              ),
              Padding(
                padding: EdgeInsets.only(left: Static.getwidth(context, 23)),
                child: Text(
                  'X-ray image',
                  style: TextStyle(
                    fontFamily: Static.arialRoundedMTfont,
                    fontSize: Static.getwidth(context, 18),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              int index = 1;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      ImageScreen(imagePath: image, heroTag: 'img$index'),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Static.getwidth(context, 23),
                vertical: Static.getheight(context, 23),
              ),
              child: SizedBox(
                width: Static.getwidth(context, 323),
                height: Static.getheight(context, 215),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
