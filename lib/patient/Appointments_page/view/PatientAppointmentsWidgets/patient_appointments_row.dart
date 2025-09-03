import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientAppointmentsRow extends StatelessWidget {
  const PatientAppointmentsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image(
            image: const AssetImage('assets/images/information 1.png'),
            width: Static.gethieght(context, 32),
            height: Static.gethieght(context, 32),
          ),
          const SizedBox(width: 15),
          Text(
            context.watch<ThemeCubit>().isArabic
                ? Lang.arabLang["available_appointment"]!
                : Lang.enLang["available_appointment"]!,
            style: TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwieght(context, 25),
            ),
          ),
        ],
      ),
    );
  }
}
