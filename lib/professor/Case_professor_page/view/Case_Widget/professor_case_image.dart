import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ProfessorCaseImage extends StatelessWidget {
  const ProfessorCaseImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Static.getwidth(context, 90),
      height: Static.getheight(context, 90),
      child:const CircleAvatar(
        radius: 15,
        backgroundImage:  AssetImage('assets/images/doctor.png'),
      ),
    );
  }
}
