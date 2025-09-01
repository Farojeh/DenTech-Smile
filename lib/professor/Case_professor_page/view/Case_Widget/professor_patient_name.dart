import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/patient_info_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfessorPatientName extends StatelessWidget {
  final int patientid ;
  const ProfessorPatientName({super.key, required this.patientid});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(
              width: Static.getwidth(context, 25),
              height: Static.getheight(context, 25),
              image: AssetImage('assets/images/info copy.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: Static.getwidth(context, 23)),
              child: Text(
                'Aleen Morad',
                style: TextStyle(
                  fontFamily: Static.arialRoundedMTfont,
                  fontSize: Static.getwidth(context, 20),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
             showDialog(
        context: context,
        builder: (context) => BlocProvider<PatientInfoCubit>(
          create: (context) => PatientInfoCubit(patientid),
          child: const InfoDialog(),
        ),
      );
          },
          child: Padding(
            padding: EdgeInsets.only(right: Static.getwidth(context, 28)),
            child: Text(
              'show info',
              style: TextStyle(
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(context, 18),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
