import 'package:dentech_smile/Auth/data_patient/view/widget/data_patient_body.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/data_patient_button.dart';
import 'package:dentech_smile/Auth/on_boarding/view/widget/translate_widget.dart';
import 'package:flutter/material.dart';

class DatePatient extends StatelessWidget {
  const DatePatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:  Stack(
        children: [
         const DataPatientBody(),
          // Onboardingbutton(),
          Positioned(bottom: MediaQuery.of(context).size.height*0.025, child:const DataPatientButton()),
         const Positioned(top: 30, right: 10, child: TranslateWidget())
        ],
      ),
    ));
  }
}
