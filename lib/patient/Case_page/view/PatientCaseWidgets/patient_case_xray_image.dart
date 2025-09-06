import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientCaseXrayImage extends StatelessWidget {
  final String image;
  const PatientCaseXrayImage({super.key, required this.image});

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
              child: Text(
                context.watch<ThemeCubit>().isArabic
                    ? Lang.arabLang["xray"]!
                    : Lang.enLang["xray"]!,
                style: const TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
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
                builder: (_) => ImageScreen(
                    imagePath: "${Static.urlimagewithoutstorage}$image",
                    heroTag: 'img$index'),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: size.height * 0.01,
            ),
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.25,
              child: Image.network(
                "${Static.urlimagewithoutstorage}$image",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
