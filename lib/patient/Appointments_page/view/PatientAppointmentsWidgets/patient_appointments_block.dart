import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Appointments_page/model/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'time_block.dart';

class PatientAppointmentsBlock extends StatelessWidget {
  final AvailableAppointments appointments;
  const PatientAppointmentsBlock({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: 6,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width:  6,
                    height:  6,
                    decoration: const BoxDecoration(
                      color: Styles.basicColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.015),
                  Text(
                    appointments.day ?? '',
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w600,
                      fontSize: Static.getwieght(context, 18),
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 6),
              Text(
                appointments.date ?? '',
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w600,
                  fontSize: isSmallScreen ? 13 : screenWidth * 0.038,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: (appointments.times == null || appointments.times!.isEmpty)
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "[ ${context.watch<ThemeCubit>().isArabic
                          ? Lang.arabLang["message3"]!
                          : Lang.enLang["message3"]!} ]",
                      style: TextStyle(
                        fontFamily: 'Afacad',
                        fontSize: Static.getwieght(context, 18),
                        fontWeight: FontWeight.w500,
                        color: Styles.basicColor,
                      ),
                    ),
                  )
                : SizedBox(
                    height: isSmallScreen ? 40 : 48,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: appointments.times!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TimeBlock(times: appointments.times![index]),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
