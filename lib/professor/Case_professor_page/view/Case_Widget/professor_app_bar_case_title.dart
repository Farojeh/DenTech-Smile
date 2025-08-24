import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Case_professor_page/model/case_prof_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfessorAppBarCaseTitle extends StatelessWidget {
  CaseProfModel? caseProfModel;
  ProfessorAppBarCaseTitle({super.key, required this.caseProfModel});

  @override
  Widget build(BuildContext context) {
    return Text(
      caseProfModel!.studentName!,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Afacad',
        fontWeight: FontWeight.w500,
        fontSize: Static.getwidth(context, 25),
      ),
    );
  }
}
