import 'package:flutter/material.dart';

class PatientCaseImage extends StatelessWidget {
  final String img;
  const PatientCaseImage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
        top: screenHeight * 0.18,
        left: screenWidth * 0.05,
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0),
          radius: screenWidth * 0.12,
          child: ClipOval(
            child: (img == '')
                ? Image.asset(
                    'assets/images/doctor.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Image.network(
                    img,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
          ),
        ));
  }
}
