import 'package:flutter/material.dart';

class PatientAvailableAppBarAction extends StatelessWidget {
  const PatientAvailableAppBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return  Padding(
              padding: EdgeInsets.all(screenWidth * 0.035),
              child: Text(
                'تسوس اسنان',
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 54, 54, 54),
                  fontSize: screenWidth * 0.03,
                ),
              ),
            );
  }
}