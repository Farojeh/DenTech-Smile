import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Appointments_page/model/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeBlock extends StatelessWidget {
  final Times times;
  const TimeBlock({super.key, required this.times});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Static.showMyDialog(
          context,
          '${context.read<ThemeCubit>().isArabic ? Lang.arabLang["message4"]! : Lang.enLang["message4"]!}\n'
          ' ${context.read<ThemeCubit>().isArabic ? Lang.arabLang["hour"]! : Lang.enLang["hour"]!} ${times.time}  \n',
          times.id!,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width < 400
            ? MediaQuery.of(context).size.width * 0.18
            : MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width < 400 ? 36 : 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.5,
            color: const Color.fromRGBO(0, 0, 0, 0.55)),
        ),
        child: Center(
          child: Text(
            times.time!,
            style: TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width < 400
                  ? 11.5
                  : MediaQuery.of(context).size.width * 0.033,
            ),
          ),
        ),
      ),
    );
  }
}
