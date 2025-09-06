import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientCaseDescription extends StatelessWidget {
  final String description;
  const PatientCaseDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            const Image(
              width: 30,
              height: 30,
              image: AssetImage('assets/images/information (1) 1.png'),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.015),
              child: Text(
                context.watch<ThemeCubit>().isArabic
                    ? Lang.arabLang["description"]!
                    : Lang.enLang["description"]!,
                style:const TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.01 , bottom: size.height * 0.01),
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Text(
                softWrap: true,
                textAlign: TextAlign.center,
                description,
                style:const TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color.fromRGBO(46, 45, 45, 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
