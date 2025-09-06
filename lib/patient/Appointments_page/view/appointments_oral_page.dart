
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_arrow.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_container_clip.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_image.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_list.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_row.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_text.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:dentech_smile/patient/Home_page/model/oral_doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widget/wave_clipper.dart';

class AppointmentsOralPage extends StatelessWidget {
  final Students student;

  const AppointmentsOralPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => PatientCubit()..getAppointmentDoctor(student.id!, 3,context),
      child: Directionality(
        textDirection: context.watch<ThemeCubit>().isArabic
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: const PatientAppointmentsContainerClip(),
                ),
                Positioned(
                  top: Static.gethieght(context, 277),
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: screenWidth,
                    color: Colors.white,
                    child: const SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PatientAppointmentsRow(),
                          SizedBox(height: 10),
                          PatientAppointmentsList(),
                        ],
                      ),
                    ),
                  ),
                ),
                const PatientAppointmentsArrow(),
                PatientAppointmentsText(student: student),
                 PatientAppointmentsImage(
                  img:student.profileImage==''?'': '${Static.urlimagewithoutstorage}${student.profileImage}',
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
