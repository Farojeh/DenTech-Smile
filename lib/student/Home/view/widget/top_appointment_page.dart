import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopAppointmentPage extends StatelessWidget {
  const TopAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
                alignment: Alignment.center,
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.black)),
                child: Image.asset(
                  "assets/images/left-arrow.png",
                  height: 18,
                  width: 18,
                  fit: BoxFit.contain,
                )),
          ),
          const SizedBox(
            width: 13,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Appointments",
                  style: TextStyle(
                      fontFamily: Static.arialRoundedMTfont,
                      color: Colors.black,
                      fontSize: 17),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  "Enter your college attendance dates",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      color: Static.lightcolor2,
                      fontSize: 12),
                ),
              ])
        ]);
  }
}
