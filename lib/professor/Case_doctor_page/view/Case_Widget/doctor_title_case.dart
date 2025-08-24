import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Case_doctor_page/model/case_doctor_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoctorTitleCase extends StatelessWidget {
  CaseDoctorModel? caseDoctorModel;
  DoctorTitleCase({super.key, required this.caseDoctorModel});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${caseDoctorModel!.stage} \nClerkship',
      style: TextStyle(
        fontFamily: 'Afacad',
        fontWeight: FontWeight.w400,
        fontSize: Static.getwidth(context, 17),
      ),
      textAlign: TextAlign.center,
    );
  }
}
