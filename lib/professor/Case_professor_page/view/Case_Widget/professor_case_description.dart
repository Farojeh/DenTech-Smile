import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Case_professor_page/model/case_prof_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfessorCaseDescription extends StatelessWidget {
  CaseProfModel? caseProfModel;
  ProfessorCaseDescription({super.key, required this.caseProfModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Static.getheight(context, 25)),
      child: Column(
        children: [
          Row(
            children: [
              Image(
                width: Static.getwidth(context, 25),
                height: Static.getheight(context, 25),
                image: AssetImage('assets/images/information (1) 1.png'),
              ),
              Padding(
                padding: EdgeInsets.only(left: Static.getwidth(context, 23)),
                child: Text(
                  'Case description',
                  style: TextStyle(
                    fontFamily: Static.arialRoundedMTfont,
                    fontSize: Static.getwidth(context, 18),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: Static.getheight(context, 25)),
            child: Container(
              width: Static.getwidth(context, 351),
              height: Static.getheight(context, 131),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: Static.getheight(context, 8),
                  left: Static.getwidth(context, 14),
                ),
                child: Text(
                  caseProfModel!.description!,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
