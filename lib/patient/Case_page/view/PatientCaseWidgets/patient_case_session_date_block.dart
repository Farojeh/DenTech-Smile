import 'package:dentech_smile/patient/Case_page/model/case_info_model.dart';
import 'package:flutter/material.dart';

class PatientCaseSessionDateBlock extends StatelessWidget {
  final AppointmentDates appointment;
  const PatientCaseSessionDateBlock({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: appointment.isDone == "true"
            ? const Color(0xFF66A8AC)
            : const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appointment.time!,
            style: const TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 3),
          Text(
            appointment.date!,
            style: const TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
