import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/image_screen.dart';
import 'package:flutter/material.dart';

class DoctorCaseToothPhotoBefor extends StatelessWidget {
  final List<String> photos ;
  const DoctorCaseToothPhotoBefor({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              width: Static.getwidth(context, 25),
              height: Static.getheight(context, 25),
              image:const AssetImage('assets/images/befor.png'),
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
            itemCount: photos.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
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
                        imagePath: "${Static.urlimagewithoutstorage}${photos[index]}",
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
                    child:  Image.network("${Static.urlimagewithoutstorage}${photos[index]}",
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
