import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class PatientAppointmentsImage extends StatelessWidget {
  const PatientAppointmentsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Static.gethieght(context, 180),
      left: Static.gethieght(context, 30),
      child: Container(
        height: Static.gethieght(context, 100),
        width: Static.getwieght(context, 100),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 0.5, color: Colors.black),
          image:const DecorationImage(
            image: AssetImage(
                "assets/images/smiling-young-male-dentist-holding-toothbrush 1.png"),
            fit: BoxFit.cover,
          ),
        ),
        // child: ClipOval(
        //   child: Image.asset(
        //     "assets/images/smiling-young-male-dentist-holding-toothbrush 1.png",
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ),
    );
  }
}
