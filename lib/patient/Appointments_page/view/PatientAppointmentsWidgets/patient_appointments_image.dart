import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class PatientAppointmentsImage extends StatelessWidget {
  final String img;
  const PatientAppointmentsImage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Static.gethieght(context, 170),
      left: Static.gethieght(context, 30),
      child: Container(
        height: Static.gethieght(context, 100),
        width: Static.getwieght(context, 100),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 0.5, color: Colors.black),
        ),
        child: ClipOval(
          child: img == ''
              ? Image.asset(
                  "assets/images/female-doctor.png",
                  fit: BoxFit.cover,
                )
              : Image.network(
                  img,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
