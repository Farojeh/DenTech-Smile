import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class DoctorAppointmentsContainerClip extends StatelessWidget {
  const DoctorAppointmentsContainerClip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Static.getheight(context, 238),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/state.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Color.fromARGB(80, 0, 0, 0),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }
}
