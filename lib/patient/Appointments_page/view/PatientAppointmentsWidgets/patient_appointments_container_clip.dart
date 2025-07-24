import 'package:flutter/material.dart';

class PatientAppointmentsContainerClip extends StatelessWidget {
  const PatientAppointmentsContainerClip({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.26,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/backgroundDoctor2.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Color.fromARGB(80, 0, 0, 0),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}
