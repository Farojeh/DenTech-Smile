import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/ImageScreen.dart';
import 'package:flutter/material.dart';

class PatientCaseToothPhotoBefor extends StatelessWidget {
  const PatientCaseToothPhotoBefor({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.015),
              child: const Text(
                ' صور للاسنان قبل العلاج',
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.02,
            vertical: size.height * 0.01,
          ),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size.width > 600 ? 6 : 3,
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
                  width: size.width * 0.08,
                  height: size.width * 0.08,
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
