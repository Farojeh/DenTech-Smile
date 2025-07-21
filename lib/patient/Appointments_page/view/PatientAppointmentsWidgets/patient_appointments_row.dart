import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientAppointmentsRow extends StatelessWidget {
  const PatientAppointmentsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Image(
          image: const AssetImage(
            'assets/images/information.png',
          ),
          width: screenWidth * 0.07,
          height: screenWidth * 0.07,
        ),
        SizedBox(width: screenWidth * 0.015),
        Text(
          context.watch<ThemeCubit>().isArabic
              ? Lang.arabLang["available_appointment"]!
              : Lang.enLang["available_appointment"]!,
          style: TextStyle(
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.045,
          ),
        ),
      ],
    );
  }
}
