
import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientAppBarTitle extends StatelessWidget {
  const PatientAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.35,
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DenTech Smile',
              style: TextStyle(
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 81, 81, 81),
                fontSize: size.width * 0.04,
              ),
            ),
            Row(
              children: [
                Text(
                  context.watch<ThemeCubit>().isArabic
                      ? Lang.arabLang["Hello"]!
                      : Lang.enLang["Hello"]!,
                  style: TextStyle(
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w700,
                    fontSize: size.width * 0.037,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'أريج محفوظ',
                  style: TextStyle(
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w700,
                    fontSize: size.width * 0.037,
                    color: Styles.basicColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
