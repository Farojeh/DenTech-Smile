import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_arrow.dart';
import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_container_clip.dart';
import 'package:dentech_smile/patient/Archive_page/model/ArchiveModel.dart';
import 'package:dentech_smile/patient/Case_page/controller/patient_case_cubit.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/patient_case_appointments.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/patient_case_description.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/patient_case_image.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/patient_case_text.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/patient_case_tooth_photo_befor.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/patient_case_tooth_photo_after.dart';
import 'package:dentech_smile/patient/Case_page/view/PatientCaseWidgets/patient_case_xray_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widget/wave_clipper.dart';

class CasePage extends StatelessWidget {
  final StudentsArchive student;

  const CasePage({super.key, required this.student});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => PatientCaseCubit()
        ..getCaseInfoByIdStudentStage(student.studentId!, student.stageId!),
      child: BlocConsumer<PatientCaseCubit, PatientCaseState>(
        listener: (context, state) {
          if (state is PatientCaseFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          if (state is PatientCaseInfoSuccess) {
            final caseInfoModel = state.caseInfoModel;
            return Directionality(
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
                        child: const PatientAppointmentsContainerClip(),
                      ),
                      Positioned.fill(
                        top: size.height * 0.30,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04,
                              vertical: size.height * 0.01,
                            ),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  PatientCaseDescription(
                                    description:
                                        caseInfoModel.sessionDescription!,
                                  ),
                                  PatientCaseAppointments(
                                    appintments:
                                        caseInfoModel.appointmentDates!,
                                  ),
                                  const PatientCaseXrayImage(
                                    image: "assets/images/XRay.png",
                                  ),
                                  const PatientCaseToothPhotoBefor(),
                                  const PatientCaseToothPhotoAfter(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const PatientAppointmentsArrow(),
                      PatientCaseText(student: student),
                      const PatientCaseImage(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            {
              return Scaffold(
                body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
