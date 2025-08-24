import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Case_doctor_page/model/case_doctor_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoctorPatientName extends StatelessWidget {
  CaseDoctorModel? caseDoctorModel;
  DoctorPatientName({super.key, required this.caseDoctorModel});

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
                caseDoctorModel!.patientName!,
                style: TextStyle(
                  fontFamily: Static.arialRoundedMTfont,
                  fontSize: Static.getwidth(context, 20),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {},
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
