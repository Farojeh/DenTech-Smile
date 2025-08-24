import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Case_professor_page/view/dialog_evaluate_professor.dart';
import 'package:flutter/material.dart';

class ProfessorCaseButton extends StatelessWidget {
  const ProfessorCaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: Static.getwidth(context, 150),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                Static.getwidth(context, 150),
                Static.getheight(context, 52),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Styles.basicColor,
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
              elevation: 4,
              side: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                width: Static.getwidth(context, 0.5),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogEvaluateProfessor();
                },
              );
            },
            child: Text(
              'Evaluate',
              style: TextStyle(
                fontFamily: 'ArialRounded',
                fontSize: Static.getwidth(context, 20),
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
