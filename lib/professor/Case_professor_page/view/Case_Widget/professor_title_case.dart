import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Case_professor_page/model/case_prof_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfessorTitleCase extends StatelessWidget {
  CaseProfModel? caseProfModel;
  ProfessorTitleCase({super.key, required this.caseProfModel});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${caseProfModel!.stage} \nClerkship',
      style: TextStyle(
        fontFamily: 'Afacad',
        fontWeight: FontWeight.w400,
        fontSize: Static.getwidth(context, 17),
      ),
      textAlign: TextAlign.center,
    );
  }
}
