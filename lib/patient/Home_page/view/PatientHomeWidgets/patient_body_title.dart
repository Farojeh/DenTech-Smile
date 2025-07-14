import 'package:flutter/material.dart';

class PatientBodyTitle extends StatelessWidget {
  const PatientBodyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الأطباء المتاحين',
          style: TextStyle(
            fontFamily: 'Afacad',
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Text(
          'طب الفم',
          style: TextStyle(
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 54, 54, 54),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
