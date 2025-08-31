import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/app_bar_back_arrow.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/app_bar_prof_title.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/registeration_body_button.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/registeration_body_title.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/registration_list_body.dart';
import 'package:dentech_smile/professor/Home_professor_page/model/schedule_model.dart';
import 'package:flutter/material.dart';

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
        leading: const AppBarBackArrow(), title: const AppBarProfTitle()),
      body: const SingleChildScrollView(
        child: Column(
          children: [RegisterationBodyTitle(), RegistrationListBody()],
        ),
      ),
      bottomNavigationBar: RegisterationBodyButton(schedules: schedule),
    );
  }
}
