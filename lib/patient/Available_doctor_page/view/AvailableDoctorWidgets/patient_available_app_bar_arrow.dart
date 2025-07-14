import 'package:flutter/material.dart';

class PatientAvailableAppBarArrow extends StatelessWidget {
  const PatientAvailableAppBarArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.005,
              bottom: screenHeight * 0.005,
              right: screenWidth * 0.02,
            ),
            child: GestureDetector(
              onTap: () => Navigator.of(context).maybePop(),
              child: Container(
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
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
                  width: screenWidth * 0.06,
                  height: screenWidth * 0.06,
                ),
              ),
            ),
          );
  }
}