import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Case_page/model/case_info_model.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/patient_case_session_date_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientCaseAppointments extends StatelessWidget {
  final List<AppointmentDates> appintments;
  const PatientCaseAppointments({super.key, required this.appintments});

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
                    ? Lang.arabLang["appointments"]!
                    : Lang.enLang["appointments"]!,
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
          padding: EdgeInsets.only(
            right: size.width * 0.02,
            left: size.width * 0.02,
            top: size.height * 0.01,
            bottom: size.height * 0.01,
          ),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: appintments.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size.width > 600 ? 4 : 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 12,
              childAspectRatio: 5,
            ),
            itemBuilder: (context, index) {
              return PatientCaseSessionDateBlock(
                appointment: appintments[index] ,
              );
            },
          ),
        ),
      ],
    );
  }
}
