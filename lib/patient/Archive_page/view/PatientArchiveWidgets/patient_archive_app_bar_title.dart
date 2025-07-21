import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientArchiveAppBarTitle extends StatelessWidget {
  const PatientArchiveAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Text(
      context.watch<ThemeCubit>().isArabic
          ? Lang.arabLang["Archive_status"]!
          : Lang.enLang["Archive_status"]!,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Afacad',
        fontWeight: FontWeight.w700,
        fontSize: screenWidth * 0.05,
      ),
    );
  }
}
