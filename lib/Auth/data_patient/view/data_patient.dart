import 'package:dentech_smile/Auth/data_patient/view/widget/data_patient_body.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/data_patient_button.dart';
import 'package:flutter/material.dart';

class DatePatient extends StatelessWidget {
  const DatePatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Stack(
        children: [
          DataPatientBody(),
          // Onboardingbutton(),
          Positioned(bottom: 20, child: DataPatientButton())
        ],
      ),
    ));
  }
}