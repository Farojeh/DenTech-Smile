import 'package:flutter/material.dart';

class PatientAvailabeAppBarTitle extends StatelessWidget {
  const PatientAvailabeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Text(
            'الأطباء المتاحين',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w700,
              fontSize: screenWidth * 0.05,
            ),
          )
        ;
  }
}
