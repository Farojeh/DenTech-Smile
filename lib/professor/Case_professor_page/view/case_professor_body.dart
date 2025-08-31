import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Case_professor_page/controller/case_cubit.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_app_bar_arrow_case.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_app_bar_case_title.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_appointments_container_clip.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_case_button.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_case_description.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_case_image.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_case_tooth_photo_after.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_case_tooth_photo_befor.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_case_xray_image.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_patient_name.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/Case_Widget/professor_title_case.dart';
import 'package:dentech_smile/widget/wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaseProfessorBody extends StatelessWidget {
 final String studentId;
  final String sessionId;
  const CaseProfessorBody({super.key, required this.studentId, required this.sessionId,});

  @override
  Widget build(BuildContext context) {
    print("*************************************************** $studentId");
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<CaseCubit>().getProfCase(int.parse(studentId), int.parse(sessionId)),
    );
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
          final caseDetails = context.read<CaseCubit>().caseProfModel;

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
                            child: const ProfessorAppointmentsContainerClip(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
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
                                   const ProfessorAppBarArrowCase(),
                                  const SizedBox(width: 10,),
                                    ProfessorAppBarCaseTitle(
                                      caseProfModel: caseDetails,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Static.getheight(context, 40)),
                              Row(
                                children: [
                                 const ProfessorCaseImage(),
                                  SizedBox(
                                    width: Static.getwidth(context, 100),
                                  ),
                                  ProfessorTitleCase(
                                    caseProfModel: caseDetails,
                                  ),
                                ],
                              ),
                              SizedBox(height: Static.getheight(context, 25)),
                              ProfessorPatientName(),
                              ProfessorCaseDescription(
                                caseProfModel: caseDetails,
                              ),
                              ProfessorCaseXrayImage(
                                image: "assets/images/XRay.png",
                              ),
                              ProfessorCaseToothPhotoBefor(),
                              ProfessorCaseToothPhotoAfter(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: Static.getheight(context, 40.0),
                  right: Static.getwidth(context, 40.0),
                  child: ProfessorCaseButton(sessionId: int.parse(studentId)),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Styles.basicColor),
            ),
          );
        }
      },
    );
  }
}
