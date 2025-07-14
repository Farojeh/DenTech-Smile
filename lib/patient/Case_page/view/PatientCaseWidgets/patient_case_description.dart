import 'package:flutter/material.dart';

class PatientCaseDescription extends StatelessWidget {
  final String description;
  const PatientCaseDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            const Image(
              width: 30,
              height: 30,
              image: AssetImage('assets/images/information (1) 1.png'),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.015),
              child: const Text(
                'وصف الحالة',
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.005),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                softWrap: true,
                textAlign: TextAlign.center,
                description,
                style: TextStyle(
                  fontFamily: 'Afacad',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color.fromRGBO(46, 45, 45, 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
