import 'package:flutter/material.dart';

class PatientCaseImage extends StatelessWidget {
  const PatientCaseImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
                top: screenHeight * 0.18,
                left: screenWidth * 0.05,
                child: CircleAvatar(
                  radius: screenWidth * 0.12,
                  backgroundImage: const AssetImage(
                    'assets/images/doctor.png',
                  ),
                ),
              );
  }
}