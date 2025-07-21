import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Appointments_doctor/view/patient_appointments_doctor_text.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_arrow.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_container_clip.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_image.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_list.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_row.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:dentech_smile/patient/Home_page/model/request_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/wave_clipper.dart';

class AppointmentsDoctorPage extends StatelessWidget {
  final RequestStatusModel student;
  final int index;

  const AppointmentsDoctorPage(
      {super.key, required this.student, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => PatientCubit()
        ..getAppointmentDoctor(student.students![index].id!, student.stageId!),
      child: Directionality(
        textDirection: context.watch<ThemeCubit>().isArabic
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox.expand(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: PatientAppointmentsContainerClip(),
                ),
                Positioned(
                  top: screenHeight * 0.32,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: SizedBox(
                        width: screenWidth,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PatientAppointmentsRow(),
                              PatientAppointmentsList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                PatientAppointmentsArrow(),
                PatientAppointmentsDoctorText(
                  student: student,
                  index: index,
                ),
                PatientAppointmentsImage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
