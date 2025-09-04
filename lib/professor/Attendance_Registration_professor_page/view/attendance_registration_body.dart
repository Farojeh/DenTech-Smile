import 'package:dentech_smile/professor/Attendance_Registration_professor_page/controller/cubit/attendence_report_cubit.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/app_bar_back_arrow.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/app_bar_prof_title.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/attendance_report_dialog.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/registeration_body_button.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/registeration_body_title.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/registration_list_body.dart';
import 'package:dentech_smile/professor/Home_professor_page/model/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AttendanceRegistrationBody extends StatelessWidget {
  Schedules? schedule;
  AttendanceRegistrationBody({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white.withOpacity(0),
        leading: const AppBarBackArrow(),
        title: const AppBarProfTitle(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15 , bottom: 7 , top: 7),
            child: InkWell(
              overlayColor:
                  MaterialStatePropertyAll(Colors.white.withOpacity(0)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => BlocProvider<AttendenceReportCubit>(
                    create: (context) => AttendenceReportCubit(),
                    child: AttendenceReportDialog(
                      id: schedule!.practical_id.toString(),
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black54,
                    width: 0.5
                  )
                ),
                child: Image.asset(
                  "assets/images/report.png",
                  height: 28,
                  width: 28,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [RegisterationBodyTitle(), RegistrationListBody()],
        ),
      ),
      bottomNavigationBar: RegisterationBodyButton(schedules: schedule),
    );
  }
}
