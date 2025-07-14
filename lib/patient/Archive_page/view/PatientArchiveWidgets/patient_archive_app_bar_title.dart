import 'package:flutter/material.dart';

class PatientArchiveAppBarTitle extends StatelessWidget {
  const PatientArchiveAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    return Text(
            'ارشيف الحالات',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w700,
              fontSize: screenWidth * 0.05,
            ),
          );
  }
}