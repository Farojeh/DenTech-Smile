import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/ImageScreen.dart';
import 'package:flutter/material.dart';

class ProfessorCaseToothPhotoBefor extends StatelessWidget {
  const ProfessorCaseToothPhotoBefor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              width: Static.getwidth(context, 25),
              height: Static.getheight(context, 25),
              image: AssetImage('assets/images/befor.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: Static.getwidth(context, 23)),
              child: Text(
                'Before treatment',
                style: TextStyle(
                  fontFamily: Static.arialRoundedMTfont,
                  fontSize: Static.getwidth(context, 18),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Static.getheight(context, 25),
            right: Static.getwidth(context, 22),
            left: Static.getwidth(context, 22),
          ),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ImageScreen(
                        imagePath: 'assets/images/Rectangle.png',
                        heroTag: 'img$index',
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  width: Static.getwidth(context, 109),
                  height: Static.getheight(context, 100),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/Rectangle.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
