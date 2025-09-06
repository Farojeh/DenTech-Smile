import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_app_bar_arrow_case.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_app_bar_case_title.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_appointments_container_clip.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_case_description.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_case_image.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_case_tooth_photo_after.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_case_tooth_photo_befor.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_case_xray_image.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_patient_name.dart';
import 'package:dentech_smile/professor/Case_doctor_page/view/Case_Widget/doctor_title_case.dart';
import 'package:dentech_smile/professor/Case_professor_page/controller/case_cubit.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_case_button.dart';
import 'package:dentech_smile/widget/wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CaseDoctorBody extends StatelessWidget {
  String sessionId;
  String score;
  CaseDoctorBody({super.key, required this.score, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CaseCubit, CaseState>(
      listener: (context, state) {
        if (state is CaseFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is CaseSuccess) {
          final caseDetails = context.read<CaseCubit>().caseDoctorModel;
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: Static.getheight(context, 200),
                          width: double.infinity,
                          child: ClipPath(
                            clipper: WaveClipper(),
                            child: const DoctorAppointmentsContainerClip(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            // top: Static.gethieght(context, 10),
                            left: Static.getwidth(context, 26),
                            right: Static.getwidth(context, 26),
                            bottom: Static.getheight(context, 100),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: Static.getheight(context, 20),
                                ),
                                child: Row(
                                  children: [
                                    const DoctorAppBarArrowCase(),
                                     const SizedBox(width: 10,),
                                    DoctorAppBarCaseTitle(
                                      caseDoctorModel: caseDetails,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Static.getheight(context, 40)),
                              Row(
                                children: [
                                   DoctorCaseImage(url: caseDetails!.studentImage,),
                                  SizedBox(
                                    width: Static.getwidth(context, 100),
                                  ),
                                  DoctorTitleCase(caseDoctorModel: caseDetails),
                                ],
                              ),
                              SizedBox(height: Static.getheight(context, 25)),
                              DoctorPatientName(caseDoctorModel: caseDetails , patientid: caseDetails.patientid!,),
                              DoctorCaseDescription(
                                caseDoctorModel: caseDetails,
                              ),
                               DoctorCaseXrayImage(
                                image: caseDetails.radiologyImage!,
                              ),
                               DoctorCaseToothPhotoBefor(photos: caseDetails.beforeImages??[],),
                               DoctorCaseToothPhotoAfter(photos: caseDetails.beforeImages??[],),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (double.parse(score) == 0.0)
                  Positioned(
                    bottom: Static.getheight(context, 40.0),
                    right: Static.getwidth(context, 40.0),
                    child: ProfessorCaseButton(sessionId: int.parse(sessionId)),
                  ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Styles.basicColor),
            ),
          );
        }
      },
    );
  }
}
