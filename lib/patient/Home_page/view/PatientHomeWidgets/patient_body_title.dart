
import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientBodyTitle extends StatelessWidget {
  const PatientBodyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.watch<ThemeCubit>().isArabic
                ? Lang.arabLang["availabeDoctor"]!
                : Lang.enLang["availabeDoctor"]!,
            style: const TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Text(
            context.watch<ThemeCubit>().isArabic
                ? Lang.arabLang["oral"]!
                : Lang.enLang["oral"]!,
            style: const TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 54, 54, 54),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
