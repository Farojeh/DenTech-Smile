import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Case_doctor_page/model/case_doctor_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoctorAppBarCaseTitle extends StatelessWidget {
  CaseDoctorModel? caseDoctorModel;
  DoctorAppBarCaseTitle({super.key, required this.caseDoctorModel});

  @override
  Widget build(BuildContext context) {
    return Text(
      caseDoctorModel!.studentName!,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Afacad',
        fontWeight: FontWeight.w500,
        fontSize: Static.getwidth(context, 25),
      ),
    );
  }
}
