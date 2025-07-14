import 'package:flutter/material.dart';

class PatientAppointmentsRow extends StatelessWidget {
  const PatientAppointmentsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
                            children: [
                              Image(
                                image: const AssetImage(
                                  'assets/images/information.png',
                                ),
                                width: screenWidth * 0.07,
                                height: screenWidth * 0.07,
                              ),
                              SizedBox(width: screenWidth * 0.015),
                              Text(
                                'المواعيد المتاحة',
                                style: TextStyle(
                                  fontFamily: 'Afacad',
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.045,
                                ),
                              ),
                            ],
                          );
  }
}