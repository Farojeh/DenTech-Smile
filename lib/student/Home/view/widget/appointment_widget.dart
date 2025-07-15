import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.035,
          top: MediaQuery.of(context).size.height * 0.03),
      height: (MediaQuery.of(context).size.height / 932) * 255,
      width: (MediaQuery.of(context).size.width / 430) * 373,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 0.5, color: Static.lightcolor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/student_home2.jpg",
              height: (MediaQuery.of(context).size.height / 932) * 255,
              width: (MediaQuery.of(context).size.width / 430) * 373,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height / 932) * 255,
            width: (MediaQuery.of(context).size.width / 430) * 373,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.2)),
          ),
          Positioned(
              top: (MediaQuery.of(context).size.height / 932) * 40,
              right: (MediaQuery.of(context).size.width / 430) * 13,
              child: SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 120,
                width: (MediaQuery.of(context).size.width / 430) * 195,
                child: Text(
                  "Determine your availability days and schedule your weekly appointments accurately",
                  style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.width / 430) * 18,
                      color: Colors.white,
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
              bottom: (MediaQuery.of(context).size.height / 932) * 35,
              right: (MediaQuery.of(context).size.width / 430) * 40,
              child: CustomButton(
                onPressed: () => GoRouter.of(context).push(AppRouter.appointmentpage),
                  redbl: 15,
                  redbr: 15,
                  redtl: 15,
                  redtr: 15,
                  color: const Color(0xffE0E0E0),
                  side: Colors.black,
                  height: (MediaQuery.of(context).size.height / 932) * 40,
                  width: (MediaQuery.of(context).size.width / 430) * 100,
                  child: Text(
                    "Appointments",
                    style: TextStyle(
                        fontFamily: Static.arialRoundedMTfont,
                        fontSize:
                            (MediaQuery.of(context).size.width / 430) * 12,
                        color: Colors.black),
                  )))
        ],
      ),
    );
  }
}
