import 'package:flutter/material.dart';

class PatientAppointmentsArrow extends StatelessWidget {
  const PatientAppointmentsArrow({super.key});

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
                top: screenHeight * 0.05,
                right: screenWidth * 0.04,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).maybePop(),
                  child: Container(
                    width: screenWidth * 0.08,
                    height: screenWidth * 0.08,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.24),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromRGBO(0, 0, 0, 0.51),
                        width: 0.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/Vector.png',
                      width: screenWidth * 0.03,
                      height: screenHeight * 0.025,
                    ),
                  ),
                ),
              );
  }
}